.class public final Le/e/a/VideoExtras;
.super Ljava/lang/Object;
.source "VideoExtras.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoExtras$Heart;,
        Le/e/a/VideoExtras$Metadata;
    }
.end annotation


# static fields
.field static final main:Landroid/os/Handler;

.field static final workers:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/VideoExtras;->main:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/VideoExtras;->workers:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static UriEncode(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 20
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bind(Ljava/lang/Object;Landroid/view/View;)V
    .registers 10

    .line 8
    const-string v0, "nicoid_like"

    if-nez p1, :cond_5

    return-void

    :cond_5
    :try_start_5
    const-string v1, "i0"

    invoke-static {p0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    if-nez v1, :cond_10

    return-void

    :cond_10
    const-string v2, "ranking"

    invoke-static {p1, v2}, Le/e/a/VideoExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1d

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_1d
    const-string v2, "taglist"

    invoke-static {p1, v2}, Le/e/a/VideoExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_36

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/FeedbackFixes;->amoled(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_36

    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v2}, Le/e/a/VideoExtras;->withoutBorder(Landroid/view/ViewGroup;)V

    :cond_36
    const-string v2, "time"

    invoke-static {p1, v2}, Le/e/a/VideoExtras;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    const-string v3, "videoId"

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v2, :cond_bb

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_bb

    const-string v4, "(?:sm|so|nm)?[0-9]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_65

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    :cond_65
    new-instance v5, Landroid/widget/Button;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v6, 0x41400000    # 12.0f

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setMinimumWidth(I)V

    const-string v6, "nicoid_liked"

    invoke-virtual {v1, v6, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v5, v0}, Le/e/a/VideoExtras;->style(Landroid/widget/Button;Z)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    const/16 v7, 0x1c

    invoke-static {v6, v7}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, -0x2

    invoke-direct {v0, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x4

    invoke-static {v6, v7}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v6

    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v4, v5, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;

    invoke-direct {v0, v5, v1, p1, v3}, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;-><init>(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_bb
    new-instance v0, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1}, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    invoke-static {v1}, Le/e/a/VideoExtras;->idFrom(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v1, v0}, Le/e/a/VideoExtras;->loadSeries(Ljava/lang/Object;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/String;)V
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_ca} :catch_cb

    goto :goto_cf

    :catch_cb
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_cf
    return-void
.end method

.method public static capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 7

    .line 6
    if-eqz p0, :cond_5e

    if-nez p1, :cond_5

    goto :goto_5e

    :cond_5
    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    const-string v0, "viewer"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_14

    const/4 v0, 0x0

    goto :goto_1a

    :cond_14
    const-string v1, "like"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_1a
    if-eqz v0, :cond_33

    const-string v1, "isLiked"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    const-string v2, "nicoid_like_known"

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "nicoid_liked"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_33
    const-string v0, "series"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_5e

    const-string v0, "id"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_5e

    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5e

    const-string v0, "nicoid_series"

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5e
    :goto_5e
    return-void
.end method

.method static cookie()Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    invoke-static {}, Le/e/a/SessionCookie;->read()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decorate(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    :cond_1e
    if-nez v0, :cond_22

    const/4 p0, 0x0

    goto :goto_26

    :cond_22
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_26
    return-object p0
.end method

.method static fragmentForBundle(Landroid/os/Bundle;Landroid/view/View;)Ljava/lang/Object;
    .registers 2

    .line 18
    new-instance p1, Le/e/a/VideoExtras$Metadata;

    invoke-direct {p1, p0}, Le/e/a/VideoExtras$Metadata;-><init>(Landroid/os/Bundle;)V

    return-object p1
.end method

.method static idFrom(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 3

    .line 10
    const-string v0, "videoId"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$bind$0(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)V
    .registers 5

    .line 8
    invoke-static {p0, p1, p2, p3}, Le/e/a/VideoExtras;->toggle(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$bind$1(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/VideoExtras;->decorate(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$loadSeries$2(Landroid/view/View;Ljava/lang/String;Landroid/os/Bundle;Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 6

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-static {p2}, Le/e/a/VideoExtras;->idFrom(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    goto :goto_3e

    :cond_11
    invoke-static {p3, p2}, Le/e/a/VideoExtras;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    const-string p1, "nicoid_like"

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p1

    instance-of p3, p1, Landroid/widget/Button;

    if-eqz p3, :cond_29

    check-cast p1, Landroid/widget/Button;

    const-string p3, "nicoid_liked"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p3

    invoke-static {p1, p3}, Le/e/a/VideoExtras;->style(Landroid/widget/Button;Z)V

    :cond_29
    invoke-static {p4, p0}, Le/e/a/VideoExtras;->decorate(Ljava/lang/Object;Landroid/view/View;)V

    const-string p0, "nicoid_series"

    invoke-virtual {p2, p0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_37

    const-string p0, "Series metadata rendered"

    goto :goto_39

    :cond_37
    const-string p0, "No series in watch metadata"

    :goto_39
    const-string p1, "nicoid-series"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3e
    :goto_3e
    return-void
.end method

.method static synthetic lambda$loadSeries$3(Landroid/os/Bundle;)V
    .registers 3

    .line 11
    const-string v0, "nicoid_series_loading"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$loadSeries$4(Ljava/lang/String;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/Object;)V
    .registers 4

    return-void
.end method

.method static synthetic lambda$series$8(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 5

    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "https://www.nicovideo.jp/series/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoExtras;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$series$9(Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 4

    .line 21
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "https://www.nicovideo.jp/watch/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoExtras;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$toggle$5(Landroid/os/Bundle;ZZLandroid/view/View;Landroid/widget/Button;Lorg/json/JSONObject;)V
    .registers 12

    .line 15
    xor-int/lit8 v0, p1, 0x1

    const-string v1, "nicoid_liked"

    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "nicoid_like_known"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p2, :cond_35

    const-string p2, "likeCount"

    invoke-virtual {p0, p2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_35

    :try_start_17
    invoke-virtual {p0, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    if-eqz p1, :cond_23

    const/4 v0, -0x1

    goto :goto_24

    :cond_23
    const/4 v0, 0x1

    :goto_24
    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_33} :catch_34

    goto :goto_35

    :catch_34
    move-exception p2

    :cond_35
    :goto_35
    invoke-virtual {p3}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_8f

    const-string p2, "nicoid_like"

    invoke-virtual {p3, p2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p2

    if-eq p2, p4, :cond_44

    goto :goto_8f

    :cond_44
    invoke-virtual {p4, v1}, Landroid/widget/Button;->setEnabled(Z)V

    xor-int/lit8 p2, p1, 0x1

    invoke-static {p4, p2}, Le/e/a/VideoExtras;->style(Landroid/widget/Button;Z)V

    :try_start_4c
    const-string p2, "VideoInfoUi"

    const-string v0, "bindStatistics"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Landroid/view/View;

    aput-object v4, v3, v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0, p3}, Le/e/a/VideoExtras;->fragmentForBundle(Landroid/os/Bundle;Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    aput-object p0, v2, v5

    aput-object p3, v2, v1

    invoke-static {p2, v0, v3, v2}, Le/e/a/FeedbackFixes;->helper(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_69} :catch_6a

    goto :goto_6b

    :catch_6a
    move-exception p0

    :goto_6b
    const-string p0, "data"

    invoke-virtual {p5, p0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, ""

    if-nez p0, :cond_76

    goto :goto_7c

    :cond_76
    const-string p3, "thanksMessage"

    invoke-virtual {p0, p3, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_7c
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_8f

    if-nez p1, :cond_8f

    invoke-virtual {p4}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_8f
    :goto_8f
    return-void
.end method

.method static synthetic lambda$toggle$6(Landroid/view/View;Landroid/widget/Button;)V
    .registers 3

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_24

    const-string v0, "nicoid_like"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    if-eq p0, p1, :cond_f

    goto :goto_24

    :cond_f
    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "\u3044\u3044\u306d\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {v0}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_24
    :goto_24
    return-void
.end method

.method static synthetic lambda$toggle$7(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Bundle;ZLandroid/view/View;Landroid/widget/Button;)V
    .registers 15

    .line 15
    if-eqz p1, :cond_5

    :try_start_2
    const-string v0, "DELETE"

    goto :goto_7

    :cond_5
    const-string v0, "POST"

    :goto_7
    invoke-static {p0, v0, p2}, Le/e/a/VideoExtras;->request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object p0, Le/e/a/VideoExtras;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;

    move-object v1, p2

    move-object v2, p3

    move v3, p1

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v1 .. v7}, Le/e/a/VideoExtras$$ExternalSyntheticLambda8;-><init>(Landroid/os/Bundle;ZZLandroid/view/View;Landroid/widget/Button;Lorg/json/JSONObject;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1b} :catch_1c

    goto :goto_27

    :catch_1c
    move-exception p0

    sget-object p0, Le/e/a/VideoExtras;->main:Landroid/os/Handler;

    new-instance p1, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;

    invoke-direct {p1, p5, p6}, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;-><init>(Landroid/view/View;Landroid/widget/Button;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_27
    return-void
.end method

.method static loadSeries(Ljava/lang/Object;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 4

    return-void
.end method

.method static open(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 22
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "/watch/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_18

    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    :cond_18
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    goto :goto_20

    :catch_1c
    move-exception p0

    invoke-static {p0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :goto_20
    return-void
.end method

.method static request(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    const-string v0, "https://www.nicovideo.jp"

    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://nvapi.nicovideo.jp/v1/users/me/likes/items?videoId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Le/e/a/VideoExtras;->UriEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/16 v2, 0x1f40

    :try_start_26
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string p1, "Cookie"

    invoke-virtual {v1, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Frontend-Id"

    const-string p2, "6"

    invoke-virtual {v1, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Frontend-Version"

    const-string p2, "0"

    invoke-virtual {v1, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "X-Request-With"

    invoke-virtual {v1, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Origin"

    invoke-virtual {v1, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Referer"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "https://www.nicovideo.jp/watch/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p1, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    const/16 p1, 0x190

    if-ge p0, p1, :cond_73

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2

    goto :goto_77

    :cond_73
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object p2

    :goto_77
    if-eqz p2, :cond_dd

    new-instance v0, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v0, p2, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_80
    .catchall {:try_start_26 .. :try_end_80} :catchall_f6

    :try_start_80
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x1000

    new-array v2, v2, [C

    :goto_89
    invoke-virtual {v0, v2}, Ljava/io/Reader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_a5

    const/4 v4, 0x0

    invoke-virtual {p2, v2, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/high16 v4, 0x80000

    if-gt v3, v4, :cond_9d

    goto :goto_89

    :cond_9d
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Oversized response"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_a5
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2
    :try_end_a9
    .catchall {:try_start_80 .. :try_end_a9} :catchall_d3

    :try_start_a9
    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p2, "meta"

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    if-ge p0, p1, :cond_cb

    if-eqz p2, :cond_cb

    const-string p0, "status"

    const/16 p1, 0x1f4

    invoke-virtual {p2, p0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_c3
    .catchall {:try_start_a9 .. :try_end_c3} :catchall_f6

    const/16 p1, 0x12c

    if-ge p0, p1, :cond_cb

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :cond_cb
    :try_start_cb
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Like request failed"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_d2
    throw p0
    :try_end_d3
    .catchall {:try_start_cb .. :try_end_d3} :catchall_f6

    :catchall_d3
    move-exception p0

    :try_start_d4
    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_d7
    .catchall {:try_start_d4 .. :try_end_d7} :catchall_d8

    goto :goto_d2

    :catchall_d8
    move-exception p1

    :try_start_d9
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_d2

    :cond_dd
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "HTTP "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_f6
    .catchall {:try_start_d9 .. :try_end_f6} :catchall_f6

    :catchall_f6
    move-exception p0

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0
.end method

.method static series(Landroid/widget/LinearLayout;Landroid/view/View;Lorg/json/JSONObject;)V
    .registers 3

    return-void
.end method

.method static style(Landroid/widget/Button;Z)V
    .registers 7

    .line 12
    if-eqz p1, :cond_5

    const-string v0, "\u3044\u3044\u306d"

    goto :goto_7

    :cond_5
    const-string v0, "\u3044\u3044\u306d"

    :goto_7
    invoke-static {v0}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/ReactionIcons;->neutral(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v1, Le/e/a/VideoExtras$Heart;

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz p1, :cond_22

    invoke-static {p0, v3}, Le/e/a/ReactionIcons;->selected(Landroid/view/View;Z)I

    move-result v0

    :cond_22
    invoke-direct {v1, v2, p1, v0}, Le/e/a/VideoExtras$Heart;-><init>(Landroid/content/Context;ZI)V

    const/4 p1, 0x0

    invoke-virtual {p0, v1, p1, p1, p1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xf

    invoke-static {v1, v2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_59

    const v1, -0x6d6c68

    goto :goto_5c

    :cond_59
    const v1, -0x8c8b88

    :goto_5c
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v4, 0x1

    invoke-static {v2, v4}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v2

    const v4, 0xffffff

    and-int/2addr v2, v4

    const/high16 v4, 0x33000000

    or-int/2addr v2, v4

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-direct {v1, v2, v0, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    const/16 v0, 0x9

    invoke-static {p1, v0}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1, v3, p1, v3}, Landroid/widget/Button;->setPadding(IIII)V

    return-void
.end method

.method static toggle(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;)V
    .registers 15

    .line 15
    const/4 v0, 0x1

    :try_start_1
    invoke-static {}, Le/e/a/VideoExtras;->cookie()Ljava/lang/String;

    move-result-object v4

    const-string v1, "user_session="

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "\u3044\u3044\u306d\u3059\u308b\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_1f
    const-string v1, "nicoid_liked"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const-string v1, "nicoid_like_known"

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {p0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    sget-object v9, Le/e/a/VideoExtras;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;

    move-object v1, v10

    move-object v2, p3

    move-object v5, p1

    move-object v7, p2

    move-object v8, p0

    invoke-direct/range {v1 .. v8}, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;-><init>(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Bundle;ZLandroid/view/View;Landroid/widget/Button;)V

    invoke-interface {v9, v10}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3e} :catch_3f

    goto :goto_54

    :catch_3f
    move-exception p1

    invoke-static {p1}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u3044\u3044\u306d\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u30ed\u30b0\u30a4\u30f3\u3068\u901a\u4fe1\u72b6\u6cc1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p1}, Le/e/a/FeedbackFixes;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_54
    return-void
.end method

.method static withoutBorder(Landroid/view/ViewGroup;)V
    .registers 4

    .line 13
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_21

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/Button;

    if-eqz v2, :cond_15

    move-object v2, v1

    check-cast v2, Landroid/widget/Button;

    invoke-static {v2}, Le/e/a/Followup3;->tagButton(Landroid/widget/Button;)V

    :cond_15
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1e

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1}, Le/e/a/VideoExtras;->withoutBorder(Landroid/view/ViewGroup;)V

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_21
    return-void
.end method
