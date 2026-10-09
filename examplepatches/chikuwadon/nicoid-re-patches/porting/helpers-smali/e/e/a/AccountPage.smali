.class public final Le/e/a/AccountPage;
.super Ljava/lang/Object;
.source "AccountPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/AccountPage$MenuIcon;
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

    sput-object v0, Le/e/a/AccountPage;->MAIN:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/AccountPage;->WORK:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 9

    .line 6
    const v0, 0x7f0f01b1

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v2, v3, :cond_10

    return-void

    :cond_10
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/Map;

    if-nez v4, :cond_19

    :cond_18
    goto :goto_32

    :cond_19
    check-cast v3, Ljava/util/Map;

    const-string v4, "title"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_35

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    goto :goto_35

    :goto_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_35
    :goto_35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v3, "My page"

    const-string v5, "\u6211\u7684\u9801\u9762"

    const-string v6, "\u30de\u30a4\u30da\u30fc\u30b8"

    invoke-static {p0, v6, v3, v5}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "Profile, uploads and my lists"

    const-string v4, "\u500b\u4eba\u8cc7\u6599\u3001\u6295\u7a3f\u5f71\u7247\u8207\u64ad\u653e\u6e05\u55ae"

    const-string v5, "\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u30fb\u6295\u7a3f\u52d5\u753b\u30fb\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v5, v3, v4}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "subtitle"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "islabel"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "type"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "NicoidNicorepoActivity"

    invoke-static {p0, v1}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "nicoid_my_page"

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "intent"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/2addr v2, v3

    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/content/Intent;Landroid/view/View;)V
    .registers 3

    .line 9
    invoke-static {p0, p1}, Le/e/a/AccountPage;->open(Landroid/app/Activity;Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 13

    .line 12
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GET"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_21

    const/4 v0, 0x0

    :goto_1f
    move-object v5, v0

    goto :goto_28

    :cond_21
    const-string v1, "user"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_1f

    :goto_28
    if-eqz v5, :cond_3a

    sget-object v0, Le/e/a/AccountPage;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/AccountPage$$ExternalSyntheticLambda3;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/AccountPage$$ExternalSyntheticLambda3;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_4b

    :cond_3a
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_40} :catch_40

    :catch_40
    move-exception p0

    sget-object p0, Le/e/a/AccountPage;->MAIN:Landroid/os/Handler;

    new-instance p3, Le/e/a/AccountPage$$ExternalSyntheticLambda4;

    invoke-direct {p3, p1, p4, p2}, Le/e/a/AccountPage$$ExternalSyntheticLambda4;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_4b
    return-void
.end method

