.class public final Le/e/a/VideoDetails;
.super Ljava/lang/Object;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoDetails$FollowIcon;,
        Le/e/a/VideoDetails$SeriesPage;,
        Le/e/a/VideoDetails$TreePage;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 5
    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 3

    .line 6
    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 6
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$4()Landroid/os/Handler;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$5(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 3

    .line 17
    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$6(Landroid/content/Context;I)I
    .registers 2

    .line 6
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$7(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 2

    .line 13
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method public static bind(Ljava/lang/Object;Landroid/view/View;)V
    .registers 18

    .line 11
    move-object/from16 v1, p1

    const-string v2, "nicoid_details"

    const-string v3, "nicoid_follow"

    const-string v0, "video"

    const-string v4, ""

    const-string v5, "id"

    if-nez v1, :cond_f

    return-void

    :cond_f
    :try_start_f
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "i0"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    move-object/from16 v7, p0

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Bundle;

    if-nez v6, :cond_2b

    return-void

    :cond_2b
    const-string v7, "videoId"

    invoke-virtual {v6, v7, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "(?:sm|nm|so)?[0-9]+"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_37} :catch_1cc

    if-nez v8, :cond_3a

    return-void

    :cond_3a
    :try_start_3a
    const-string v8, "e.e.a.ModernPlayback"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const-string v9, "latestWatch"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    if-eqz v8, :cond_68

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_68

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    invoke-static {v8, v6}, Le/e/a/VideoDetails;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_66} :catch_67

    goto :goto_68

    :catch_67
    move-exception v0

    :cond_68
    :goto_68
    const v0, 0x7f08007a

    :try_start_6b
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1cb

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    instance-of v8, v8, Landroid/widget/LinearLayout;

    if-nez v8, :cond_7b

    goto/16 :goto_1cb

    :cond_7b
    const v8, 0x7f0801c7

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    const/16 v9, 0x8

    const/4 v10, 0x0

    if-eqz v8, :cond_96

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    if-eqz v11, :cond_96

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    iput v10, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    :cond_96
    const v8, 0x7f0801c8

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    instance-of v11, v8, Landroid/widget/LinearLayout;
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_9f} :catch_1cc

    const-string v12, "[0-9]+"

    if-eqz v11, :cond_139

    :try_start_a3
    check-cast v8, Landroid/widget/LinearLayout;

    invoke-virtual {v8, v3}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v11
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_a9} :catch_1cc

    const-string v14, "video_info_follow_button"

    if-nez v11, :cond_123

    :try_start_ad
    const-string v11, "details_owner"

    invoke-static {v6, v11}, Le/e/a/VideoDetails;->json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v15, "videoUserId"

    invoke-virtual {v6, v15, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_139

    new-instance v15, Le/e/a/VideoDetails$FollowIcon;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v15, v13}, Le/e/a/VideoDetails$FollowIcon;-><init>(Landroid/content/Context;)V

    invoke-virtual {v15, v3}, Le/e/a/VideoDetails$FollowIcon;->setTag(Ljava/lang/Object;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    const/16 v10, 0x30

    invoke-static {v13, v10}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v10}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v3, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v9, 0x10

    iput v9, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    const/16 v10, 0x8

    invoke-static {v9, v10}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13, v10}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v10, 0x0

    invoke-virtual {v3, v9, v10, v13, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v8, v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v8, 0x1

    invoke-interface {v3, v14, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_114

    const/4 v9, 0x0

    goto :goto_116

    :cond_114
    const/16 v9, 0x8

    :goto_116
    invoke-virtual {v15, v9}, Le/e/a/VideoDetails$FollowIcon;->setVisibility(I)V

    invoke-virtual {v15}, Le/e/a/VideoDetails$FollowIcon;->getVisibility()I

    move-result v3

    if-nez v3, :cond_139

    invoke-static {v15, v4, v11}, Le/e/a/VideoDetails;->followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;)V

    goto :goto_139

    :cond_123
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v3, v14, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_134

    const/4 v9, 0x0

    goto :goto_136

    :cond_134
    const/16 v9, 0x8

    :goto_136
    invoke-virtual {v11, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_139
    :goto_139
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_146

    return-void

    :cond_146
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "\u30b7\u30ea\u30fc\u30ba"

    const-string v4, "Series"

    const-string v8, "\u7cfb\u5217"

    invoke-static {v2, v4, v8}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0x12

    invoke-static {v0, v2, v4}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "details_series"

    invoke-static {v6, v2}, Le/e/a/VideoDetails;->json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_18a

    invoke-static {v0, v2}, Le/e/a/VideoDetails;->renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_18d

    :cond_18a
    invoke-static {v0, v7}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    :goto_18d
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "\u89aa\u4f5c\u54c1\u30fb\u5b50\u4f5c\u54c1"

    const-string v5, "Parent and child works"

    const-string v6, "\u7236\u4f5c\u54c1\u8207\u5b50\u4f5c\u54c1"

    invoke-static {v2, v5, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v4}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string v4, "parents"

    const/4 v5, 0x0

    aput-object v4, v2, v5

    const-string v4, "children"

    const/4 v6, 0x1

    aput-object v4, v2, v6

    const/4 v10, 0x0

    :goto_1b0
    if-lt v10, v0, :cond_1b3

    goto :goto_1cd

    :cond_1b3
    aget-object v4, v2, v10

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Le/e/a/VideoDetails$TreePage;

    invoke-direct {v6, v5, v7, v4}, Le/e/a/VideoDetails$TreePage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6}, Le/e/a/VideoDetails$TreePage;->load()V
    :try_end_1c8
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_1c8} :catch_1cc

    add-int/lit8 v10, v10, 0x1

    goto :goto_1b0

    :cond_1cb
    :goto_1cb
    return-void

    :catch_1cc
    move-exception v0

    :goto_1cd
    return-void
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 6
    invoke-static {p0, p1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method public static capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 8

    .line 8
    if-eqz p0, :cond_33

    if-nez p1, :cond_5

    goto :goto_33

    :cond_5
    const-string v0, "series"

    const-string v1, "owner"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_e
    const/4 v2, 0x2

    if-lt v1, v2, :cond_12

    return-void

    :cond_12
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_30

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "details_"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_33
    :goto_33
    return-void
.end method

.method static cookie()Ljava/lang/String;
    .registers 9

    .line 30
    const-string v0, ""

    :try_start_2
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_16

    goto :goto_33

    :cond_16
    const-string v4, "a"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-string v7, "org.apache.http.client.CookieStore"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v4, v5, [Ljava/lang/Object;

    aput-object v2, v4, v8

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_32} :catch_34

    move-object v0, v1

    :goto_33
    return-object v0

    :catch_34
    move-exception v1

    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 6
    invoke-static {p0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method private static followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 15

    .line 35
    const-string v0, "isFollowing"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v2, 0x1

    new-array v2, v2, [Z

    aput-boolean v0, v2, v1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "https://user-follow-api.nicovideo.jp/v1/user/followees/niconico-users/"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ".json"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 36
    new-instance v9, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;

    invoke-direct {v9, p0, v2}, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;-><init>(Landroid/widget/Button;[Z)V

    invoke-interface {v9}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v1}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    sget-object v10, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v11, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;

    move-object v3, v11

    move-object v4, v0

    move-object v5, v1

    move-object v6, v2

    move-object v7, v9

    move-object v8, p0

    invoke-direct/range {v3 .. v8}, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {v1, v10, v11}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 37
    new-instance v1, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;

    move-object v3, v1

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, v0

    move-object v8, v2

    invoke-direct/range {v3 .. v9}, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;-><init>(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;[ZLjava/lang/Runnable;)V

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    return-void
.end method

.method static initializeCookies(Landroid/content/Context;)V
    .registers 9

    .line 7
    const-string v0, "b"

    :try_start_2
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_14

    return-void

    :cond_14
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "nologin"

    const/4 v4, 0x0

    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_22

    return-void

    :cond_22
    const-string v2, "save_cookie"

    const-string v5, ""

    invoke-interface {p0, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4c

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v4

    invoke-virtual {v1, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p0, v1, v4

    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, v3, p0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4a} :catch_4b

    goto :goto_4c

    :catch_4b
    move-exception p0

    :cond_4c
    :goto_4c
    return-void
.end method

.method private static json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4

    .line 9
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{}"

    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b} :catch_c

    return-object v0

    :catch_c
    move-exception p0

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    return-object p0
.end method

.method static label(Landroid/widget/Button;Ljava/lang/String;Z)V
    .registers 3

    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    instance-of p1, p0, Le/e/a/VideoDetails$FollowIcon;

    if-eqz p1, :cond_f

    check-cast p0, Le/e/a/VideoDetails$FollowIcon;

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$FollowIcon;->state(Z)V

    :cond_f
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 7

    .line 13
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?responseType=json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Le/e/a/VideoDetails;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "series"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "video"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/VideoDetails$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, p2, v1}, Le/e/a/VideoDetails$$ExternalSyntheticLambda0;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_7b

    :cond_39
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3f} :catch_3f

    :catch_3f
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Series metadata request failed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_62

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_64

    :cond_62
    const-string v0, "invalid response"

    :goto_64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidDetails"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1, p3, p2, p0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_7b
    return-void
.end method

.method static synthetic lambda$1(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 5

    .line 13
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-eqz p0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    if-eqz p2, :cond_1f

    const-string p0, "id"

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto :goto_1f

    :cond_1b
    invoke-static {p1, p2}, Le/e/a/VideoDetails;->renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_36

    :cond_1f
    :goto_1f
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p2, "Not part of a series"

    const-string v0, "\u672a\u52a0\u5165\u7cfb\u5217"

    const-string v1, "\u30b7\u30ea\u30fc\u30ba\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-static {v1, p2, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0xe

    invoke-static {p0, p2, v0}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_36
    return-void
.end method

.method static synthetic lambda$10(Ljava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/Runnable;Landroid/widget/Button;)V
    .registers 7

    .line 37
    const/4 v0, 0x0

    :try_start_1
    aget-boolean v0, p1, v0

    if-eqz v0, :cond_8

    const-string v0, "DELETE"

    goto :goto_a

    :cond_8
    const-string v0, "POST"

    :goto_a
    const/4 v1, 0x1

    invoke-static {p0, v0, v1, p2}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;

    invoke-direct {v0, p2, p1, p3, p4}, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;-><init>(Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_18} :catch_19

    goto :goto_24

    :catch_19
    move-exception p0

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;

    invoke-direct {p1, p2, p4}, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;-><init>(Le/e/a/NetworkTask;Landroid/widget/Button;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_24
    return-void
.end method

.method static synthetic lambda$11(Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 6

    .line 37
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_13

    const/4 p0, 0x0

    aget-boolean v0, p1, p0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    aput-boolean v0, p1, p0

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_13
    return-void
.end method

.method static synthetic lambda$12(Le/e/a/NetworkTask;Landroid/widget/Button;)V
    .registers 4

    .line 37
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_20

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Unable to change follow status"

    const-string v0, "\u7121\u6cd5\u8b8a\u66f4\u8ffd\u8e64\u72c0\u614b"

    const-string v1, "\u30d5\u30a9\u30ed\u30fc\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_20
    return-void
.end method

.method static synthetic lambda$2(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 6

    .line 13
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-eqz p0, :cond_7

    return-void

    :cond_7
    const-string p0, "Unable to load series"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217\u8cc7\u8a0a"

    const-string v1, "\u30b7\u30ea\u30fc\u30ba\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, p0, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Retry"

    const-string v0, "\u91cd\u8a66"

    const-string v1, "\u518d\u8a66\u884c"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;

    invoke-direct {p1, p2, p3}, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 13
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$4(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 3

    .line 17
    invoke-static {p1}, Le/e/a/VideoDetails;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$5(Landroid/widget/Button;[Z)V
    .registers 6

    .line 36
    const/4 v0, 0x0

    aget-boolean v1, p1, v0

    if-eqz v1, :cond_c

    const-string v1, "Following"

    const-string v2, "\u8ffd\u8e64\u4e2d"

    const-string v3, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    goto :goto_12

    :cond_c
    const-string v1, "Follow"

    const-string v2, "\u8ffd\u8e64"

    const-string v3, "\u30d5\u30a9\u30ed\u30fc"

    :goto_12
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aget-boolean p1, p1, v0

    invoke-static {p0, v1, p1}, Le/e/a/VideoDetails;->label(Landroid/widget/Button;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 13

    .line 36
    const-string v0, "following"

    :try_start_2
    const-string v1, "GET"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_2b

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/VideoDetails$$ExternalSyntheticLambda9;

    move-object v2, v0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Le/e/a/VideoDetails$$ExternalSyntheticLambda9;-><init>(Le/e/a/NetworkTask;[ZZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3c

    :cond_2b
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_31} :catch_31

    :catch_31
    move-exception p0

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/VideoDetails$$ExternalSyntheticLambda10;

    invoke-direct {p2, p1, p4}, Le/e/a/VideoDetails$$ExternalSyntheticLambda10;-><init>(Le/e/a/NetworkTask;Landroid/widget/Button;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_3c
    return-void
.end method

.method static synthetic lambda$7(Le/e/a/NetworkTask;[ZZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 5

    .line 36
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x0

    aput-boolean p2, p1, p0

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    invoke-virtual {p4, p0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_10
    return-void
.end method

.method static synthetic lambda$8(Le/e/a/NetworkTask;Landroid/widget/Button;)V
    .registers 4

    .line 36
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_17

    const-string p0, "Retry"

    const-string v0, "\u91cd\u8a66"

    const-string v1, "\u518d\u8a66\u884c"

    invoke-static {v1, p0, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_17
    return-void
.end method

.method static synthetic lambda$9(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;[ZLjava/lang/Runnable;Landroid/view/View;)V
    .registers 13

    .line 37
    invoke-virtual {p0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object p6

    const-string v0, "Retry"

    const-string v1, "\u91cd\u8a66"

    const-string v2, "\u518d\u8a66\u884c"

    invoke-static {v2, v0, v1}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_18

    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    :cond_18
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object p1

    const-string p2, "user_session="

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 p2, 0x0

    if-nez p1, :cond_3b

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Sign in required"

    const-string p3, "\u8acb\u5148\u767b\u5165"

    const-string p4, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {p4, p1, p3}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_3b
    invoke-virtual {p0, p2}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance p1, Le/e/a/NetworkTask;

    invoke-direct {p1}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    sget-object p2, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance p6, Le/e/a/VideoDetails$$ExternalSyntheticLambda3;

    move-object v0, p6

    move-object v1, p3

    move-object v2, p4

    move-object v3, p1

    move-object v4, p5

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/VideoDetails$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {p1, p2, p6}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 6

    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Loading\u2026"

    const-string v2, "\u8f09\u5165\u4e2d\u2026"

    const-string v3, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-static {v0, v1, v2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v1}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    new-instance v2, Le/e/a/VideoDetails$1;

    invoke-direct {v2, v1, v0, p0, p1}, Le/e/a/VideoDetails$1;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v2, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;

    invoke-direct {v3, p1, v1, p0, v0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    invoke-virtual {v1, v2, v3}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static open(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 10
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "https://(?:www\\.)?nicovideo\\.jp/watch/(?:sm|nm|so)?[0-9]+.*"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_18

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    :cond_18
    :try_start_18
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_1c

    goto :goto_2f

    :catch_1c
    move-exception p1

    const-string p1, "Unable to open page"

    const-string v0, "\u7121\u6cd5\u958b\u555f\u9801\u9762"

    const-string v1, "\u30da\u30fc\u30b8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_2f
    return-void
.end method

.method private static renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 10

    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_4d

    const-string v1, "next"

    const-string v2, "prev"

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_24
    const/4 v4, 0x2

    if-lt v3, v4, :cond_28

    goto :goto_4d

    :cond_28
    aget-object v4, v1, v3

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_4a

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3d

    const-string v4, "Previous video"

    const-string v6, "\u4e0a\u4e00\u90e8\u5f71\u7247"

    const-string v7, "\u524d\u306e\u52d5\u753b"

    goto :goto_43

    :cond_3d
    const-string v4, "Next video"

    const-string v6, "\u4e0b\u4e00\u90e8\u5f71\u7247"

    const-string v7, "\u6b21\u306e\u52d5\u753b"

    :goto_43
    invoke-static {v7, v4, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v5, v4}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    :cond_4a
    add-int/lit8 v3, v3, 0x1

    goto :goto_24

    :cond_4d
    :goto_4d
    new-instance v0, Le/e/a/VideoDetails$SeriesPage;

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Le/e/a/VideoDetails$SeriesPage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 31
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    const-string v0, "https://www.nicovideo.jp"

    const-string v1, "https://www.nicovideo.jp/watch/"

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-virtual {p3, v2}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v3

    if-eqz v3, :cond_142

    :try_start_15
    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 p1, 0x2710

    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "Accept"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2f

    const-string v4, "*/*"

    goto :goto_31

    :cond_2f
    const-string v4, "application/json"

    :goto_31
    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_41

    const-string p0, "User-Agent"

    const-string v1, "Mozilla/5.0"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_41
    const-string p0, "X-Frontend-Id"

    const-string v1, "6"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Version"

    const-string v1, "0"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Request-With"

    invoke-virtual {v2, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Origin"

    invoke-virtual {v2, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_64

    const-string p0, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p0, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_64
    .catchall {:try_start_15 .. :try_end_64} :catchall_13a

    :cond_64
    const/4 p0, 0x0

    const-string p2, "UTF-8"

    if-eqz p4, :cond_9b

    :try_start_69
    invoke-virtual {p4, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p4

    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v0, "Content-Type"

    const-string v1, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-virtual {v2, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    array-length v0, p4

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_7c
    .catchall {:try_start_69 .. :try_end_7c} :catchall_13a

    :try_start_7c
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0
    :try_end_80
    .catchall {:try_start_7c .. :try_end_80} :catchall_90

    :try_start_80
    invoke-virtual {v0, p4}, Ljava/io/OutputStream;->write([B)V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_89

    if-eqz v0, :cond_9b

    :try_start_85
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    goto :goto_9b

    :catchall_89
    move-exception p0

    if-eqz v0, :cond_8f

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_8f
    throw p0
    :try_end_90
    .catchall {:try_start_85 .. :try_end_90} :catchall_90

    :catchall_90
    move-exception p1

    if-eqz p0, :cond_99

    if-eq p0, p1, :cond_9a

    :try_start_95
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_9a

    :cond_99
    move-object p0, p1

    :cond_9a
    :goto_9a
    throw p0

    :cond_9b
    :goto_9b
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p4

    const/16 v0, 0xc8

    if-lt p4, v0, :cond_124

    const/16 v1, 0x12c

    if-ge p4, v1, :cond_124

    new-instance p4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_ac
    .catchall {:try_start_95 .. :try_end_ac} :catchall_13a

    :try_start_ac
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_b0
    .catchall {:try_start_ac .. :try_end_b0} :catchall_117

    const/16 v4, 0x2000

    :try_start_b2
    new-array v4, v4, [B

    :goto_b4
    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_b8
    .catchall {:try_start_b2 .. :try_end_b8} :catchall_110

    const/4 v6, -0x1

    if-ne v5, v6, :cond_f5

    if-eqz v3, :cond_c0

    :try_start_bd
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_c0
    .catchall {:try_start_bd .. :try_end_c0} :catchall_117

    :cond_c0
    :try_start_c0
    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-nez p0, :cond_cc

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    goto :goto_d5

    :cond_cc
    new-instance p0, Lorg/json/JSONObject;

    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    :goto_d5
    const-string p1, "meta"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_ee

    const-string p2, "status"

    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ge p1, v1, :cond_e6

    goto :goto_ee

    :cond_e6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Request rejected"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_ed
    .catchall {:try_start_c0 .. :try_end_ed} :catchall_13a

    goto :goto_9a

    :cond_ee
    :goto_ee
    invoke-virtual {p3, v2}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0

    :cond_f5
    :try_start_f5
    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v6

    if-nez v6, :cond_108

    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x200000

    if-gt v6, v7, :cond_108

    invoke-virtual {p4, v4, p1, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_b4

    :cond_108
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Request cancelled or oversized"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_110
    .catchall {:try_start_f5 .. :try_end_110} :catchall_110

    :catchall_110
    move-exception p0

    if-eqz v3, :cond_116

    :try_start_113
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_116
    throw p0
    :try_end_117
    .catchall {:try_start_113 .. :try_end_117} :catchall_117

    :catchall_117
    move-exception p1

    if-eqz p0, :cond_121

    if-eq p0, p1, :cond_9a

    :try_start_11c
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_9a

    :cond_121
    move-object p0, p1

    goto/16 :goto_9a

    :cond_124
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "HTTP "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_138
    .catchall {:try_start_11c .. :try_end_138} :catchall_13a

    goto/16 :goto_9a

    :catchall_13a
    move-exception p0

    invoke-virtual {p3, v2}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    :cond_142
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method private static scope(Landroid/view/View;Le/e/a/NetworkTask;)V
    .registers 3

    .line 34
    new-instance v0, Le/e/a/VideoDetails$2;

    invoke-direct {v0, p1}, Le/e/a/VideoDetails$2;-><init>(Le/e/a/NetworkTask;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method static target(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 1

    .line 15
    invoke-static {p0}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 3

    .line 6
    invoke-static {p0, p1, p2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 1

    .line 16
    invoke-static {p0}, Le/e/a/DetailData;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 5
    const-string v0, "\u30cb\u30b3\u30ec\u30dd"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Nico Reports"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    move-object p0, p1

    goto :goto_19

    :cond_10
    const-string p1, "Nico \u52d5\u614b"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19

    move-object p0, p2

    :cond_19
    :goto_19
    return-object p0
.end method

.method private static videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 12

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v2, 0x4

    invoke-static {v0, v2}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x6

    invoke-static {v0, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v2}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const-string v4, "\u25b6"

    const/16 v5, 0xe

    invoke-static {v0, v4, v5}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x60

    invoke-static {v0, v7}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v7

    const/16 v8, 0x36

    invoke-static {v0, v8}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    const-string v7, ""

    if-eqz v6, :cond_6b

    move-object p2, v7

    goto :goto_7e

    :cond_6b
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v6, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "\n"

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_7e
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "globalId"

    invoke-virtual {p1, p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v6, "title"

    invoke-virtual {p1, v6, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2, v5}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    invoke-direct {v2, v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, p2, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {v1, p2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Le/e/a/VideoDetails$$ExternalSyntheticLambda4;

    invoke-direct {p2, v0, p1}, Le/e/a/VideoDetails$$ExternalSyntheticLambda4;-><init>(Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {v1, p2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    invoke-static {p1}, Le/e/a/VideoDetails;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v3, v4}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-void
.end method

.method static watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 1

    .line 12
    invoke-static {p0}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
