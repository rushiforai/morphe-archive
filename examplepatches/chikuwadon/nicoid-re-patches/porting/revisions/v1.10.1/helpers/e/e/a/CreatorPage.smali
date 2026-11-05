.class public final Le/e/a/CreatorPage;
.super Ljava/lang/Object;
.source "CreatorPage.java"


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 25
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static allPages(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 118
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 119
    const/4 v2, 0x1

    .line 120
    :goto_b
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v3

    if-nez v3, :cond_a9

    .line 121
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "&page="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "GET"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "data"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 122
    if-eqz v3, :cond_a1

    const-string v4, "items"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-eqz v6, :cond_a1

    .line 123
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 124
    const/4 v6, 0x0

    :goto_44
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v5, v7, :cond_64

    .line 130
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/16 v5, 0x64

    invoke-static {v3, v4, v2, v5}, Le/e/a/PageRules;->more(Lorg/json/JSONObject;III)Z

    move-result v3

    if-nez v3, :cond_57

    .line 133
    return-object v0

    .line 131
    :cond_57
    if-eqz v6, :cond_5c

    .line 119
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 131
    :cond_5c
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Repeated creator page"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 125
    :cond_64
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_6b

    goto :goto_9e

    .line 126
    :cond_6b
    invoke-static {v7}, Le/e/a/CreatorData;->video(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    .line 127
    const-string v9, "seriesId"

    const-string v10, ""

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "watchId"

    invoke-virtual {v8, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "contentId"

    invoke-virtual {v8, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "id"

    invoke-virtual {v8, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 128
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_93

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    :cond_93
    invoke-virtual {v1, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9e

    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v6, v6, 0x1

    .line 124
    :cond_9e
    :goto_9e
    add-int/lit8 v5, v5, 0x1

    goto :goto_44

    .line 122
    :cond_a1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Missing page items"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 120
    :cond_a9
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method private static category(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .registers 6

    .line 263
    const/16 v0, 0xe

    invoke-static {p0, p1, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0xc

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v2, 0x8

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {p1, v1, v3, v0, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-static {p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    const v0, 0xffffff

    and-int/2addr p0, v0

    const/high16 v0, 0x22000000

    or-int/2addr p0, v0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    return-object p1
.end method

.method private static channelRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 12

    .line 265
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {v1}, Le/e/a/Following190;->sizeRow(Landroid/view/View;)V

    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const-string v5, "\u25b6"

    const/16 v6, 0xe

    invoke-static {v0, v5, v6}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x2c

    invoke-static {v0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v6, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v8

    invoke-static {v0, v8, v7}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v3}, Le/e/a/Following190;->roundAvatar(Landroid/view/View;)V

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v3, "id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "name"

    invoke-virtual {p1, v6, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/4 v6, 0x6

    invoke-static {v0, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7, v7, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v2, v7, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda13;

    invoke-direct {v2, v0, p1}, Le/e/a/CreatorPage$$ExternalSyntheticLambda13;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, v1, p1}, Le/e/a/CreatorPage$$ExternalSyntheticLambda14;-><init>(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    const-string p0, "iconUrl"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v4, v5}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static decorateUser(Landroid/app/Activity;)V
    .registers 4

    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    .line 39
    :cond_b
    const-string v1, "/user/([0-9]+)"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_1c

    return-void

    .line 40
    :cond_1c
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda11;

    invoke-direct {v2, p0, v0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda11;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 47
    return-void
.end method

.method private static enrichChannelIcons(Ljava/util/ArrayList;Le/e/a/NetworkTask;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;",
            "Le/e/a/NetworkTask;",
            ")V"
        }
    .end annotation

    .line 136
    const-string v0, "ch"

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_7
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    const-string v5, "iconUrl"

    if-nez v3, :cond_77

    if-nez v2, :cond_13

    return-void

    :cond_13
    :try_start_13
    const-string v1, "https://api.feed.nicovideo.jp/v1/actors?limit=50"

    const-string v2, "GET"

    invoke-static {v1, v2, v4, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Le/e/a/FollowFeedData;->actors(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_23
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2a

    goto :goto_76

    :cond_2a
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FollowFeedData$Actor;

    iget-object v2, v1, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3b

    iget-object v2, v1, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    goto :goto_4a

    :cond_3b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_4a
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4e
    :goto_4e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_55

    goto :goto_23

    :cond_55
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4e

    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4e

    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_74} :catch_75

    goto :goto_4e

    :catch_75
    move-exception p0

    :goto_76
    return-void

    :cond_77
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    const/4 v2, 0x1

    goto/16 :goto_7
.end method

.method private static followedChannels(Le/e/a/NetworkTask;)Ljava/util/ArrayList;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 99
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 100
    :goto_c
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v4

    if-nez v4, :cond_f0

    .line 101
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "https://public-api.ch.nicovideo.jp/v1/user/followees/channels?limit=100&offset="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "GET"

    const/4 v6, 0x1

    invoke-static {v4, v5, v6, p0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v4

    .line 102
    const-string v5, "data"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 103
    if-nez v4, :cond_44

    if-eqz v6, :cond_44

    const-string v5, "items"

    const-string v7, "followees"

    const-string v8, "channels"

    filled-new-array {v8, v5, v7}, [Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    :goto_41
    const/4 v8, 0x3

    if-lt v7, v8, :cond_45

    :cond_44
    :goto_44
    goto :goto_51

    :cond_45
    aget-object v4, v5, v7

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_4e

    goto :goto_44

    :cond_4e
    add-int/lit8 v7, v7, 0x1

    goto :goto_41

    .line 104
    :goto_51
    if-eqz v4, :cond_e8

    .line 105
    nop

    .line 106
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_56
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v5, v7, :cond_75

    .line 111
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/16 v5, 0x64

    if-ge v4, v5, :cond_68

    .line 114
    invoke-static {v0, p0}, Le/e/a/CreatorPage;->enrichChannelIcons(Ljava/util/ArrayList;Le/e/a/NetworkTask;)V

    return-object v0

    .line 112
    :cond_68
    if-eqz v6, :cond_6d

    .line 99
    add-int/lit8 v3, v3, 0x64

    goto :goto_c

    .line 112
    :cond_6d
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Repeated channel page"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 107
    :cond_75
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_7c

    goto :goto_e4

    :cond_7c
    const-string v8, "channel"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    if-eqz v8, :cond_85

    move-object v7, v8

    .line 108
    :cond_85
    const-string v8, "channelId"

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v10, "id"

    invoke-virtual {v7, v10, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v11, "ch"

    invoke-virtual {v8, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_a8

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 109
    :cond_a8
    const-string v11, "ch[0-9]+"

    invoke-virtual {v8, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_e4

    invoke-virtual {v1, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e4

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v11, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "channelName"

    invoke-virtual {v7, v11, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v11, "name"

    invoke-virtual {v7, v11, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v10, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v10, "thumbnailUrl"

    invoke-virtual {v7, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "iconUrl"

    invoke-virtual {v7, v10, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v10, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    .line 106
    :cond_e4
    :goto_e4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_56

    .line 104
    :cond_e8
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Missing followed channels"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 100
    :cond_f0
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method public static following(Landroid/app/Activity;)V
    .registers 1

    .line 138
    invoke-static {p0}, Le/e/a/Following190;->attach(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 13

    .line 42
    const-string v0, "nicoid_creator_tabs"

    :try_start_2
    const-string v1, "z"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_58

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_13

    goto :goto_58

    .line 43
    :cond_13
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 44
    const/4 v0, 0x2

    new-array v3, v0, [Z

    const/4 v4, 0x1

    aput-boolean v4, v3, v4

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_23
    if-lt v5, v0, :cond_29

    .line 45
    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 46
    goto :goto_61

    .line 44
    :cond_29
    aget-boolean v6, v3, v5

    if-eqz v6, :cond_34

    const-string v7, "\u30b7\u30ea\u30fc\u30ba"

    const-string v8, "Series"

    const-string v9, "\u7cfb\u5217"

    goto :goto_3a

    :cond_34
    const-string v7, "\u30b7\u30e7\u30fc\u30c8"

    const-string v8, "Shorts"

    const-string v9, "\u77ed\u5f71\u7247"

    :goto_3a
    invoke-static {p0, v7, v8, v9}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v8, v4, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Le/e/a/CreatorPage$$ExternalSyntheticLambda33;

    invoke-direct {v8, p0, p1, v6}, Le/e/a/CreatorPage$$ExternalSyntheticLambda33;-><init>(Landroid/app/Activity;Ljava/lang/String;Z)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_55} :catch_59

    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 42
    :cond_58
    :goto_58
    return-void

    .line 46
    :catch_59
    move-exception p0

    const-string p1, "nicoid-creator"

    const-string v0, "Unable to add creator tabs"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_61
    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Ljava/lang/String;ZLandroid/view/View;)V
    .registers 5

    .line 44
    new-instance p3, Landroid/content/Intent;

    invoke-direct {p3}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {p3, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const-string v0, "nicoid_creator_page"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "nicoid_creator_series"

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "nicoid_creator_name"

    const-string p3, ""

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$10(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/util/ArrayList;)V
    .registers 4

    .line 148
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_25

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_25

    .line 149
    :cond_d
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 151
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_1b

    .line 154
    return-void

    .line 151
    :cond_1b
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    .line 152
    invoke-static {p2, p1}, Le/e/a/CreatorPage;->channelRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_14

    .line 148
    :cond_25
    :goto_25
    return-void
.end method

.method static synthetic lambda$11(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 5

    .line 156
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_2a

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_2a

    .line 157
    :cond_d
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string p0, "Unable to load channels. Retry"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u983b\u9053\u3002\u91cd\u8a66"

    const-string v1, "\u30c1\u30e3\u30f3\u30cd\u30eb\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c"

    invoke-static {p1, v1, p0, v0}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    .line 158
    new-instance v0, Le/e/a/CreatorPage$$ExternalSyntheticLambda22;

    invoke-direct {v0, p1, p2}, Le/e/a/CreatorPage$$ExternalSyntheticLambda22;-><init>(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    return-void

    .line 156
    :cond_2a
    :goto_2a
    return-void
.end method

.method static synthetic lambda$12(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 3

    .line 158
    new-instance p2, Le/e/a/NetworkTask;

    invoke-direct {p2}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, p1, p2}, Le/e/a/CreatorPage;->loadFollowingChannels(Landroid/app/Activity;Landroid/widget/LinearLayout;Le/e/a/NetworkTask;)V

    return-void
.end method

.method static synthetic lambda$13(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V
    .registers 18

    .line 170
    move-object v10, p1

    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v3/users/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v6, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 171
    const-string v1, "/videos?selectContentType=short&sortKey=registeredAt&sortOrder=desc&pageSize=100"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 171
    nop

    .line 170
    invoke-static {v0, p1}, Le/e/a/CreatorPage;->allPages(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object v0

    .line 172
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 173
    const/4 v4, 0x0

    if-eqz v0, :cond_7c

    const/4 v5, 0x0

    :goto_34
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lt v5, v8, :cond_3b

    goto :goto_7c

    .line 174
    :cond_3b
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    if-nez v8, :cond_42

    goto :goto_79

    .line 175
    :cond_42
    invoke-static {v8}, Le/e/a/CreatorData;->video(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    .line 176
    const-string v9, "id"

    const-string v11, "contentId"

    const-string v12, "watchId"

    const-string v13, ""

    invoke-virtual {v8, v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 177
    const-string v11, "ss[0-9]+"

    invoke-virtual {v9, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_63

    goto :goto_79

    .line 178
    :cond_63
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v11, "title"

    invoke-virtual {v8, v11, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v8}, Le/e/a/CreatorPage;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    :goto_79
    add-int/lit8 v5, v5, 0x1

    goto :goto_34

    .line 180
    :cond_7c
    :goto_7c
    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, [Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, [Ljava/lang/String;

    .line 181
    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v11, Le/e/a/CreatorPage$$ExternalSyntheticLambda25;

    move-object v1, v11

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object v6, p0

    invoke-direct/range {v1 .. v9}, Le/e/a/CreatorPage$$ExternalSyntheticLambda25;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;[Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;[Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a8} :catch_a9

    .line 190
    goto :goto_b8

    :catch_a9
    move-exception v0

    .line 191
    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda26;

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct {v1, p1, v2, v3}, Le/e/a/CreatorPage$$ExternalSyntheticLambda26;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 195
    :goto_b8
    return-void
.end method

.method static synthetic lambda$14(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;[Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 24

    .line 182
    move-object/from16 v0, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v1, p4

    invoke-virtual/range {p0 .. p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_e0

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v3, p0

    if-ne v2, v3, :cond_e0

    invoke-virtual/range {p2 .. p2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_1e

    goto/16 :goto_e0

    .line 183
    :cond_1e
    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 184
    array-length v2, v10

    if-nez v2, :cond_38

    const-string v1, "No Shorts found"

    const-string v2, "\u6c92\u6709\u77ed\u5f71\u7247"

    const-string v3, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v9, v3, v1, v2}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-static {v9, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    .line 185
    :cond_38
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/CheckBox;

    invoke-direct {v11, v9}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v12, Landroid/widget/CheckBox;

    invoke-direct {v12, v9}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v3, "Continuous playback"

    const-string v4, "\u9023\u7e8c\u64ad\u653e"

    const-string v5, "\u9023\u7d9a\u518d\u751f"

    invoke-static {v9, v5, v3, v4}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "Shuffle playback"

    const-string v4, "\u96a8\u6a5f\u64ad\u653e"

    const-string v5, "\u30b7\u30e3\u30c3\u30d5\u30eb\u518d\u751f"

    invoke-static {v9, v5, v3, v4}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v11}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-static {v12}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v11, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v12, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static/range {p2 .. p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "creator_shorts_play_"

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_9a

    const/4 v6, 0x1

    goto :goto_9b

    :cond_9a
    const/4 v6, 0x0

    :goto_9b
    invoke-virtual {v11, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    const/4 v6, 0x2

    if-ne v3, v6, :cond_a2

    goto :goto_a3

    :cond_a2
    const/4 v5, 0x0

    :goto_a3
    invoke-virtual {v12, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v3, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;

    invoke-direct {v3, v12, v2, v1, v11}, Le/e/a/CreatorPage$$ExternalSyntheticLambda4;-><init>(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;)V

    invoke-virtual {v11, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v3, Le/e/a/CreatorPage$$ExternalSyntheticLambda5;

    invoke-direct {v3, v11, v2, v1, v12}, Le/e/a/CreatorPage$$ExternalSyntheticLambda5;-><init>(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;)V

    invoke-virtual {v12, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 186
    const/4 v13, 0x0

    :goto_b7
    array-length v1, v10

    if-lt v13, v1, :cond_bb

    .line 189
    return-void

    .line 187
    :cond_bb
    move-object/from16 v14, p5

    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lorg/json/JSONObject;

    new-instance v8, Le/e/a/CreatorPage$$ExternalSyntheticLambda6;

    move-object v1, v8

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move v6, v13

    move-object v7, v11

    move-object v9, v8

    move-object v8, v12

    invoke-direct/range {v1 .. v8}, Le/e/a/CreatorPage$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ILandroid/widget/CheckBox;Landroid/widget/CheckBox;)V

    const-string v1, ""

    invoke-static {v0, v15, v1, v9}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 186
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v9, p2

    goto :goto_b7

    .line 182
    :cond_e0
    :goto_e0
    return-void
.end method

.method static synthetic lambda$15(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 7

    .line 185
    const/4 p4, 0x0

    if-eqz p5, :cond_6

    invoke-virtual {p0, p4}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_6
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p5, Ljava/lang/StringBuilder;

    const-string v0, "creator_shorts_play_"

    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p0

    if-eqz p0, :cond_21

    const/4 p4, 0x2

    goto :goto_28

    :cond_21
    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p0

    if-eqz p0, :cond_28

    const/4 p4, 0x1

    :cond_28
    :goto_28
    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$16(Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .registers 7

    .line 185
    const/4 p4, 0x0

    if-eqz p5, :cond_6

    invoke-virtual {p0, p4}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_6
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p5, Ljava/lang/StringBuilder;

    const-string v0, "creator_shorts_play_"

    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    if-eqz p3, :cond_21

    const/4 p4, 0x2

    goto :goto_28

    :cond_21
    invoke-virtual {p0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p0

    if-eqz p0, :cond_28

    const/4 p4, 0x1

    :cond_28
    :goto_28
    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static synthetic lambda$17(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ILandroid/widget/CheckBox;Landroid/widget/CheckBox;)V
    .registers 14

    .line 187
    invoke-virtual {p5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p5

    if-nez p5, :cond_f

    invoke-virtual {p6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p5

    if-nez p5, :cond_f

    const/4 p5, 0x0

    const/4 v5, 0x0

    goto :goto_11

    :cond_f
    const/4 p5, 0x1

    const/4 v5, 0x1

    :goto_11
    invoke-virtual {p6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v6}, Le/e/a/ModernShorts;->openVideos(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;IZZ)Z

    return-void
.end method

.method static synthetic lambda$18(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V
    .registers 5

    .line 191
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_28

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_28

    .line 192
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string p0, "Unable to load Shorts"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u77ed\u5f71\u7247"

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p2, v1, p0, v0}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0xe

    invoke-static {p2, p0, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 193
    :cond_28
    return-void
.end method

.method static synthetic lambda$19(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V
    .registers 7

    .line 205
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/series?pageSize=100"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/CreatorPage;->allPages(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object p0

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_34

    const/4 v1, 0x0

    :goto_21
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_28

    goto :goto_34

    .line 207
    :cond_28
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_31

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 209
    :cond_34
    :goto_34
    sget-object p0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda27;

    invoke-direct {v1, p1, p2, p3, v0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda27;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/util/ArrayList;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3e} :catch_3f

    .line 218
    goto :goto_4a

    :catch_3f
    move-exception p0

    .line 219
    sget-object p0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/CreatorPage$$ExternalSyntheticLambda28;

    invoke-direct {v0, p1, p2, p3}, Le/e/a/CreatorPage$$ExternalSyntheticLambda28;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 222
    :goto_4a
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 6

    .line 66
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GET"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "data"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_20

    const/4 p1, 0x0

    goto :goto_26

    :cond_20
    const-string p1, "user"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_47

    :goto_26
    if-nez p1, :cond_29

    goto :goto_2a

    :cond_29
    move-object p0, p1

    :goto_2a
    const-string p1, ""

    if-nez p0, :cond_2f

    :goto_2e
    goto :goto_3c

    :cond_2f
    :try_start_2f
    const-string v0, "nickname"

    const-string v1, "name"

    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2e

    :goto_3c
    sget-object p0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/CreatorPage$$ExternalSyntheticLambda32;

    invoke-direct {v0, p2, p1, p3}, Le/e/a/CreatorPage$$ExternalSyntheticLambda32;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_46} :catch_47

    goto :goto_48

    :catch_47
    move-exception p0

    :goto_48
    return-void
.end method

.method static synthetic lambda$20(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 13

    .line 210
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_82

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_82

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_14

    goto/16 :goto_82

    :cond_14
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 211
    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_31

    const-string p0, "No series found"

    const-string p3, "\u6c92\u6709\u7cfb\u5217"

    const-string v0, "\u30b7\u30ea\u30fc\u30ba\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p2, v0, p0, p3}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p3, 0xe

    invoke-static {p2, p0, p3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    .line 212
    :cond_31
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_35
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3c

    .line 217
    return-void

    .line 212
    :cond_3c
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 213
    const-string v1, "seriesId"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v1, "[0-9]+"

    invoke-virtual {v8, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_59

    goto :goto_35

    .line 214
    :cond_59
    const-string v1, "name"

    invoke-virtual {v0, v1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p2, v7}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    .line 215
    const v1, 0x800013

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;

    move-object v3, v1

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v3 .. v8}, Le/e/a/CreatorPage$$ExternalSyntheticLambda7;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    goto :goto_35

    .line 210
    :cond_82
    :goto_82
    return-void
.end method

.method static synthetic lambda$21(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .registers 6

    .line 215
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/16 p0, 0x12

    invoke-static {p2, p3, p0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p1, p4}, Le/e/a/VideoDetails;->seriesVideos(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$22(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V
    .registers 5

    .line 219
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_28

    invoke-virtual {p2}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_28

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 220
    const-string p0, "Unable to load series"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217"

    const-string v1, "\u30b7\u30ea\u30fc\u30ba\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p2, v1, p0, v0}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 219
    const/16 v0, 0xe

    invoke-static {p2, p0, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 220
    :cond_28
    return-void
.end method

.method static synthetic lambda$23(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V
    .registers 19

    .line 242
    move-object v8, p0

    const-string v1, ""

    const-string v2, "mylist"

    const-string v3, "data"

    const-string v4, "GET"

    const-string v5, "name"

    :try_start_b
    const-string v0, "https://nvapi.nicovideo.jp/v1/users/me/following/mylists?sampleItemCount=0"

    const/4 v6, 0x1

    invoke-static {v0, v4, v6, p0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 243
    if-eqz v0, :cond_c7

    .line 244
    const-string v7, "items"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    if-nez v7, :cond_27

    const-string v7, "mylists"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    move-object v7, v0

    .line 245
    :cond_27
    if-eqz v7, :cond_b0

    const/4 v0, 0x0

    const/4 v9, 0x0

    :goto_2b
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v9, v0, :cond_34

    move-object v13, p1

    goto/16 :goto_b1

    :cond_34
    invoke-virtual {v7, v9}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_3d

    :goto_3a
    move-object v13, p1

    goto/16 :goto_ac

    :cond_3d
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    if-eqz v10, :cond_44

    goto :goto_45

    :cond_44
    move-object v10, v0

    :goto_45
    const-string v0, "id"

    const-string v11, "mylistId"

    invoke-virtual {v10, v11, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "[0-9]+"

    invoke-virtual {v0, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5a

    goto :goto_3a

    :cond_5a
    const-string v11, "title"

    invoke-virtual {v10, v11, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v5, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_68} :catch_d2

    if-eqz v11, :cond_ab

    :try_start_6a
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "https://nvapi.nicovideo.jp/v2/mylists/"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v11, "?pageSize=1"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4, v6, p0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_92} :catch_93

    goto :goto_3a

    :catch_93
    move-exception v0

    :try_start_94
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v11

    if-nez v11, :cond_a9

    const-string v0, "\u53d6\u5f97\u3067\u304d\u306a\u3044\u30de\u30a4\u30ea\u30b9\u30c8"

    const-string v11, "Unavailable mylist"

    const-string v12, "\u7121\u6cd5\u53d6\u5f97\u7684\u64ad\u653e\u6e05\u55ae"
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_a0} :catch_d2

    move-object v13, p1

    :try_start_a1
    invoke-static {p1, v0, v11, v12}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_ac

    :cond_a9
    move-object v13, p1

    throw v0

    :cond_ab
    move-object v13, p1

    :goto_ac
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_2b

    :cond_b0
    move-object v13, p1

    .line 246
    :goto_b1
    nop

    .line 247
    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v9, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object v6, v7

    move/from16 v7, p4

    invoke-direct/range {v1 .. v7}, Le/e/a/CreatorPage$$ExternalSyntheticLambda15;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONArray;I)V

    invoke-virtual {v0, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 258
    goto :goto_e7

    .line 243
    :cond_c7
    move-object v13, p1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Missing mylists"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d0
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_d0} :catch_d0

    .line 258
    :catch_d0
    move-exception v0

    goto :goto_d4

    :catch_d2
    move-exception v0

    move-object v13, p1

    :goto_d4
    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/CreatorPage$$ExternalSyntheticLambda16;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p2

    move/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Le/e/a/CreatorPage$$ExternalSyntheticLambda16;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/LinearLayout;I)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 259
    :goto_e7
    return-void
.end method

.method static synthetic lambda$24(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONArray;I)V
    .registers 9

    .line 248
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_93

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_e

    goto/16 :goto_93

    :cond_e
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 249
    if-eqz p4, :cond_76

    const/4 p0, 0x0

    :goto_14
    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result p3

    if-lt p0, p3, :cond_1b

    goto :goto_76

    .line 250
    :cond_1b
    invoke-virtual {p4, p0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p3

    if-nez p3, :cond_22

    goto :goto_73

    :cond_22
    const-string v0, "mylist"

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_2b

    move-object p3, v0

    .line 251
    :cond_2b
    const-string v0, "mylistId"

    const-string v1, ""

    invoke-virtual {p3, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "id"

    invoke-virtual {p3, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "[0-9]+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_42

    goto :goto_73

    .line 252
    :cond_42
    const-string v2, "title"

    invoke-virtual {p3, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {p3, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/16 v1, 0x10

    invoke-static {p1, p3, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    const v2, 0x800013

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    invoke-static {v1}, Le/e/a/Following190;->sizeRow(Landroid/view/View;)V

    .line 253
    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda18;

    invoke-direct {v2, p1, v0, p3}, Le/e/a/CreatorPage$$ExternalSyntheticLambda18;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Le/e/a/CreatorPage$$ExternalSyntheticLambda19;

    invoke-direct {p3, p1, v0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda19;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p2}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    .line 249
    :goto_73
    add-int/lit8 p0, p0, 0x1

    goto :goto_14

    .line 255
    :cond_76
    :goto_76
    const/4 p0, 0x1

    if-ne p5, p0, :cond_92

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p0

    if-nez p0, :cond_92

    const-string p0, "No followed mylists"

    const-string p3, "\u6c92\u6709\u5df2\u8ffd\u8e64\u7684\u64ad\u653e\u6e05\u55ae"

    const-string p4, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30de\u30a4\u30ea\u30b9\u30c8\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p1, p4, p0, p3}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p3, 0xe

    invoke-static {p1, p0, p3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 257
    :cond_92
    return-void

    .line 248
    :cond_93
    :goto_93
    return-void
.end method

.method static synthetic lambda$25(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .registers 6

    .line 253
    new-instance p3, Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/mylist/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p3, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p1, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {p3, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "type"

    const/4 v0, 0x5

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "name"

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$26(Landroid/app/Activity;Ljava/lang/String;Landroid/view/View;)Z
    .registers 3

    .line 253
    invoke-static {p0, p1}, Le/e/a/MylistFollow190;->show(Landroid/app/Activity;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$28(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/LinearLayout;I)V
    .registers 7

    .line 258
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_25

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_25

    const-string p0, "Unable to load. Retry"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u3002\u91cd\u8a66"

    const-string v1, "\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c"

    invoke-static {p1, v1, p0, v0}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;

    invoke-direct {p0, p3, p2, p1, p4}, Le/e/a/CreatorPage$$ExternalSyntheticLambda12;-><init>(Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/app/Activity;I)V

    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_25
    return-void
.end method

.method static synthetic lambda$29(Landroid/widget/LinearLayout;Landroid/widget/Button;Landroid/app/Activity;ILandroid/view/View;)V
    .registers 5

    .line 258
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    invoke-static {p2, p0, p3}, Le/e/a/CreatorPage;->loadMylists(Landroid/app/Activity;Landroid/widget/LinearLayout;I)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8

    .line 66
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_28

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_28

    :cond_d
    :try_start_d
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v0, "b"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/CharSequence;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v4

    invoke-virtual {p0, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_26} :catch_27

    goto :goto_28

    :catch_27
    move-exception p0

    :cond_28
    :goto_28
    return-void
.end method

.method static synthetic lambda$30(Landroid/view/View;Landroid/content/Context;Lorg/json/JSONObject;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/DialogInterface;I)V
    .registers 15

    .line 264
    const/4 p5, 0x0

    invoke-virtual {p0, p5}, Landroid/view/View;->setEnabled(Z)V

    new-instance p5, Le/e/a/NetworkTask;

    invoke-direct {p5}, Le/e/a/NetworkTask;-><init>()V

    sget-object p6, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;

    move-object v0, v7

    move-object v1, p1

    move-object v2, p2

    move-object v3, p5

    move-object v4, p3

    move-object v5, p4

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Le/e/a/CreatorPage$$ExternalSyntheticLambda17;-><init>(Landroid/content/Context;Lorg/json/JSONObject;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {p5, p6, v7}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$31(Landroid/content/Context;Lorg/json/JSONObject;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 12

    .line 264
    :try_start_0
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    const-string v0, "https://public-api.ch.nicovideo.jp/v1/user/follow"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "channelId"

    const-string v3, "id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "^ch"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "mode"

    const-string v2, "delete"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {v0, p1, p2}, Le/e/a/ModernPosting;->jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2d} :catch_30

    const/4 p1, 0x1

    const/4 v2, 0x1

    goto :goto_4f

    :catch_30
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Unable to unfollow channel: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "nicoid-creator"

    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    const/4 v2, 0x0

    :goto_4f
    sget-object p1, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;

    move-object v0, p2

    move-object v1, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;-><init>(Landroid/app/Activity;ZLandroid/widget/LinearLayout;Landroid/view/View;Landroid/content/Context;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$32(Landroid/app/Activity;ZLandroid/widget/LinearLayout;Landroid/view/View;Landroid/content/Context;)V
    .registers 6

    .line 264
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_9

    return-void

    :cond_9
    const/4 p0, 0x1

    if-eqz p1, :cond_31

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-ltz p1, :cond_45

    add-int/2addr p1, p0

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p0

    if-ge p1, p0, :cond_2d

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v0, 0x2

    invoke-static {p4, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p4

    if-gt p0, p4, :cond_2d

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    :cond_2d
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto :goto_45

    :cond_31
    invoke-virtual {p3, p0}, Landroid/view/View;->setEnabled(Z)V

    const-string p1, "Unable to unfollow"

    const-string p2, "\u53d6\u6d88\u8ffd\u8e64\u5931\u6557"

    const-string p3, "\u30d5\u30a9\u30ed\u30fc\u89e3\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p4, p3, p1, p2}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p4, p1, p0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_45
    :goto_45
    return-void
.end method

.method static synthetic lambda$33(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 3

    .line 265
    invoke-static {p0, p1}, Le/e/a/ChannelPage;->launch(Landroid/content/Context;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic lambda$34(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)Z
    .registers 4

    .line 265
    invoke-static {p0, p1, p2}, Le/e/a/CreatorPage;->unfollowChannel(Landroid/widget/LinearLayout;Landroid/view/View;Lorg/json/JSONObject;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 4

    .line 74
    invoke-static {p0, p1, p2}, Le/e/a/CreatorPage;->loadShorts(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 4

    .line 75
    invoke-static {p0, p1, p2}, Le/e/a/CreatorPage;->loadSeries(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static synthetic lambda$6(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 90
    :try_start_0
    invoke-static {p0}, Le/e/a/CreatorPage;->followedChannels(Le/e/a/NetworkTask;)Ljava/util/ArrayList;

    move-result-object v0

    .line 91
    sget-object v1, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1, p2, v0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda0;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 92
    goto :goto_1a

    :catch_f
    move-exception v0

    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/CreatorPage$$ExternalSyntheticLambda1;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 93
    :goto_1a
    return-void
.end method

.method static synthetic lambda$7(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/util/ArrayList;)V
    .registers 5

    .line 91
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_3f

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_3f

    :cond_d
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_2a

    const-string p0, "No followed channels found"

    const-string p3, "\u6c92\u6709\u5df2\u8ffd\u8e64\u7684\u983b\u9053"

    const-string v0, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30c1\u30e3\u30f3\u30cd\u30eb\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p1, v0, p0, p3}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 p3, 0xe

    invoke-static {p1, p0, p3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void

    :cond_2a
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_35

    return-void

    :cond_35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/json/JSONObject;

    invoke-static {p2, p1}, Le/e/a/CreatorPage;->channelRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_2e

    :cond_3f
    :goto_3f
    return-void
.end method

.method static synthetic lambda$8(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 5

    .line 92
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_22

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_22

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string p0, "Unable to load followed channels"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u5df2\u8ffd\u8e64\u983b\u9053"

    const-string v1, "\u30c1\u30e3\u30f3\u30cd\u30eb\u4e00\u89a7\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1, v1, p0, v0}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0xe

    invoke-static {p1, p0, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_22
    return-void
.end method

.method static synthetic lambda$9(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 146
    :try_start_0
    invoke-static {p0}, Le/e/a/CreatorPage;->followedChannels(Le/e/a/NetworkTask;)Ljava/util/ArrayList;

    move-result-object v0

    .line 147
    sget-object v1, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda29;

    invoke-direct {v2, p0, p1, p2, v0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda29;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_f

    .line 155
    goto :goto_1a

    :catch_f
    move-exception v0

    sget-object v0, Le/e/a/CreatorPage;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 160
    :goto_1a
    return-void
.end method

.method public static launch(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 32
    if-eqz p1, :cond_2a

    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_2a

    .line 33
    :cond_b
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 34
    const-string v1, "nicoid_creator_page"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    if-nez p2, :cond_20

    const-string p2, ""

    :cond_20
    const-string v0, "nicoid_creator_name"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    return-void

    .line 32
    :cond_2a
    :goto_2a
    return-void
.end method

.method static loadFollowingChannels(Landroid/app/Activity;Landroid/widget/LinearLayout;Le/e/a/NetworkTask;)V
    .registers 6

    .line 141
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 142
    const-string v0, "Loading channels\u2026"

    const-string v1, "\u8f09\u5165\u983b\u9053\u2026"

    const-string v2, "\u30c1\u30e3\u30f3\u30cd\u30eb\u3092\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v2, v0, v1}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    .line 143
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 144
    sget-object v0, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/CreatorPage$$ExternalSyntheticLambda31;

    invoke-direct {v1, p2, p0, p1}, Le/e/a/CreatorPage$$ExternalSyntheticLambda31;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {p2, v0, v1}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 161
    return-void
.end method

.method static loadMylists(Landroid/app/Activity;Landroid/widget/LinearLayout;I)V
    .registers 12

    .line 237
    const-string v0, "Loading\u2026"

    const-string v1, "\u8f09\u5165\u4e2d\u2026"

    const-string v2, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v2, v0, v1}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 238
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 239
    new-instance v1, Le/e/a/CreatorPage$1;

    invoke-direct {v1, v0}, Le/e/a/CreatorPage$1;-><init>(Le/e/a/NetworkTask;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 240
    sget-object v7, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;

    move-object v1, v8

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move v6, p2

    invoke-direct/range {v1 .. v6}, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    invoke-virtual {v0, v7, v8}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 260
    return-void
.end method

.method private static loadSeries(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 199
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Le/e/a/NetworkTask;

    if-eqz v0, :cond_f

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NetworkTask;

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 200
    :goto_10
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    .line 201
    :cond_15
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "Loading\u2026"

    const-string v1, "\u8f09\u5165\u4e2d\u2026"

    const-string v2, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v2, v0, v1}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 202
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 203
    sget-object v1, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda20;

    invoke-direct {v2, p1, v0, p2, p0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda20;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 223
    return-void
.end method

.method private static loadShorts(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V
    .registers 6

    .line 164
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Le/e/a/NetworkTask;

    if-eqz v0, :cond_f

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NetworkTask;

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 165
    :goto_10
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    .line 166
    :cond_15
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "Loading\u2026"

    const-string v1, "\u8f09\u5165\u4e2d\u2026"

    const-string v2, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v2, v0, v1}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    invoke-static {p0, v0, v1}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 167
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 168
    sget-object v1, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1, v0, p2, p0}, Le/e/a/CreatorPage$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 196
    return-void
.end method

.method public static open(Landroid/app/Activity;)Z
    .registers 14

    .line 50
    invoke-static {p0}, Le/e/a/Ranking190;->open(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 51
    :cond_8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "nicoid_followed_channels"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-static {p0}, Le/e/a/CreatorPage;->openChannels(Landroid/app/Activity;)Z

    move-result p0

    return p0

    .line 52
    :cond_1a
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "nicoid_followed_mylists"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-static {p0}, Le/e/a/CreatorPage;->openMylists(Landroid/app/Activity;)Z

    move-result p0

    return p0

    .line 53
    :cond_2b
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "nicoid_creator_page"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    if-nez v0, :cond_38

    return v3

    .line 55
    :cond_38
    const-string v2, "[0-9]+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_44

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return v1

    .line 57
    :cond_44
    :try_start_44
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-static {v4}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "y"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "H"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "I"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 60
    const-string v5, "O"

    invoke-static {p0, v5}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 61
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "nicoid_creator_name"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_82} :catch_165

    .line 62
    const-string v7, "\u6295\u7a3f\u8005"

    if-eqz v6, :cond_8f

    :try_start_86
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_8d

    goto :goto_8f

    :cond_8d
    move-object v8, v6

    goto :goto_95

    :cond_8f
    :goto_8f
    const-string v8, "Creator"

    invoke-static {p0, v7, v8, v7}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    :goto_95
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "b"

    new-array v11, v1, [Ljava/lang/Class;

    const-class v12, Ljava/lang/CharSequence;

    aput-object v12, v11, v3

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    new-array v10, v1, [Ljava/lang/Object;

    aput-object v8, v10, v3

    invoke-virtual {v9, v5, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "c"

    new-array v10, v1, [Ljava/lang/Class;

    const-class v11, Ljava/lang/CharSequence;

    aput-object v11, v10, v3

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    new-array v9, v1, [Ljava/lang/Object;

    const-string v10, "\u30b7\u30e7\u30fc\u30c8\u30fb\u30b7\u30ea\u30fc\u30ba"

    const-string v11, "Shorts \u00b7 Series"

    const-string v12, "\u77ed\u5f71\u7247\u30fb\u7cfb\u5217"

    invoke-static {p0, v10, v11, v12}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v3

    invoke-virtual {v8, v5, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    if-eqz v6, :cond_e1

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_e1

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_e1

    invoke-virtual {v6, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f0

    :cond_e1
    new-instance v2, Le/e/a/NetworkTask;

    invoke-direct {v2}, Le/e/a/NetworkTask;-><init>()V

    sget-object v6, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Le/e/a/CreatorPage$$ExternalSyntheticLambda8;

    invoke-direct {v7, v0, v2, p0, v5}, Le/e/a/CreatorPage$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v2, v6, v7}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 67
    :cond_f0
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x10

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 68
    const-string v5, "\u30b7\u30e7\u30fc\u30c8"

    const-string v6, "Shorts"

    const-string v7, "\u77ed\u5f71\u7247"

    invoke-static {p0, v5, v6, v7}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 69
    const-string v6, "\u30b7\u30ea\u30fc\u30ba"

    const-string v7, "Series"

    const-string v8, "\u7cfb\u5217"

    invoke-static {p0, v6, v7, v8}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    .line 70
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v7, v3, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v3, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 72
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 73
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v8, v10, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, v0, v7}, Le/e/a/CreatorPage$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    new-instance v2, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, v0, v7}, Le/e/a/CreatorPage$$ExternalSyntheticLambda10;-><init>(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v4, "nicoid_creator_series"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_161

    invoke-static {p0, v0, v7}, Le/e/a/CreatorPage;->loadSeries(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V

    goto :goto_164

    :cond_161
    invoke-static {p0, v0, v7}, Le/e/a/CreatorPage;->loadShorts(Landroid/app/Activity;Ljava/lang/String;Landroid/widget/LinearLayout;)V
    :try_end_164
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_164} :catch_165

    :goto_164
    return v1

    .line 77
    :catch_165
    move-exception v0

    .line 78
    const-string v2, "nicoid-creator"

    const-string v4, "Unable to open creator page"

    invoke-static {v2, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    const-string v0, "\u6295\u7a3f\u8005\u30da\u30fc\u30b8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    const-string v2, "\u7121\u6cd5\u958b\u555f\u6295\u7a3f\u8005\u9801\u9762"

    invoke-static {p0, v0, v4, v2}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v3}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 80
    return v1
.end method

.method private static openChannels(Landroid/app/Activity;)Z
    .registers 10

    .line 86
    const/4 v0, 0x1

    :try_start_1
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "H"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "I"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 88
    const-string v2, "O"

    invoke-static {p0, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30c1\u30e3\u30f3\u30cd\u30eb"

    const-string v7, "Followed channels"

    const-string v8, "\u5df2\u8ffd\u8e64\u7684\u983b\u9053"

    invoke-static {p0, v6, v7, v8}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "c"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v5, v3

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v2, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    const-string v3, "Loading\u2026"

    const-string v4, "\u8f09\u5165\u4e2d\u2026"

    invoke-static {p0, v2, v3, v4}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe

    invoke-static {p0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Le/e/a/NetworkTask;

    invoke-direct {v2}, Le/e/a/NetworkTask;-><init>()V

    sget-object v3, Le/e/a/CreatorPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Le/e/a/CreatorPage$$ExternalSyntheticLambda21;

    invoke-direct {v4, v2, p0, v1}, Le/e/a/CreatorPage$$ExternalSyntheticLambda21;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v2, v3, v4}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_92} :catch_93

    .line 93
    return v0

    .line 94
    :catch_93
    move-exception p0

    const-string v1, "nicoid-creator"

    const-string v2, "Unable to open followed channels"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private static openMylists(Landroid/app/Activity;)Z
    .registers 10

    .line 228
    const/4 v0, 0x1

    :try_start_1
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    .line 229
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 230
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "H"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v4, "I"

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 231
    const-string v2, "O"

    invoke-static {p0, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u306e\u30de\u30a4\u30ea\u30b9\u30c8"

    const-string v7, "Followed mylists"

    const-string v8, "\u5df2\u8ffd\u8e64\u7684\u64ad\u653e\u6e05\u55ae"

    invoke-static {p0, v6, v7, v8}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "c"

    new-array v6, v0, [Ljava/lang/Class;

    const-class v7, Ljava/lang/CharSequence;

    aput-object v7, v6, v3

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v5, v3

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    invoke-static {p0, v4, v0}, Le/e/a/CreatorPage;->loadMylists(Landroid/app/Activity;Landroid/widget/LinearLayout;I)V
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_8d} :catch_8e

    return v0

    .line 234
    :catch_8e
    move-exception p0

    const-string v1, "nicoid-creator"

    const-string v2, "Unable to open followed mylists"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private static thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 4

    .line 268
    const-string v0, "thumbnailUrl"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "thumbnail"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 269
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_28

    if-eqz p0, :cond_28

    const-string v0, "middleUrl"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "largeUrl"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 270
    :cond_28
    return-object v0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 29
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static unfollowChannel(Landroid/widget/LinearLayout;Landroid/view/View;Lorg/json/JSONObject;)V
    .registers 14

    .line 264
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    instance-of v0, v6, Landroid/app/Activity;

    const/4 v7, 0x0

    if-eqz v0, :cond_e

    move-object v0, v6

    check-cast v0, Landroid/app/Activity;

    move-object v4, v0

    goto :goto_f

    :cond_e
    move-object v4, v7

    :goto_f
    invoke-static {v6}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "name"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Unfollow this channel?"

    const-string v3, "\u53d6\u6d88\u8ffd\u8e64\u6b64\u983b\u9053\uff1f"

    const-string v5, "\u30d5\u30a9\u30ed\u30fc\u3092\u89e3\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v6, v5, v2, v3}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const-string v0, "Unfollow"

    const-string v1, "\u53d6\u6d88\u8ffd\u8e64"

    const-string v2, "\u30d5\u30a9\u30ed\u30fc\u89e3\u9664"

    invoke-static {v6, v2, v0, v1}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;

    move-object v0, v10

    move-object v1, p1

    move-object v2, v6

    move-object v3, p2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/CreatorPage$$ExternalSyntheticLambda3;-><init>(Landroid/view/View;Landroid/content/Context;Lorg/json/JSONObject;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Cancel"

    const-string p2, "\u53d6\u6d88"

    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v6, v0, p1, p2}, Le/e/a/CreatorPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