.method static synthetic lambda$2(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 5

    .line 12
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_9

    invoke-static {p1, p2, p3, p4}, Le/e/a/AccountPage;->profile(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method static synthetic lambda$3(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 5

    .line 12
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_13

    const-string p0, "Unable to load profile"

    const-string v0, "\u7121\u6cd5\u8f09\u5165\u500b\u4eba\u8cc7\u6599"

    const-string v1, "\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p2, v1, p0, v0}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_13
    return-void
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 15
    new-instance p1, Landroid/content/Intent;

    const-string v0, "https://account.nicovideo.jp/my/profile"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0, p1}, Le/e/a/AccountPage;->open(Landroid/app/Activity;Landroid/content/Intent;)V

    return-void
.end method

.method private static link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V
    .registers 11

    .line 9
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x4

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0, v2, v4, v1, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Le/e/a/AccountPage$MenuIcon;

    invoke-direct {v1, p0, p3}, Le/e/a/AccountPage$MenuIcon;-><init>(Landroid/content/Context;I)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x18

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {p3, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 p3, 0xf

    invoke-static {p0, p2, p3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p3

    const/16 v1, 0xc

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v4, 0x8

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p3, v1, v2, v4, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 p3, 0x2c

    invoke-static {p0, p3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p3

    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Le/e/a/AccountPage$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, p4}, Le/e/a/AccountPage$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Landroid/content/Intent;)V

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method public static load(Landroid/app/Activity;)V
    .registers 14

    .line 10
    const-string v0, ""

    const-string v1, "y"

    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const-string v3, "nicoid_my_page"

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setTag(Ljava/lang/Object;)V

    invoke-static {v2}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    const/4 v5, 0x1

    const/4 v6, 0x0

    :try_start_1d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Landroid/view/View;

    if-eqz v8, :cond_3b

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_37} :catch_aa

    if-eqz v3, :cond_3b

    const/4 v3, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v3, 0x0

    :goto_3c
    :try_start_3c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v7, "H"

    invoke-virtual {v1, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, v6}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v7, "I"

    invoke-virtual {v1, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v7, "O"

    invoke-virtual {v1, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "b"

    new-array v9, v5, [Ljava/lang/Class;

    const-class v10, Ljava/lang/CharSequence;

    aput-object v10, v9, v6

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-array v8, v5, [Ljava/lang/Object;

    const-string v9, "\u30de\u30a4\u30da\u30fc\u30b8"

    const-string v10, "My page"

    const-string v11, "\u6211\u7684\u9801\u9762"

    invoke-static {p0, v9, v10, v11}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-virtual {v7, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "c"

    new-array v9, v5, [Ljava/lang/Class;

    const-class v10, Ljava/lang/CharSequence;

    aput-object v10, v9, v6

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-array v8, v5, [Ljava/lang/Object;

    aput-object v0, v8, v6

    invoke-virtual {v7, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_a7} :catch_a8

    goto :goto_ac

    :catch_a8
    move-exception v1

    goto :goto_ac

    :catch_aa
    move-exception v1

    const/4 v3, 0x0

    :goto_ac
    if-eqz v3, :cond_b1

    invoke-virtual {p0, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 11
    :cond_b1
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    const/16 v1, 0x10

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v7, 0x14

    invoke-static {p0, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v8, 0xc

    invoke-static {p0, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v11, v3, v7, v1, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v4, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v1, "Loading\u2026"

    const-string v3, "\u8f09\u5165\u4e2d\u2026"

    const-string v7, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v7, v1, v3}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0xe

    invoke-static {p0, v1, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v1, "(?:^|;\\s*)user_session=user_session_(\\d+)_"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_fc

    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    :cond_fc
    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    new-instance v3, Le/e/a/AccountPage$1;

    invoke-direct {v3, v1}, Le/e/a/AccountPage$1;-><init>(Le/e/a/NetworkTask;)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_11e

    sget-object v2, Le/e/a/AccountPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/AccountPage$$ExternalSyntheticLambda2;

    move-object v7, v3

    move-object v8, v0

    move-object v9, v1

    move-object v10, p0

    invoke-direct/range {v7 .. v12}, Le/e/a/AccountPage$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    invoke-virtual {v1, v2, v3}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    goto :goto_12b

    :cond_11e
    const-string v1, "Sign in required"

    const-string v2, "\u8acb\u5148\u767b\u5165"

    const-string v3, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    :goto_12b
    invoke-static {v4}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    const-string v1, "Watch history"

    const-string v2, "\u89c0\u770b\u7d00\u9304"

    const-string v3, "\u8996\u8074\u5c65\u6b74"

    invoke-static {p0, v3, v1, v2}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NicoidVideoListActivity"

    invoke-static {p0, v2}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    const-string v7, "type"

    const/4 v8, 0x4

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    invoke-static {p0, v4, v1, v6, v3}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    const-string v1, "\u3042\u3068\u3067\u898b\u308b"

    const-string v3, "Watch later"

    const-string v9, "\u7a0d\u5f8c\u89c0\u770b"

    invoke-static {p0, v1, v3, v9}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {p0, v2}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const/16 v11, 0x9

    invoke-virtual {v2, v7, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    const-string v7, "name"

    invoke-static {p0, v1, v3, v9}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v7, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "deflist"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    invoke-static {p0, v4, v10, v6, v1}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    const-string v1, "My lists"

    const-string v2, "\u64ad\u653e\u6e05\u55ae"

    const-string v3, "\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v3, v1, v2}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NicoidMylistGroupActivity"

    invoke-static {p0, v2}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-static {p0, v4, v1, v5, v2}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    const-string v1, "Cache manager"

    const-string v2, "\u5feb\u53d6\u7ba1\u7406"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u7ba1\u7406"

    invoke-static {p0, v3, v1, v2}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NicoidCacheManagerActivity"

    invoke-static {p0, v2}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {p0, v4, v1, v3, v2}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    invoke-static {v4}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "https://www.nicovideo.jp/user/"

    const/4 v5, 0x3

    if-nez v1, :cond_1ff

    const-string v1, "Uploaded videos"

    const-string v6, "\u6295\u7a3f\u5f71\u7247"

    const-string v7, "\u6295\u7a3f\u52d5\u753b"

    invoke-static {p0, v7, v1, v6}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "NicoidUserVideoListActivity"

    invoke-static {p0, v6}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "/video"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v6

    invoke-static {p0, v4, v1, v5, v6}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    const-string v1, "Series"

    const-string v6, "\u7cfb\u5217"

    const-string v7, "\u30b7\u30ea\u30fc\u30ba"

    invoke-static {p0, v7, v1, v6}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v6, Landroid/content/Intent;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "/series"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v6, v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0, v4, v1, v5, v6}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    :cond_1ff
    invoke-static {v4}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    const-string v1, "Following"

    const-string v6, "\u8ffd\u8e64\u4e2d"

    const-string v7, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    invoke-static {p0, v7, v1, v6}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "NicoidFavUserActivity"

    invoke-static {p0, v6}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    invoke-static {p0, v4, v1, v8, v6}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    const-string v1, "Nico Reports"

    const-string v6, "Nico \u52d5\u614b"

    const-string v7, "\u30cb\u30b3\u30ec\u30dd"

    invoke-static {p0, v7, v1, v6}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "NicoidNicorepoActivity"

    invoke-static {p0, v6}, Le/e/a/AccountPage;->nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    invoke-static {p0, v4, v1, v5, v6}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_257

    const-string v1, "Followers"

    const-string v5, "\u8ffd\u8e64\u8005"

    const-string v6, "\u30d5\u30a9\u30ed\u30ef\u30fc"

    invoke-static {p0, v6, v1, v5}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v5, Landroid/content/Intent;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/follower"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {v5, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0, v4, v1, v8, v5}, Le/e/a/AccountPage;->link(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;ILandroid/content/Intent;)V

    :cond_257
    return-void
.end method

.method private static nativeIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 5

    .line 7
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "com.sauzask.nicoid."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static open(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 4

    .line 8
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    goto :goto_17

    :catch_4
    move-exception p1

    const-string p1, "Unable to open page"

    const-string v0, "\u7121\u6cd5\u958b\u555f\u9801\u9762"

    const-string v1, "\u30da\u30fc\u30b8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_17
    return-void
.end method

.method private static profile(Landroid/app/Activity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 21

    .line 15
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual/range {p1 .. p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-static/range {p0 .. p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_2e

    const v7, -0xdad7cf

    goto :goto_31

    :cond_2e
    const v7, -0x111112

    :goto_31
    const/16 v8, 0x64

    invoke-static {v0, v7, v8}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    const-string v7, ""

    const/16 v8, 0xe

    invoke-static {v0, v7, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x1

    invoke-direct {v10, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6, v10}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v11, 0x38

    invoke-static {v0, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v0, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v10, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    const-string v10, "name"

    invoke-virtual {v2, v10, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "nickname"

    invoke-virtual {v2, v11, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x12

    invoke-static {v0, v10, v11}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "ID: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v10, 0xd

    invoke-static {v0, v3, v10}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, 0x0

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v3, v11, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v3, "Edit"

    const-string v5, "\u7de8\u8f2f"

    const-string v14, "\u7de8\u96c6"

    invoke-static {v0, v14, v3, v5}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v3

    new-instance v5, Le/e/a/AccountPage$$ExternalSyntheticLambda1;

    invoke-direct {v5, v0}, Le/e/a/AccountPage$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v3, "icons"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_d4

    const-string v4, "large"

    invoke-virtual {v3, v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "small"

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v6, v9}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    :cond_d4
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v4, "userLevel"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const/16 v5, 0x11

    if-eqz v4, :cond_107

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v9, "LV "

    invoke-direct {v6, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "currentLevel"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4, v10}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v11, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_107
    const-string v4, "followerCount"

    const-string v6, "followeeCount"

    filled-new-array {v6, v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x0

    :goto_110
    const/4 v14, 0x2

    if-lt v9, v14, :cond_132

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v3, "description"

    invoke-virtual {v2, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_131

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_131
    return-void

    :cond_132
    aget-object v14, v4, v9

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_181

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v15, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "\n"

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v14, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_15e

    const-string v14, "Following"

    const-string v15, "\u8ffd\u8e64\u4e2d"

    const-string v11, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    invoke-static {v0, v11, v14, v15}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_168

    :cond_15e
    const-string v11, "Followers"

    const-string v14, "\u8ffd\u8e64\u8005"

    const-string v15, "\u30d5\u30a9\u30ed\u30ef\u30fc"

    invoke-static {v0, v15, v11, v14}, Le/e/a/AccountPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :goto_168
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8, v10}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, 0x0

    invoke-direct {v11, v14, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_182

    :cond_181
    const/4 v14, 0x0

    :goto_182
    add-int/lit8 v9, v9, 0x1

    const/16 v8, 0xe

    const/4 v11, 0x0

    goto :goto_110
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
