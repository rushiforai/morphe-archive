.class public final Le/e/a/MylistFollow190;
.super Ljava/lang/Object;
.source "MylistFollow190.java"


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 11
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/MylistFollow190;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 12
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/MylistFollow190;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static folderId(Ljava/util/Map;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 17
    const-string v0, "url"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, ""

    if-nez p0, :cond_b

    return-object v0

    :cond_b
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "https?://(?:www\\.)?nicovideo\\.jp/mylist/[0-9]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_23
    return-object v0
.end method

.method static id(Landroid/app/Activity;)Ljava/lang/String;
    .registers 5

    .line 14
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    const-string v0, ""

    if-nez p0, :cond_d

    return-object v0

    :cond_d
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_35

    const-string v3, "nicovideo.jp"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_27

    const-string v3, ".nicovideo.jp"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    :cond_27
    if-eqz v2, :cond_35

    const-string v1, "/mylist/[0-9]+"

    invoke-virtual {v2, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-virtual {p0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    :cond_35
    return-object v0
.end method

.method static label(Landroid/app/Activity;Z)Ljava/lang/String;
    .registers 4

    .line 15
    if-eqz p1, :cond_9

    const-string p1, "Unfollow mylist"

    const-string v0, "\u53d6\u6d88\u8ffd\u8e64\u64ad\u653e\u6e05\u55ae"

    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8\u306e\u30d5\u30a9\u30ed\u30fc\u3092\u89e3\u9664"

    goto :goto_f

    :cond_9
    const-string p1, "Follow mylist"

    const-string v0, "\u8ffd\u8e64\u64ad\u653e\u6e05\u55ae"

    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u30d5\u30a9\u30ed\u30fc"

    :goto_f
    invoke-static {p0, v1, p1, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .registers 3

    .line 16
    invoke-static {p0, p1}, Le/e/a/MylistFollow190;->show(Landroid/app/Activity;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Landroid/widget/ListView;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 8

    .line 18
    const/4 p3, 0x0

    :try_start_1
    const-string p4, "g0"

    invoke-static {p0, p4}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result p1

    sub-int/2addr p5, p1

    if-ltz p5, :cond_32

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p5, p1, :cond_17

    goto :goto_32

    :cond_17
    invoke-virtual {p0, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/util/Map;

    if-nez p1, :cond_20

    return p3

    :cond_20
    check-cast p0, Ljava/util/Map;

    invoke-static {p0}, Le/e/a/MylistFollow190;->folderId(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2d

    return p3

    :cond_2d
    invoke-static {p2, p0}, Le/e/a/MylistFollow190;->show(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_30} :catch_33

    const/4 p0, 0x1

    return p0

    :cond_32
    :goto_32
    return p3

    :catch_33
    move-exception p0

    return p3
.end method

.method static synthetic lambda$2([Le/e/a/NetworkTask;Landroid/content/DialogInterface;)V
    .registers 2

    .line 20
    const/4 p1, 0x0

    aget-object p0, p0, p1

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/String;[Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V
    .registers 18

    .line 21
    move-object v10, p1

    const-string v0, "isFollowing"

    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://nvapi.nicovideo.jp/v2/mylists/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object v9, p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?pageSize=1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GET"

    const/4 v3, 0x0

    aget-object v3, v10, v3

    const/4 v4, 0x1

    invoke-static {v1, v2, v4, v3}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "mylist"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    sget-object v0, Le/e/a/MylistFollow190;->MAIN:Landroid/os/Handler;

    new-instance v11, Le/e/a/MylistFollow190$$ExternalSyntheticLambda8;

    move-object v1, v11

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    move-object v9, p0

    invoke-direct/range {v1 .. v9}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda8;-><init>([Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Lorg/json/JSONObject;Landroid/widget/LinearLayout;ZLjava/lang/String;)V

    invoke-virtual {v0, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_64

    :cond_4d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Missing follow status"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_55} :catch_55

    :catch_55
    move-exception v0

    sget-object v0, Le/e/a/MylistFollow190;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/MylistFollow190$$ExternalSyntheticLambda9;

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    invoke-direct {v1, p1, p3, v4, p2}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda9;-><init>([Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_64
    return-void
.end method

.method static synthetic lambda$4([Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Lorg/json/JSONObject;Landroid/widget/LinearLayout;ZLjava/lang/String;)V
    .registers 18

    .line 21
    const/4 v0, 0x0

    aget-object v0, p0, v0

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_42

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_42

    invoke-virtual {p2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_16

    goto :goto_42

    :cond_16
    const-string v0, "name"

    move-object v1, p4

    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v8, p3

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p5}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    move-object v6, p1

    move/from16 v5, p6

    invoke-static {p1, v5}, Le/e/a/MylistFollow190;->label(Landroid/app/Activity;Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    move-object v1, p5

    invoke-virtual {p5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v9, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;

    move-object v1, v9

    move-object v2, v0

    move-object v3, p0

    move-object/from16 v4, p7

    move-object v7, p2

    invoke-direct/range {v1 .. v8}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda3;-><init>(Landroid/widget/Button;[Le/e/a/NetworkTask;Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;)V

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_42
    :goto_42
    return-void
.end method

.method static synthetic lambda$5(Landroid/widget/Button;[Le/e/a/NetworkTask;Ljava/lang/String;ZLandroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/view/View;)V
    .registers 19

    .line 21
    const/4 v0, 0x0

    move-object v7, p0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v9, Le/e/a/NetworkTask;

    invoke-direct {v9}, Le/e/a/NetworkTask;-><init>()V

    aput-object v9, p1, v0

    sget-object v0, Le/e/a/MylistFollow190;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;

    move-object v1, v10

    move-object v2, p2

    move v3, p3

    move-object v4, v9

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda7;-><init>(Ljava/lang/String;ZLe/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;)V

    invoke-virtual {v9, v0, v10}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/String;ZLe/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;)V
    .registers 13

    .line 21
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/following/mylists/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_14

    const-string v0, "DELETE"

    goto :goto_16

    :cond_14
    const-string v0, "POST"

    :goto_16
    const/4 v1, 0x1

    invoke-static {p0, v0, v1, p2}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    sget-object p0, Le/e/a/MylistFollow190;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2, p3, p4, p1}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda1;-><init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Z)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    goto :goto_36

    :catch_25
    move-exception p0

    sget-object p0, Le/e/a/MylistFollow190;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;

    move-object v0, p1

    move-object v1, p2

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda2;-><init>(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_36
    return-void
.end method

.method static synthetic lambda$7(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Z)V
    .registers 4

    .line 21
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_31

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_31

    :cond_d
    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    if-eqz p3, :cond_15

    const-string p0, "\u30d5\u30a9\u30ed\u30fc\u3092\u89e3\u9664\u3057\u307e\u3057\u305f"

    goto :goto_17

    :cond_15
    const-string p0, "\u30d5\u30a9\u30ed\u30fc\u3057\u307e\u3057\u305f"

    :goto_17
    if-eqz p3, :cond_1c

    const-string p2, "Unfollowed"

    goto :goto_1e

    :cond_1c
    const-string p2, "Followed"

    :goto_1e
    if-eqz p3, :cond_23

    const-string p3, "\u5df2\u53d6\u6d88\u8ffd\u8e64"

    goto :goto_25

    :cond_23
    const-string p3, "\u5df2\u8ffd\u8e64"

    :goto_25
    invoke-static {p1, p0, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_31
    :goto_31
    return-void
.end method

.method static synthetic lambda$8(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/Button;Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 5

    .line 21
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_1e

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p0

    if-nez p0, :cond_d

    goto :goto_1e

    :cond_d
    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Landroid/widget/Button;->setEnabled(Z)V

    const-string p0, "Unable to update. Retry"

    const-string p1, "\u7121\u6cd5\u66f4\u65b0\uff0c\u8acb\u91cd\u8a66"

    const-string p2, "\u5909\u66f4\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p4, p2, p0, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1e
    :goto_1e
    return-void
.end method

.method static synthetic lambda$9([Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/app/Activity;)V
    .registers 5

    .line 21
    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_1d

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p0

    if-nez p0, :cond_10

    goto :goto_1d

    :cond_10
    const-string p0, "Unable to load following status"

    const-string p1, "\u7121\u6cd5\u8f09\u5165\u8ffd\u8e64\u72c0\u614b"

    const-string v0, "\u30d5\u30a9\u30ed\u30fc\u72b6\u614b\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p3, v0, p0, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 7

    .line 16
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "E"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_12

    return-void

    :cond_12
    invoke-static {p0}, Le/e/a/MylistFollow190;->id(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d

    return-void

    :cond_1d
    const/16 v1, 0x470e

    invoke-interface {p1, v1}, Landroid/view/Menu;->removeItem(I)V

    const-string v2, "\u30de\u30a4\u30ea\u30b9\u30c8\u306e\u30d5\u30a9\u30ed\u30fc\u2026"

    const-string v3, "Mylist following\u2026"

    const-string v4, "\u64ad\u653e\u6e05\u55ae\u8ffd\u8e64\u2026"

    invoke-static {p0, v2, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/16 v4, 0x5a

    invoke-interface {p1, v3, v1, v4, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v1, Le/e/a/MylistFollow190$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, v0}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3b} :catch_3c

    goto :goto_44

    :catch_3c
    move-exception p0

    const-string p1, "nicoid-following"

    const-string v0, "Unable to add mylist action"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_44
    return-void
.end method

.method static show(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 12

    .line 19
    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v0

    const-string v1, "user_session="

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2b

    const-string p1, "Sign in first"

    const-string v0, "\u8acb\u5148\u767b\u5165"

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, v2, p1, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 20
    :cond_2b
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v8

    invoke-static {v8}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Loading\u2026"

    const-string v3, "\u8f09\u5165\u4e2d\u2026"

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xe

    invoke-static {v0, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "Mylist following"

    const-string v3, "\u64ad\u653e\u6e05\u55ae\u8ffd\u8e64"

    const-string v4, "\u30de\u30a4\u30ea\u30b9\u30c8\u306e\u30d5\u30a9\u30ed\u30fc"

    invoke-static {p0, v4, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    new-array v4, v1, [Le/e/a/NetworkTask;

    const/4 v1, 0x0

    aput-object v0, v4, v1

    new-instance v0, Le/e/a/MylistFollow190$$ExternalSyntheticLambda5;

    invoke-direct {v0, v4}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda5;-><init>([Le/e/a/NetworkTask;)V

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    invoke-static {v6}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 21
    aget-object v0, v4, v1

    sget-object v1, Le/e/a/MylistFollow190;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Le/e/a/MylistFollow190$$ExternalSyntheticLambda6;

    move-object v2, v9

    move-object v3, p1

    move-object v5, p0

    invoke-direct/range {v2 .. v8}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda6;-><init>(Ljava/lang/String;[Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1, v9}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 22
    return-void
.end method

.method public static userFolders(Ljava/lang/Object;)V
    .registers 4

    .line 18
    :try_start_0
    const-string v0, "b"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const-string v1, "d0"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    new-instance v2, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v1, v0}, Le/e/a/MylistFollow190$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Landroid/widget/ListView;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_1f

    goto :goto_27

    :catch_1f
    move-exception p0

    const-string v0, "nicoid-following"

    const-string v1, "Unable to bind public mylist folders"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_27
    return-void
.end method
