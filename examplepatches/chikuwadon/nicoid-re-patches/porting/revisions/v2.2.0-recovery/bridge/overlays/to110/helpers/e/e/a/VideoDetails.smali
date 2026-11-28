.class public final Le/e/a/VideoDetails;
.super Ljava/lang/Object;
.source "VideoDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoDetails$FollowIcon;,
        Le/e/a/VideoDetails$LikeIcon;,
        Le/e/a/VideoDetails$SeriesPage;,
        Le/e/a/VideoDetails$TagFlow;,
        Le/e/a/VideoDetails$TreePage;
    }
.end annotation


# static fields
.field private static final DETAILS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final OWNER_IDS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 4
    new-instance v0, Le/e/a/VideoDetails$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-direct {v0, v3, v1, v2}, Le/e/a/VideoDetails$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/VideoDetails;->DETAILS:Ljava/util/Map;

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoDetails;->OWNER_IDS:Ljava/util/WeakHashMap;

    .line 6
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

.method static synthetic access$0(Landroid/content/Context;I)I
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 7
    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 3

    .line 8
    invoke-static {p0, p1, p2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 6
    sget-object v0, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$5()Landroid/os/Handler;
    .registers 1

    .line 6
    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$6(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 2

    .line 48
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method private static addLike(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 12

    .line 43
    const-string v0, "id"

    :try_start_0
    const-string v1, "video"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string v2, "videoId"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "count"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "likeCount"

    if-nez v2, :cond_0

    const-wide/16 v6, 0x0

    goto :goto_0

    :cond_0
    const-string v4, "like"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    :goto_0
    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "e.e.a.VideoExtras"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "capture"

    const/4 v4, 0x2

    new-array v6, v4, [Ljava/lang/Class;

    const-class v7, Lorg/json/JSONObject;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const-class v7, Landroid/os/Bundle;

    const/4 v9, 0x1

    aput-object v7, v6, v9

    invoke-virtual {v2, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v6, v4, [Ljava/lang/Object;

    aput-object p1, v6, v8

    aput-object v5, v6, v9

    const/4 p1, 0x0

    invoke-virtual {v3, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Le/e/a/VideoDetails$LikeIcon;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {p1, v3, v5}, Le/e/a/VideoDetails$LikeIcon;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V

    const-string v3, "nicoid_like"

    invoke-virtual {p1, v3}, Le/e/a/VideoDetails$LikeIcon;->setTag(Ljava/lang/Object;)V

    const-string v3, "\u3044\u3044\u306d"

    const-string v6, "Like"

    const-string v7, "\u559c\u6b61"

    invoke-static {v3, v6, v7}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Le/e/a/VideoDetails$LikeIcon;->setContentDescription(Ljava/lang/CharSequence;)V

    const-string v3, "toggle"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Class;

    const-class v7, Landroid/widget/Button;

    aput-object v7, v6, v8

    const-class v7, Landroid/os/Bundle;

    aput-object v7, v6, v9

    const-class v7, Landroid/view/View;

    aput-object v7, v6, v4

    const-class v4, Ljava/lang/String;

    const/4 v7, 0x3

    aput-object v4, v6, v7

    invoke-virtual {v2, v3, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-instance v9, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;

    move-object v2, v9

    move-object v4, p1

    move-object v6, p0

    move-object v7, v1

    invoke-direct/range {v2 .. v7}, Le/e/a/VideoDetails$$ExternalSyntheticLambda6;-><init>(Ljava/lang/reflect/Method;Le/e/a/VideoDetails$LikeIcon;Landroid/os/Bundle;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {p1, v9}, Le/e/a/VideoDetails$LikeIcon;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x28

    invoke-static {v3, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x8

    invoke-static {v3, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3, v8, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Nicoad190;->attach(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    new-instance v0, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;

    invoke-direct {v0, p1}, Le/e/a/VideoDetails$$ExternalSyntheticLambda7;-><init>(Le/e/a/VideoDetails$LikeIcon;)V

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "nicoid-like"

    const-string v0, "Unable to prepare details like"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method private static addMetadata(Landroid/widget/LinearLayout;Lorg/json/JSONObject;I)V
    .registers 12

    .line 42
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "postedAt"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "registeredAt"

    invoke-virtual {p1, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/16 v6, 0x8

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v7, 0x54

    const/16 v8, 0x20

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const-string v7, "(?:\\+09:00|Z)$"

    invoke-virtual {v1, v7, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "Posted"

    const-string v7, "\u6295\u7a3f"

    invoke-static {v7, v3, v7}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-static {v0, v6}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v0, v6}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v1, v3, v7, v8, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_0
    const-string v1, "count"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-static {v0, v2, p2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    invoke-static {v0, v6}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v6}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v0, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p2, v1, v2, v3, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string v0, "like"

    const-string v1, "mylist"

    const-string v2, "view"

    const-string v3, "comment"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    new-array v2, v1, [J

    :goto_0
    if-lt v4, v1, :cond_1

    invoke-static {p2, v2}, Le/e/a/VideoCounts;->render(Landroid/widget/TextView;[J)V

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    :cond_1
    aget-object v3, v0, v4

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    aget-object v3, v0, v4

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    goto :goto_1

    :cond_2
    const-wide/16 v5, -0x1

    :goto_1
    aput-wide v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method

.method public static bind(Ljava/lang/Object;Landroid/view/View;)V
    .registers 15

    invoke-static {p1}, Le/e/a/ThumbnailCorners;->applyDetails(Landroid/view/View;)V

    invoke-static {p1}, Le/e/a/DetailActions195;->attach(Landroid/view/View;)V

    .line 13
    const-string v0, "nicoid_owner_loading"

    const-string v1, "details_channel"

    const-string v2, "details_owner"

    const-string v3, "nicoid_details"

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Le/e/a/PlayerTheme;->information(Landroid/view/View;)V

    invoke-static {p0, p1}, Le/e/a/Nicoad190;->bind(Ljava/lang/Object;Landroid/view/View;)V

    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "i0"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;

    if-nez p0, :cond_1

    return-void

    :cond_1
    const-string v4, "videoId"

    const-string v5, ""

    invoke-virtual {p0, v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v4, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v10, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-nez v4, :cond_2

    return-void

    :cond_2
    :try_start_1
    const-string v4, "e.e.a.ModernPlayback"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "latestWatch"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    if-eqz v4, :cond_3

    const-string v5, "video"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-static {v4, v10}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-static {v4, p0}, Le/e/a/VideoDetails;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    :cond_3
    :goto_0
    const v4, 0x7f08007a

    :try_start_2
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_a

    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/LinearLayout;

    if-nez v4, :cond_4

    goto/16 :goto_4

    :cond_4
    const v4, 0x7f0801c7

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v12, 0x0

    if-eqz v4, :cond_5

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    if-eqz v5, :cond_5

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    iput v12, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    :cond_5
    const v4, 0x7f0801c8

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_6

    move-object v8, v4

    check-cast v8, Landroid/widget/LinearLayout;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :try_start_3
    const-string v5, "owner"

    invoke-static {p0, v2}, Le/e/a/VideoDetails;->json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "channel"

    invoke-static {p0, v1}, Le/e/a/VideoDetails;->json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catch_1
    move-exception v5

    :goto_1
    :try_start_4
    invoke-static {v8, v4}, Le/e/a/VideoDetails;->bindOwner(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-static {p1, v4}, Le/e/a/VideoDetails;->bindChannel(Landroid/view/View;Lorg/json/JSONObject;)V

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_6

    new-instance v1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p1, v0}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    sget-object v1, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/VideoDetails$$ExternalSyntheticLambda0;

    move-object v4, v2

    move-object v5, v10

    move-object v6, v0

    move-object v7, p0

    move-object v9, p1

    invoke-direct/range {v4 .. v9}, Le/e/a/VideoDetails$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    :cond_6
    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "\u30b7\u30ea\u30fc\u30ba"

    const-string v3, "Series"

    const-string/jumbo v4, "\u7cfb\u5217"

    invoke-static {v2, v3, v4}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x12

    invoke-static {v0, v2, v3}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "details_series"

    invoke-static {p0, v2}, Le/e/a/VideoDetails;->json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v2, "id"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "[0-9]+"

    invoke-virtual {v2, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-static {v0, p0}, Le/e/a/VideoDetails;->renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_2

    :cond_8
    invoke-static {v0, v10}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    :goto_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string/jumbo v0, "\u89aa\u4f5c\u54c1\u30fb\u5b50\u4f5c\u54c1"

    const-string v2, "Parent and child works"

    const-string/jumbo v4, "\u7236\u4f5c\u54c1\u8207\u5b50\u4f5c\u54c1"

    invoke-static {v0, v2, v4}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v3}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 p0, 0x2

    new-array v0, p0, [Ljava/lang/String;

    const-string v2, "parents"

    aput-object v2, v0, v12

    const-string v2, "children"

    const/4 v3, 0x1

    aput-object v2, v0, v3

    :goto_3
    if-lt v12, p0, :cond_9

    goto :goto_5

    :cond_9
    aget-object v2, v0, v12

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Le/e/a/VideoDetails$TreePage;

    invoke-direct {v4, v3, v10, v2}, Le/e/a/VideoDetails$TreePage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Le/e/a/VideoDetails$TreePage;->load()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    :cond_a
    :goto_4
    return-void

    :catch_2
    move-exception p0

    :goto_5
    return-void
.end method

.method private static bindChannel(Landroid/view/View;Lorg/json/JSONObject;)V
    .registers 6

    .line 68
    const-string v0, "channel"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ch[0-9]+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "userinfo"

    invoke-virtual {v1, v3, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_2

    new-instance v1, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;-><init>(Landroid/view/View;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public static bindOwner(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 12

    .line 71
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "nicoid_follow"

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 72
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "video_info_follow_button"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const/16 v4, 0x8

    if-nez v3, :cond_1

    if-eqz v2, :cond_0

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void

    .line 73
    :cond_1
    const-string v3, "owner"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v6, "channel"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v6, "id"

    const/4 v7, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_3

    move-object v3, p1

    :cond_3
    if-nez v3, :cond_4

    return-void

    .line 74
    :cond_4
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, "^ch"

    const-string v8, ""

    invoke-virtual {p1, v6, v8}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, "[0-9]+"

    invoke-virtual {p1, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_5

    return-void

    .line 75
    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    if-eqz v5, :cond_6

    const-string v8, "channel:"

    goto :goto_1

    :cond_6
    const-string v8, "user:"

    :goto_1
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 76
    if-eqz v2, :cond_7

    sget-object v8, Le/e/a/VideoDetails;->OWNER_IDS:Ljava/util/WeakHashMap;

    invoke-virtual {v8, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 77
    :cond_7
    if-eqz v2, :cond_8

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 78
    :cond_8
    new-instance v2, Le/e/a/VideoDetails$FollowIcon;

    invoke-direct {v2, v0}, Le/e/a/VideoDetails$FollowIcon;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Le/e/a/VideoDetails$FollowIcon;->setTag(Ljava/lang/Object;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x28

    invoke-static {v0, v8}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {v0, v8}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v1, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v8, 0x10

    iput v8, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-static {v0, v4}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0, v7, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sget-object p0, Le/e/a/VideoDetails;->OWNER_IDS:Ljava/util/WeakHashMap;

    invoke-virtual {p0, v2, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v2, p1, v3, v5}, Le/e/a/VideoDetails;->followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    .line 79
    return-void
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method public static capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 8

    invoke-static {p0, p1}, Le/e/a/MediaArtwork248;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    .line 10
    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "owner"

    const-string v1, "channel"

    const-string v2, "series"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-lt v1, v2, :cond_1

    return-void

    :cond_1
    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_2

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

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method static cookie()Ljava/lang/String;
    .registers 9

    .line 81
    const-string v0, ""

    :try_start_0
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static duration(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 12

    .line 50
    const-string v0, "lengthSeconds"

    const-wide/16 v1, -0x1

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-string v2, "duration"

    invoke-virtual {p0, v2, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-gez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    const/4 p0, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const-wide/16 v4, 0xe10

    const-wide/16 v6, 0x3c

    cmp-long v8, v0, v4

    if-ltz v8, :cond_1

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v4, v0, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    div-long v9, v0, v6

    rem-long/2addr v9, v6

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    rem-long/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v4, v1, v2

    aput-object v5, v1, p0

    aput-object v0, v1, v3

    const-string p0, "%d:%02d:%02d"

    invoke-static {v8, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v8, v0, v6

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    rem-long/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    aput-object v5, v1, v2

    aput-object v0, v1, p0

    const-string p0, "%d:%02d"

    invoke-static {v4, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 4

    .line 86
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/VideoDetails;->followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    return-void
.end method

.method private static followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    .registers 16

    .line 87
    const-string v0, "viewer"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const-string v1, "follow"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_0
    const/4 v1, 0x1

    new-array v8, v1, [Z

    const/4 v2, 0x0

    if-eqz p3, :cond_2

    if-eqz v0, :cond_1

    const-string v3, "isBookmarked"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    const-string v0, "isFollowing"

    invoke-virtual {p2, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    :goto_1
    aput-boolean v0, v8, v2

    new-instance v0, Ljava/lang/StringBuilder;

    if-eqz p3, :cond_3

    const-string v3, "https://public-api.ch.nicovideo.jp/v1/user/followees/channel/"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_2

    :cond_3
    const-string v3, "https://user-follow-api.nicovideo.jp/v1/user/followees/niconico-users/"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ".json"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    new-instance v9, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;

    invoke-direct {v9, p0, v8}, Le/e/a/VideoDetails$$ExternalSyntheticLambda2;-><init>(Landroid/widget/Button;[Z)V

    invoke-interface {v9}, Ljava/lang/Runnable;->run()V

    if-eqz p3, :cond_4

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_3

    :cond_4
    invoke-virtual {p0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v1}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    sget-object v10, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v11, Le/e/a/VideoDetails$$ExternalSyntheticLambda3;

    move-object v2, v11

    move-object v3, v0

    move-object v4, v1

    move-object v5, v8

    move-object v6, v9

    move-object v7, p0

    invoke-direct/range {v2 .. v7}, Le/e/a/VideoDetails$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {v1, v10, v11}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 89
    :goto_3
    new-instance v1, Le/e/a/VideoDetails$$ExternalSyntheticLambda4;

    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move-object v7, v8

    move-object v8, v0

    invoke-direct/range {v2 .. v9}, Le/e/a/VideoDetails$$ExternalSyntheticLambda4;-><init>(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z[ZLjava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 90
    return-void
.end method

.method static initializeCookies(Landroid/content/Context;)V
    .registers 9

    .line 9
    const-string v0, "b"

    :try_start_0
    const-string v1, "e.e.a.v0"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "nologin"

    const/4 v4, 0x0

    invoke-interface {p0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    :cond_1
    const-string v2, "save_cookie"

    const-string v5, ""

    invoke-interface {p0, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :cond_2
    :goto_0
    return-void
.end method

.method private static json(Landroid/os/Bundle;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4

    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{}"

    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    return-object p0
.end method

.method static label(Landroid/widget/Button;Ljava/lang/String;Z)V
    .registers 3

    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    instance-of p1, p0, Le/e/a/VideoDetails$FollowIcon;

    if-eqz p1, :cond_0

    check-cast p0, Le/e/a/VideoDetails$FollowIcon;

    invoke-virtual {p0, p2}, Le/e/a/VideoDetails$FollowIcon;->state(Z)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 12

    .line 13
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "?responseType=json"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GET"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Le/e/a/VideoDetails;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v6, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;

    move-object v0, v6

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Le/e/a/VideoDetails$$ExternalSyntheticLambda8;-><init>(Le/e/a/NetworkTask;Lorg/json/JSONObject;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {p0, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void
.end method

.method static synthetic lambda$1(Le/e/a/NetworkTask;Lorg/json/JSONObject;Landroid/os/Bundle;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 5

    .line 13
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {p1, p2}, Le/e/a/VideoDetails;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    invoke-static {p3, p1}, Le/e/a/VideoDetails;->bindOwner(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-static {p4, p1}, Le/e/a/VideoDetails;->bindChannel(Landroid/view/View;Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$10(Ljava/lang/reflect/Method;Le/e/a/VideoDetails$LikeIcon;Landroid/os/Bundle;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 7

    .line 43
    const/4 p5, 0x4

    :try_start_0
    new-array p5, p5, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p5, v0

    const/4 p1, 0x1

    aput-object p2, p5, p1

    const/4 p1, 0x2

    aput-object p3, p5, p1

    const-string p1, "id"

    invoke-virtual {p4, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x3

    aput-object p1, p5, p2

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "nicoid-like"

    const-string p2, "Unable to change like"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method static synthetic lambda$11(Le/e/a/VideoDetails$LikeIcon;)Z
    .registers 1

    .line 43
    invoke-virtual {p0}, Le/e/a/VideoDetails$LikeIcon;->state()V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$12(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 7

    .line 48
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/SeriesMetadata215;->watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "series"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "video"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/VideoDetails$$ExternalSyntheticLambda25;

    invoke-direct {v2, p1, p2, v1}, Le/e/a/VideoDetails$$ExternalSyntheticLambda25;-><init>(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
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

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "invalid response"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidDetails"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/VideoDetails$$ExternalSyntheticLambda26;

    invoke-direct {v1, p1, p3, p2, p0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda26;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_1
    return-void
.end method

.method static synthetic lambda$13(Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 5

    .line 48
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->removeAllViews()V

    if-eqz p2, :cond_2

    const-string p0, "id"

    invoke-virtual {p2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p1, p2}, Le/e/a/VideoDetails;->renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p2, "Not part of a series"

    const-string/jumbo v0, "\u672a\u52a0\u5165\u7cfb\u5217"

    const-string v1, "\u30b7\u30ea\u30fc\u30ba\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-static {v1, p2, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0xe

    invoke-static {p0, p2, v0}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$14(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 6

    .line 48
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    const-string p0, "Unable to load series"

    const-string/jumbo v0, "\u7121\u6cd5\u8f09\u5165\u7cfb\u5217\u8cc7\u8a0a"

    const-string v1, "\u30b7\u30ea\u30fc\u30ba\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, p0, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Retry"

    const-string/jumbo v0, "\u91cd\u8a66"

    const-string v1, "\u518d\u8a66\u884c"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Le/e/a/VideoDetails$$ExternalSyntheticLambda18;

    invoke-direct {p1, p2, p3}, Le/e/a/VideoDetails$$ExternalSyntheticLambda18;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    invoke-virtual {p2, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic lambda$15(Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 48
    invoke-static {p0, p1}, Le/e/a/VideoDetails;->loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$16(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .registers 6

    .line 49
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/SeriesPlayback;->enabled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    invoke-static {v0, v2, p2, p0}, Le/e/a/SeriesPlayback;->open(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    return-void
.end method

.method static synthetic lambda$17(Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 4

    .line 54
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    invoke-static {p2}, Le/e/a/VideoDetails;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/VideoDetails;->open(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$18(Landroid/view/View;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 3

    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Le/e/a/ChannelPage;->launch(Landroid/content/Context;Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic lambda$19(Landroid/widget/Button;[Z)V
    .registers 6

    .line 88
    const/4 v0, 0x0

    aget-boolean v1, p1, v0

    if-eqz v1, :cond_0

    const-string v1, "Following"

    const-string/jumbo v2, "\u8ffd\u8e64\u4e2d"

    const-string v3, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    goto :goto_0

    :cond_0
    const-string v1, "Follow"

    const-string/jumbo v2, "\u8ffd\u8e64"

    const-string v3, "\u30d5\u30a9\u30ed\u30fc"

    :goto_0
    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aget-boolean p1, p1, v0

    invoke-static {p0, v1, p1}, Le/e/a/VideoDetails;->label(Landroid/widget/Button;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 17
    invoke-static {p0}, Le/e/a/ModernShorts;->normalPlayer(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic lambda$20(Ljava/lang/String;Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 13

    .line 88
    const-string v0, "following"

    :try_start_0
    const-string v1, "GET"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/VideoDetails$$ExternalSyntheticLambda22;

    move-object v2, v0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Le/e/a/VideoDetails$$ExternalSyntheticLambda22;-><init>(Le/e/a/NetworkTask;[ZZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/VideoDetails$$ExternalSyntheticLambda23;

    invoke-direct {p2, p1, p4}, Le/e/a/VideoDetails$$ExternalSyntheticLambda23;-><init>(Le/e/a/NetworkTask;Landroid/widget/Button;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method static synthetic lambda$21(Le/e/a/NetworkTask;[ZZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 5

    .line 88
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    aput-boolean p2, p1, p0

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    invoke-virtual {p4, p0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$22(Le/e/a/NetworkTask;Landroid/widget/Button;)V
    .registers 4

    .line 88
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "Retry"

    const-string/jumbo v0, "\u91cd\u8a66"

    const-string v1, "\u518d\u8a66\u884c"

    invoke-static {v1, p0, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$23(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z[ZLjava/lang/String;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 19

    .line 89
    move-object v7, p0

    invoke-virtual {p0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const-string v1, "Retry"

    const-string/jumbo v2, "\u91cd\u8a66"

    const-string v3, "\u518d\u8a66\u884c"

    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1, p2, p3}, Le/e/a/VideoDetails;->followButton(Landroid/widget/Button;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    return-void

    :cond_0
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v0

    const-string v1, "user_session="

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Sign in required"

    const-string/jumbo v3, "\u8acb\u5148\u767b\u5165"

    const-string v4, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {v4, v2, v3}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_1
    invoke-virtual {p0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v8, Le/e/a/NetworkTask;

    invoke-direct {v8}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v8}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    sget-object v9, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;

    move-object v0, v10

    move v1, p3

    move-object v2, p1

    move-object v3, p4

    move-object v4, v8

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Le/e/a/VideoDetails$$ExternalSyntheticLambda11;-><init>(ZLjava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {v8, v9, v10}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$24(ZLjava/lang/String;[ZLe/e/a/NetworkTask;Ljava/lang/String;Ljava/lang/Runnable;Landroid/widget/Button;)V
    .registers 11

    .line 89
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    :try_start_0
    const-string p0, "https://public-api.ch.nicovideo.jp/v1/user/follow"

    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "channelId"

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p4, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    const-string p4, "mode"

    aget-boolean v0, p2, v0

    if-eqz v0, :cond_0

    const-string v0, "delete"

    goto :goto_0

    :cond_0
    const-string v0, "add"

    :goto_0
    invoke-virtual {p1, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p0, p1, p3}, Le/e/a/ModernPosting;->jsonPost(Ljava/lang/String;Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_1
    aget-boolean p0, p2, v0

    if-eqz p0, :cond_2

    const-string p0, "DELETE"

    goto :goto_1

    :cond_2
    const-string p0, "POST"

    :goto_1
    const/4 p1, 0x1

    invoke-static {p4, p0, p1, p3}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    :goto_2
    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/VideoDetails$$ExternalSyntheticLambda13;

    invoke-direct {p1, p3, p2, p5, p6}, Le/e/a/VideoDetails$$ExternalSyntheticLambda13;-><init>(Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p0

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/VideoDetails$$ExternalSyntheticLambda14;

    invoke-direct {p1, p3, p6}, Le/e/a/VideoDetails$$ExternalSyntheticLambda14;-><init>(Le/e/a/NetworkTask;Landroid/widget/Button;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_3
    return-void
.end method

.method static synthetic lambda$25(Le/e/a/NetworkTask;[ZLjava/lang/Runnable;Landroid/widget/Button;)V
    .registers 6

    .line 89
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    aget-boolean v0, p1, p0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    aput-boolean v0, p1, p0

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$26(Le/e/a/NetworkTask;Landroid/widget/Button;)V
    .registers 4

    .line 89
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "Unable to change follow status"

    const-string/jumbo v0, "\u7121\u6cd5\u8b8a\u66f4\u8ffd\u8e64\u72c0\u614b"

    const-string v1, "\u30d5\u30a9\u30ed\u30fc\u306e\u5909\u66f4\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method static synthetic lambda$3(Le/e/a/NetworkTask;Landroid/content/DialogInterface;)V
    .registers 2

    .line 22
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V
    .registers 13

    .line 22
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

    move-result-object v5

    sget-object v0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance v7, Le/e/a/VideoDetails$$ExternalSyntheticLambda9;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p2

    move-object v4, p0

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Le/e/a/VideoDetails$$ExternalSyntheticLambda9;-><init>(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object p0, Le/e/a/VideoDetails;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/VideoDetails$$ExternalSyntheticLambda10;

    invoke-direct {p2, p1, p4}, Le/e/a/VideoDetails$$ExternalSyntheticLambda10;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;)V

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method static synthetic lambda$5(Le/e/a/NetworkTask;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/json/JSONObject;Landroid/widget/LinearLayout;)V
    .registers 5

    .line 22
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p2, p3}, Le/e/a/VideoDetails;->rememberDetails(Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-static {p4, p2, p3}, Le/e/a/VideoDetails;->renderDetails(Landroid/widget/LinearLayout;Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$6(Le/e/a/NetworkTask;Landroid/widget/TextView;)V
    .registers 4

    .line 22
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "Unable to load video details"

    const-string/jumbo v0, "\u7121\u6cd5\u8f09\u5165\u5f71\u7247\u8cc7\u8a0a"

    const-string v1, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, p0, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$7(Lorg/json/JSONObject;Landroid/content/Context;Lorg/json/JSONObject;Landroid/view/View;)V
    .registers 4

    .line 31
    const-string p3, "channel"

    invoke-virtual {p0, p3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p1, p2}, Le/e/a/ChannelPage;->launch(Landroid/content/Context;Lorg/json/JSONObject;)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p3, "https://www.nicovideo.jp/user/"

    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p3, "id"

    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/VideoDetails;->open(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$8(Landroid/widget/TextView;Landroid/view/View;)V
    .registers 2

    .line 31
    invoke-virtual {p0}, Landroid/widget/TextView;->performClick()Z

    return-void
.end method

.method static synthetic lambda$9(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 33
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "https://www.nicovideo.jp/tag/"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/VideoDetails;->open(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private static loadSeries(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 6

    .line 48
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Loading\u2026"

    const-string/jumbo v2, "\u8f09\u5165\u4e2d\u2026"

    const-string/jumbo v3, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {v3, v1, v2}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-static {v0, v1, v2}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Le/e/a/NetworkTask;

    invoke-direct {v1}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v1}, Le/e/a/VideoDetails;->scope(Landroid/view/View;Le/e/a/NetworkTask;)V

    new-instance v2, Le/e/a/VideoDetails$2;

    invoke-direct {v2, v1, v0, p0, p1}, Le/e/a/VideoDetails$2;-><init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v2, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/VideoDetails$$ExternalSyntheticLambda24;

    invoke-direct {v3, p1, v1, p0, v0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda24;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    invoke-virtual {v1, v2, v3}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method static metadata(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 9

    .line 41
    const-string v0, "postedAt"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "registeredAt"

    invoke-virtual {p0, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "count"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const-string v4, "\n"

    if-nez v3, :cond_0

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v5, 0x54

    const/16 v6, 0x20

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const-string v5, "(?:\\+09:00|Z)$"

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Posted"

    const-string v3, "\u6295\u7a3f"

    invoke-static {v3, v1, v3}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eqz p0, :cond_4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "like"

    const-string v1, "mylist"

    const-string v3, "view"

    const-string v4, "comment"

    filled-new-array {v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "Views"

    const-string/jumbo v3, "\u89c0\u770b"

    const-string v4, "\u518d\u751f"

    invoke-static {v4, v1, v3}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Comments"

    const-string/jumbo v4, "\u7559\u8a00"

    const-string v5, "\u30b3\u30e1\u30f3\u30c8"

    invoke-static {v5, v3, v4}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Likes"

    const-string v5, "\u559c\u6b61"

    const-string v6, "\u3044\u3044\u306d"

    invoke-static {v6, v4, v5}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "My lists"

    const-string/jumbo v6, "\u64ad\u653e\u6e05\u55ae"

    const-string v7, "\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {v7, v5, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v1, v3, v4, v5}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x4

    if-lt v3, v4, :cond_1

    goto :goto_2

    :cond_1
    aget-object v4, v0, v3

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_3

    const-string v4, "  "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    aget-object v4, v1, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v5

    aget-object v6, v0, v3

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static open(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    .line 12
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v1, 0x0

    invoke-static {p1, v1}, Le/e/a/HistoryRules;->watchUrl(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    const-string v1, "https://(?:www\\.)?nicovideo\\.jp/user/[0-9]+"

    invoke-virtual {p1, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "com.sauzask.nicoid.NicoidUserVideoListActivity"

    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    :cond_1
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "Unable to open page"

    const-string/jumbo v0, "\u7121\u6cd5\u958b\u555f\u9801\u9762"

    const-string v1, "\u30da\u30fc\u30b8\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v1, p1, v0}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method

.method private static rememberDetails(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 4

    .line 24
    invoke-static {p1, p0}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/VideoDetails;->DETAILS:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/VideoDetails;->DETAILS:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    :goto_0
    return-void
.end method

.method private static renderDetails(Landroid/widget/LinearLayout;Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 19

    .line 26
    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v0, "video"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 27
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x10

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v6, 0x3f800000    # 1.0f

    const/16 v7, 0x12

    const/4 v8, -0x2

    const/4 v9, 0x0

    if-eqz v4, :cond_0

    const-string v10, "title"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v3, v10, v7}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v9, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    invoke-static {v0, v1}, Le/e/a/VideoDetails;->addLike(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 28
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v0, "channel"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "owner"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :cond_1
    move-object v11, v0

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 29
    const/4 v12, 0x0

    const-string v13, ""

    const/16 v14, 0x64

    const/4 v15, 0x1

    if-eqz v11, :cond_2

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-static {v3}, Le/e/a/Ui110;->actionColor(Landroid/content/Context;)I

    move-result v7

    invoke-static {v3, v7, v14}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v15}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x24

    invoke-static {v3, v15}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v3, v15}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v7, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v14, 0x8

    invoke-static {v3, v14}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v7, v14, v9, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v10, v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :try_start_0
    const-string v7, "iconUrl"

    const-string v14, "thumbnail"

    invoke-virtual {v11, v14, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v7, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v0, v12}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v7, "nicoid-details"

    const-string v14, "Unable to load owner image"

    invoke-static {v7, v14, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    :cond_2
    :goto_0
    const-string v0, "name"

    if-nez v11, :cond_3

    goto :goto_1

    :cond_3
    const-string v7, "nickname"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v7, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :goto_1
    invoke-static {v3, v13, v5}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v9, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v10, v1}, Le/e/a/VideoDetails;->bindOwner(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 31
    if-eqz v11, :cond_4

    new-instance v6, Le/e/a/VideoDetails$$ExternalSyntheticLambda19;

    invoke-direct {v6, v1, v3, v11}, Le/e/a/VideoDetails$$ExternalSyntheticLambda19;-><init>(Lorg/json/JSONObject;Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v5 .. v5}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    instance-of v6, v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_4

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    new-instance v7, Le/e/a/VideoDetails$$ExternalSyntheticLambda20;

    invoke-direct {v7, v5}, Le/e/a/VideoDetails$$ExternalSyntheticLambda20;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v6 .. v6}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 32
    :cond_4
    const/16 v5, 0xc

    if-eqz v4, :cond_5

    invoke-static {v2, v4, v5}, Le/e/a/VideoDetails;->addMetadata(Landroid/widget/LinearLayout;Lorg/json/JSONObject;I)V

    .line 33
    :cond_5
    const-string v6, "tag"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_6

    goto :goto_2

    :cond_6
    const-string v7, "items"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    :goto_2
    const/16 v6, 0xe

    if-eqz v12, :cond_9

    new-instance v7, Le/e/a/VideoDetails$TagFlow;

    invoke-direct {v7, v3}, Le/e/a/VideoDetails$TagFlow;-><init>(Landroid/content/Context;)V

    const/4 v10, 0x0

    :goto_3
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lt v10, v11, :cond_7

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v0, v3, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_5

    :cond_7
    invoke-virtual {v12, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    if-nez v11, :cond_8

    const/16 v6, 0x64

    const/4 v14, 0x1

    goto :goto_4

    :cond_8
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "#"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v3, v13, v6}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v13

    invoke-static {v3, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v14

    const/4 v15, 0x6

    invoke-static {v3, v15}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v3, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v3, v15}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v13, v14, v6, v8, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    const/16 v6, 0x64

    invoke-static {v3, v9, v6}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    const/4 v14, 0x1

    invoke-static {v3, v14}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v8, v15, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v13, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Le/e/a/VideoDetails$$ExternalSyntheticLambda21;

    invoke-direct {v5, v3, v11}, Le/e/a/VideoDetails$$ExternalSyntheticLambda21;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v13, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v13 .. v13}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v5, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v13, v5}, Le/e/a/VideoDetails$TagFlow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_4
    add-int/lit8 v10, v10, 0x1

    const/16 v5, 0xc

    const/16 v6, 0xe

    goto :goto_3

    .line 34
    :cond_9
    :goto_5
    if-eqz v4, :cond_a

    const-string v0, "description"

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xe

    invoke-static {v3, v5, v6}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    :cond_a
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v3, "Series"

    const-string/jumbo v5, "\u7cfb\u5217"

    const-string v6, "\u30b7\u30ea\u30fc\u30ba"

    invoke-static {v6, v3, v5}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x12

    invoke-static {v0, v3, v5}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v3, "series"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "id"

    if-eqz v1, :cond_b

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "[0-9]+"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-static {v0, v1}, Le/e/a/VideoDetails;->renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    goto :goto_6

    :cond_b
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v5, "Not part of a series"

    const-string/jumbo v6, "\u672a\u52a0\u5165\u7cfb\u5217"

    const-string v7, "\u30b7\u30ea\u30fc\u30ba\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093"

    invoke-static {v7, v5, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xe

    invoke-static {v1, v5, v6}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 36
    :goto_6
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Parent and child works"

    const-string/jumbo v5, "\u7236\u4f5c\u54c1\u8207\u5b50\u4f5c\u54c1"

    const-string/jumbo v6, "\u89aa\u4f5c\u54c1\u30fb\u5b50\u4f5c\u54c1"

    invoke-static {v6, v1, v5}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v5, 0x12

    invoke-static {v0, v1, v5}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v0, "parents"

    const-string v1, "children"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    :goto_7
    const/4 v1, 0x2

    if-lt v9, v1, :cond_c

    .line 37
    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    move-object/from16 v1, p0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 38
    return-void

    .line 36
    :cond_c
    move-object/from16 v1, p0

    aget-object v5, v0, v9

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v7, Le/e/a/VideoDetails$TreePage;

    move-object/from16 v8, p1

    if-nez v4, :cond_d

    move-object v10, v8

    goto :goto_8

    :cond_d
    invoke-virtual {v4, v3, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :goto_8
    invoke-direct {v7, v6, v10, v5}, Le/e/a/VideoDetails$TreePage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7}, Le/e/a/VideoDetails$TreePage;->load()V

    add-int/lit8 v9, v9, 0x1

    goto :goto_7
.end method

.method private static renderSeries(Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V
    .registers 10

    .line 49
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

    if-eqz v0, :cond_3

    const-string v1, "next"

    const-string v2, "prev"

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x2

    if-lt v3, v4, :cond_0

    goto :goto_2

    :cond_0
    aget-object v4, v1, v3

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "Previous video"

    const-string v6, "\u4e0a\u4e00\u90e8\u5f71\u7247"

    const-string v7, "\u524d\u306e\u52d5\u753b"

    goto :goto_1

    :cond_1
    const-string v4, "Next video"

    const-string v6, "\u4e0b\u4e00\u90e8\u5f71\u7247"

    const-string/jumbo v7, "\u6b21\u306e\u52d5\u753b"

    :goto_1
    invoke-static {v7, v4, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v6, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;

    invoke-direct {v6, p0, p1, v5}, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;-><init>(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    invoke-static {p0, v5, v4, v6}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    :goto_2
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

    .line 82
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

    invoke-static/range {p0 .. p0}, Le/e/a/SecurityPolicy240;->requireApi(Ljava/lang/String;)V

    .line 84
    const-string v0, "https://www.nicovideo.jp"

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p1, p4}, Lnicoid/network238/ReadOnlyConnection239;->openApi(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    invoke-virtual {p3, v1}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2

    if-eqz v2, :cond_e

    :try_start_0
    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 p1, 0x2710

    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    invoke-static {v1, p0}, Le/e/a/WatchRequestHeaders;->apply(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Id"

    const-string v2, "6"

    invoke-virtual {v1, p0, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Version"

    const-string v2, "0"

    invoke-virtual {v1, p0, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Request-With"

    invoke-virtual {v1, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Origin"

    invoke-virtual {v1, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    const-string p0, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p0, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :cond_0
    const/4 p0, 0x0

    const-string p2, "UTF-8"

    if-eqz p4, :cond_4

    :try_start_1
    invoke-virtual {p4, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p4

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v0, "Content-Type"

    const-string v2, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-virtual {v1, v0, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    array-length v0, p4

    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :try_start_2
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    invoke-virtual {v0, p4}, Ljava/io/OutputStream;->write([B)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_4

    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    goto :goto_1

    :catchall_0
    move-exception p0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    :cond_1
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz p0, :cond_2

    if-eq p0, p1, :cond_3

    :try_start_5
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    move-object p0, p1

    :cond_3
    :goto_0
    throw p0

    :cond_4
    :goto_1
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p4

    const/16 v0, 0xc8

    if-lt p4, v0, :cond_d

    const/16 v2, 0x12c

    if-ge p4, v2, :cond_d

    new-instance p4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :try_start_6
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    const/16 v4, 0x2000

    :try_start_7
    new-array v4, v4, [B

    :goto_2
    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    const/4 v6, -0x1

    if-ne v5, v6, :cond_9

    if-eqz v3, :cond_5

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :cond_5
    :try_start_9
    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    if-nez p0, :cond_6

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    goto :goto_3

    :cond_6
    new-instance p0, Lorg/json/JSONObject;

    invoke-virtual {p4, p2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    :goto_3
    const-string p1, "meta"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_8

    const-string p2, "status"

    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ge p1, v2, :cond_7

    goto :goto_4

    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Request rejected"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    goto :goto_0

    :cond_8
    :goto_4
    invoke-virtual {p3, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0

    :cond_9
    :try_start_a
    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v6

    if-nez v6, :cond_a

    invoke-virtual {p4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x200000

    if-gt v6, v7, :cond_a

    invoke-virtual {p4, v4, p1, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Request cancelled or oversized"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p0

    if-eqz v3, :cond_b

    :try_start_b
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_b
    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception p1

    if-eqz p0, :cond_c

    if-eq p0, p1, :cond_3

    :try_start_c
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :cond_c
    move-object p0, p1

    goto/16 :goto_0

    :cond_d
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "HTTP "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    goto/16 :goto_0

    :catchall_4
    move-exception p0

    invoke-virtual {p3, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    :cond_e
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method private static scope(Landroid/view/View;Le/e/a/NetworkTask;)V
    .registers 3

    .line 85
    new-instance v0, Le/e/a/VideoDetails$3;

    invoke-direct {v0, p1}, Le/e/a/VideoDetails$3;-><init>(Le/e/a/NetworkTask;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method

.method public static seriesVideos(Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 3

    .line 60
    if-eqz p1, :cond_0

    const-string v0, "[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Le/e/a/VideoDetails$SeriesPage;

    invoke-direct {v0, p0, p1}, Le/e/a/VideoDetails$SeriesPage;-><init>(Landroid/widget/LinearLayout;Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/VideoDetails$SeriesPage;->load()V

    :cond_0
    return-void
.end method

.method public static shortDetails(Landroid/app/Activity;)V
    .registers 9

    .line 15
    :try_start_0
    const-string v0, "v"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "b0"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 16
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    invoke-static {v5}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 17
    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "\u52d5\u753b\u60c5\u5831"

    const-string v6, "Video details"

    const-string v7, "\u5f71\u7247\u8cc7\u8a0a"

    invoke-static {v4, v6, v7}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v3, "\u901a\u5e38\u518d\u751f\u3067\u958b\u304f"

    const-string v4, "Open normal player"

    const-string/jumbo v6, "\u958b\u555f\u4e00\u822c\u64ad\u653e\u5668"

    invoke-static {v3, v4, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/VideoDetails$$ExternalSyntheticLambda15;

    invoke-direct {v4, p0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda15;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string/jumbo v1, "\u9589\u3058\u308b"

    const-string v3, "Close"

    const-string/jumbo v4, "\u95dc\u9589"

    invoke-static {v1, v3, v4}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 18
    const-string/jumbo p0, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    const-string v1, "Loading\u2026"

    const-string/jumbo v6, "\u8f09\u5165\u4e2d\u2026"

    invoke-static {p0, v1, v6}, Le/e/a/VideoDetails;->tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0xe

    invoke-static {v0, p0, v1}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v4}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    .line 19
    sget-object p0, Le/e/a/VideoDetails;->DETAILS:Ljava/util/Map;

    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v0, Le/e/a/VideoDetails;->DETAILS:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v2, v1}, Le/e/a/VideoDetails;->renderDetails(Landroid/widget/LinearLayout;Ljava/lang/String;Lorg/json/JSONObject;)V

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    :try_start_2
    invoke-static {}, Le/e/a/Review181;->latest()Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_1

    :goto_0
    goto :goto_1

    :cond_1
    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_0

    .line 21
    :goto_1
    if-eqz v3, :cond_2

    invoke-static {p0, v2}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {v2, p0}, Le/e/a/VideoDetails;->rememberDetails(Ljava/lang/String;Lorg/json/JSONObject;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v2, v0}, Le/e/a/VideoDetails;->renderDetails(Landroid/widget/LinearLayout;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void

    .line 22
    :cond_2
    new-instance p0, Le/e/a/NetworkTask;

    invoke-direct {p0}, Le/e/a/NetworkTask;-><init>()V

    new-instance v0, Le/e/a/VideoDetails$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda16;-><init>(Le/e/a/NetworkTask;)V

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    sget-object v0, Le/e/a/VideoDetails;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Le/e/a/VideoDetails$$ExternalSyntheticLambda17;

    move-object v1, v7

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/VideoDetails$$ExternalSyntheticLambda17;-><init>(Ljava/lang/String;Le/e/a/NetworkTask;Landroid/app/AlertDialog;Landroid/widget/LinearLayout;Landroid/widget/TextView;)V

    invoke-virtual {p0, v0, v7}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    goto :goto_2

    .line 19
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 23
    :catch_0
    move-exception p0

    const-string v0, "nicoid-details"

    const-string v1, "Unable to open short video details"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method static target(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 1

    .line 51
    invoke-static {p0}, Le/e/a/DetailData;->target(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 3

    .line 8
    invoke-static {p0, p1, p2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 1

    .line 52
    invoke-static {p0}, Le/e/a/DetailData;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 7
    const-string v0, "\u30cb\u30b3\u30ec\u30dd"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Nico Reports"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object p0, p1

    goto :goto_0

    :cond_0
    const-string p1, "Nico \u52d5\u614b"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    move-object p0, p2

    :cond_1
    :goto_0
    return-object p0
.end method

.method static videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 4

    .line 53
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/VideoDetails;->videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method static videoRow(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 19

    .line 54
    move-object/from16 v0, p1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v3, 0x4

    invoke-static {v1, v3}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v5, 0x6

    invoke-static {v1, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v1, v3}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v1, v5}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v2, v4, v6, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const-string v5, "\u25b6"

    const/16 v6, 0xe

    invoke-static {v1, v5, v6}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static/range {p1 .. p1}, Le/e/a/VideoDetails;->duration(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    const/16 v10, 0xc

    const/4 v11, -0x2

    const/4 v12, 0x2

    const/4 v13, 0x0

    if-nez v9, :cond_0

    invoke-static {v1, v7, v10}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    const-string v9, "nicoid_duration"

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v8, -0x67000000

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-static {v1, v12}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v1, v12}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v7, v8, v13, v9, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v9, 0x55

    invoke-direct {v8, v11, v11, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v7, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x60

    invoke-static {v1, v8}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    const/16 v9, 0x36

    invoke-static {v1, v9}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    const-string v9, ""

    if-eqz v8, :cond_1

    move-object v8, v9

    goto :goto_0

    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v8, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "\n"

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_0
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "globalId"

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "title"

    invoke-virtual {v0, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7, v6}, Le/e/a/VideoDetails;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {v1, v7}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {v1, v7}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v1, v12}, Le/e/a/VideoDetails;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v6, v8, v13, v7, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v3, v0, v10}, Le/e/a/VideoDetails;->addMetadata(Landroid/widget/LinearLayout;Lorg/json/JSONObject;I)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v7, v13, v11, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static/range {p1 .. p1}, Le/e/a/VideoDetails;->metadata(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;

    move-object/from16 v6, p3

    invoke-direct {v3, v6, v1, v0}, Le/e/a/VideoDetails$$ExternalSyntheticLambda12;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static/range {v2 .. v2}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    move-object v1, p0

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    invoke-static/range {p1 .. p1}, Le/e/a/VideoDetails;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4, v5}, Le/e/a/ThumbnailCorners;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    return-void
.end method

.method static watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 1

    .line 47
    invoke-static {p0}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
