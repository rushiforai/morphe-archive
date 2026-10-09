.class public final Le/e/a/FollowFeed;
.super Ljava/lang/Object;
.source "FollowFeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FollowFeed$Holder;,
        Le/e/a/FollowFeed$LoginRequired;,
        Le/e/a/FollowFeed$Rows;,
        Le/e/a/FollowFeed$State;,
        Le/e/a/FollowFeed$Thumbnail;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final STATES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/FollowFeed$State;",
            ">;"
        }
    .end annotation
.end field

.field private static final WORKER:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 21
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FollowFeed;->MAIN:Landroid/os/Handler;

    .line 22
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/FollowFeed;->WORKER:Ljava/util/concurrent/ExecutorService;

    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    .registers 3

    .line 50
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/content/Context;I)I
    .registers 2

    .line 36
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$10(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    .registers 2

    .line 259
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    .registers 3

    .line 275
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    return-void
.end method

.method static synthetic access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    .registers 3

    .line 162
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    return-void
.end method

.method static synthetic access$13(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 201
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void
.end method

.method static synthetic access$14(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 210
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void
.end method

.method static synthetic access$15()Ljava/util/WeakHashMap;
    .registers 1

    .line 23
    sget-object v0, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 37
    invoke-static {p0, p1, p2, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Landroid/content/Context;I)Ljava/lang/String;
    .registers 2

    .line 206
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->period(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    .registers 2

    .line 245
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5(Landroid/content/Context;)I
    .registers 1

    .line 47
    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method static synthetic access$6(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    .registers 4

    .line 55
    invoke-static {p0, p1, p2, p3}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 60
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 2

    .line 269
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->event(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 2

    .line 264
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->badge(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static badge(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 4

    .line 265
    iget-object v0, p1, Le/e/a/FollowFeedData$Item;->label:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object p0, p1, Le/e/a/FollowFeedData$Item;->label:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 266
    :cond_13
    iget-boolean v0, p1, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz v0, :cond_22

    const-string p1, "Short upload"

    const-string v0, "\u77ed\u5f71\u7247\u6295\u7a3f"

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u6295\u7a3f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_37

    .line 267
    :cond_22
    iget-boolean p1, p1, Le/e/a/FollowFeedData$Item;->upload:Z

    if-eqz p1, :cond_2d

    const-string p1, "Video upload"

    const-string v0, "\u5f71\u7247\u6295\u7a3f"

    const-string v1, "\u52d5\u753b\u6295\u7a3f"

    goto :goto_33

    :cond_2d
    const-string p1, "Video"

    const-string v0, "\u5f71\u7247"

    const-string v1, "\u52d5\u753b"

    :goto_33
    invoke-static {p0, v1, p1, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 266
    :goto_37
    return-object p0
.end method

.method private static bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    .registers 5

    .line 260
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/view/View;

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Landroid/widget/ImageView;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Landroid/widget/TextView;

    .line 261
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_21

    return-void

    .line 262
    :cond_21
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {p1, v1, p0}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 263
    return-void
.end method

.method private static chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 7

    .line 61
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 62
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 63
    const/16 v1, 0x10

    invoke-static {p0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x6

    invoke-static {p0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0x18

    invoke-static {p0, v1, v2, p1}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-object v0
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 43
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 45
    :cond_11
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez p1, :cond_18

    iget p0, v0, Landroid/util/TypedValue;->data:I

    goto :goto_22

    :cond_18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    :goto_22
    return p0
.end method

.method private static cookie(Landroid/app/Activity;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 142
    const-string v0, "e.e.a.v0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "E"

    invoke-static {p0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    if-nez p0, :cond_19

    const-string p0, "b"

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 143
    :cond_19
    if-nez p0, :cond_1e

    const-string p0, ""

    goto :goto_3a

    :cond_1e
    const-string v2, "org.apache.http.client.CookieStore"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v2, "a"

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_3a
    return-object p0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 36
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static event(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 4

    .line 270
    iget-object v0, p1, Le/e/a/FollowFeedData$Item;->message:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object p0, p1, Le/e/a/FollowFeedData$Item;->message:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 271
    :cond_13
    iget-object v0, p1, Le/e/a/FollowFeedData$Item;->subMessage:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_26

    iget-object p0, p1, Le/e/a/FollowFeedData$Item;->subMessage:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 272
    :cond_26
    iget-boolean v0, p1, Le/e/a/FollowFeedData$Item;->upload:Z

    if-eqz v0, :cond_40

    iget-boolean p1, p1, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz p1, :cond_39

    const-string p1, "Uploaded a short video"

    const-string v0, "\u6295\u7a3f\u4e86\u77ed\u5f71\u7247"

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u52d5\u753b\u3092\u6295\u7a3f\u3057\u307e\u3057\u305f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_4a

    .line 273
    :cond_39
    const-string p1, "Uploaded a video"

    const-string v0, "\u6295\u7a3f\u4e86\u5f71\u7247"

    const-string v1, "\u52d5\u753b\u3092\u6295\u7a3f\u3057\u307e\u3057\u305f"

    goto :goto_46

    :cond_40
    const-string p1, "Video activity"

    const-string v0, "\u5f71\u7247\u52d5\u614b"

    const-string v1, "\u52d5\u753b\u306e\u30a2\u30af\u30c6\u30a3\u30d3\u30c6\u30a3"

    :goto_46
    invoke-static {p0, v1, p1, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 272
    :goto_4a
    return-object p0
.end method

.method private static fetch(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://api.feed.nicovideo.jp/v1/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 147
    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v0

    if-eqz v0, :cond_e7

    .line 149
    const/16 v0, 0x2710

    :try_start_22
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 150
    const-string v1, "X-Frontend-Id"

    const-string v2, "6"

    invoke-virtual {p0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "X-Frontend-Version"

    const-string v2, "0"

    invoke-virtual {p0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Cookie"

    invoke-virtual {p0, v1, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v1, 0x191

    const/4 v2, 0x0

    if-eq p1, v1, :cond_d9

    const/16 v1, 0x193

    if-eq p1, v1, :cond_d9

    const/16 v1, 0xc8

    if-ne p1, v1, :cond_c4

    .line 152
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_55
    .catchall {:try_start_22 .. :try_end_55} :catchall_df

    .line 153
    :try_start_55
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v1, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_60
    .catchall {:try_start_55 .. :try_end_60} :catchall_ba

    .line 154
    const/16 v3, 0x1000

    :try_start_62
    new-array v3, v3, [C

    .line 155
    :goto_64
    invoke-virtual {v1, v3}, Ljava/io/Reader;->read([C)I

    move-result v4
    :try_end_68
    .catchall {:try_start_62 .. :try_end_68} :catchall_b4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_94

    .line 156
    :try_start_6b
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_6e
    .catchall {:try_start_6b .. :try_end_6e} :catchall_ba

    .line 157
    :try_start_6e
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 158
    const-string p1, "ok"

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_83
    .catchall {:try_start_6e .. :try_end_83} :catchall_df

    if-eqz p1, :cond_8c

    .line 159
    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    .line 158
    :cond_8c
    :try_start_8c
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Feed did not return ok"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_94
    .catchall {:try_start_8c .. :try_end_94} :catchall_df

    .line 155
    :cond_94
    :try_start_94
    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5

    if-nez v5, :cond_ae

    invoke-virtual {p1, v3, v0, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/high16 v5, 0x400000

    if-gt v4, v5, :cond_a6

    goto :goto_64

    :cond_a6
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Feed response too large"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_ad
    throw p1

    :cond_ae
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V
    :try_end_b3
    .catchall {:try_start_94 .. :try_end_b3} :catchall_b4

    goto :goto_ad

    .line 156
    :catchall_b4
    move-exception p1

    move-object v2, p1

    :try_start_b6
    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    throw v2
    :try_end_ba
    .catchall {:try_start_b6 .. :try_end_ba} :catchall_ba

    :catchall_ba
    move-exception p1

    if-eqz v2, :cond_c3

    if-eq v2, p1, :cond_c2

    :try_start_bf
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c2
    move-object p1, v2

    :cond_c3
    throw p1

    .line 151
    :cond_c4
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Feed HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d9
    new-instance p1, Le/e/a/FollowFeed$LoginRequired;

    invoke-direct {p1, v2}, Le/e/a/FollowFeed$LoginRequired;-><init>(Le/e/a/FollowFeed$LoginRequired;)V

    throw p1
    :try_end_df
    .catchall {:try_start_bf .. :try_end_df} :catchall_df

    .line 159
    :catchall_df
    move-exception p1

    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1

    .line 147
    :cond_e7
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method private static filterName(Landroid/content/Context;I)Ljava/lang/String;
    .registers 8

    .line 67
    const-string v0, "Content uploads"

    const-string v1, "\u5167\u5bb9\u6295\u7a3f"

    const-string v2, "\u30b3\u30f3\u30c6\u30f3\u30c4\u6295\u7a3f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "Video uploads"

    const-string v2, "\u5f71\u7247\u6295\u7a3f"

    const-string v3, "\u52d5\u753b\u6295\u7a3f"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Short uploads"

    const-string v3, "\u77ed\u5f71\u7247\u6295\u7a3f"

    const-string v4, "\u30b7\u30e7\u30fc\u30c8\u6295\u7a3f"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "All"

    const-string v4, "\u5168\u90e8"

    const-string v5, "\u3059\u3079\u3066"

    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [[Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v1, 0x2

    aput-object v2, v4, v1

    const/4 v2, 0x3

    aput-object v3, v4, v2

    .line 68
    aget-object v2, v4, p1

    aget-object v2, v2, v5

    aget-object v3, v4, p1

    aget-object v0, v3, v0

    aget-object p1, v4, p1

    aget-object p1, p1, v1

    invoke-static {p0, v2, v0, p1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    .registers 8

    .line 246
    if-eqz p1, :cond_8

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    goto :goto_d

    :cond_8
    new-instance v0, Le/e/a/FollowFeed$Thumbnail;

    invoke-direct {v0, p0}, Le/e/a/FollowFeed$Thumbnail;-><init>(Landroid/content/Context;)V

    :goto_d
    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x0

    if-eqz p1, :cond_17

    const/16 v3, 0x64

    goto :goto_18

    :cond_17
    const/4 v3, 0x0

    :goto_18
    invoke-static {p0, v1, v3, v2}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 247
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    if-eqz p1, :cond_37

    const/16 v3, 0x12

    goto :goto_39

    :cond_37
    const/16 v3, 0x1c

    :goto_39
    invoke-static {p0, v3, v2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v3

    if-eqz p1, :cond_42

    const-string v5, "\u25cf"

    goto :goto_44

    :cond_42
    const-string v5, "\u25b6"

    :goto_44
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p0, 0x11

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setGravity(I)V

    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {p0, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    const/4 p0, 0x2

    new-array p0, p0, [Landroid/view/View;

    aput-object v1, p0, v2

    const/4 v1, 0x1

    aput-object v3, p0, v1

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 250
    if-eqz p1, :cond_6b

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    :cond_6b
    return-object v0
.end method

.method private static label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    .registers 4

    .line 51
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    int-to-float p0, p1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    if-eqz p2, :cond_1c

    const-string p0, "sans-serif-medium"

    const/4 p1, 0x0

    invoke-static {p0, p1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 53
    :cond_1c
    return-object v0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 92
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.sauzask.nicoid.NicoidFavUserActivity"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/FollowFeed$State;ILandroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 100
    iget p3, p0, Le/e/a/FollowFeed$State;->filter:I

    if-eq p3, p1, :cond_10

    iput p1, p0, Le/e/a/FollowFeed$State;->filter:I

    const/4 p1, 0x1

    invoke-static {p2, p0, p1}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    iget-object p0, p0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_10
    return-void
.end method

.method static synthetic lambda$10(Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 241
    invoke-virtual {p1}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {p2, p0}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p0}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p0, p0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Le/e/a/FollowFeed$State;Landroid/view/View;)V
    .registers 3

    .line 109
    iget-boolean p2, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-eqz p2, :cond_e

    iget-object p2, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_e

    const/4 p2, 0x1

    goto :goto_f

    :cond_e
    const/4 p2, 0x0

    :goto_f
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    return-void
.end method

.method static synthetic lambda$3(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7

    .line 114
    iget-object p2, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p4, p2, :cond_1e

    iget-object p2, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    instance-of p2, p2, Le/e/a/FollowFeedData$Item;

    if-eqz p2, :cond_1e

    iget-object p0, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FollowFeedData$Item;

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    .line 115
    :cond_1e
    return-void
.end method

.method static synthetic lambda$4(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 139
    invoke-static {p0}, Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$5(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 19

    .line 172
    move-object v0, p1

    move-object v1, p2

    move-object v8, p3

    const/4 v2, 0x4

    :try_start_4
    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "publish"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "video"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "short_video"

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "all"

    const/4 v6, 0x3

    aput-object v3, v2, v6

    .line 173
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "activities/followings/"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object v2, v2, p0

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?context=my_timeline&limit=50"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 174
    if-eqz v0, :cond_50

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "&cursor="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {p1, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 175
    :cond_50
    invoke-static {v2, p2, p3}, Le/e/a/FollowFeed;->fetch(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FollowFeedData;->parse(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v6

    .line 176
    const-string v2, "nextCursor"

    invoke-static {v0, v2}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 177
    const-string v2, "activities"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_6e

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-eqz v0, :cond_6e

    const/4 v9, 0x0

    goto :goto_6f

    :cond_6e
    const/4 v9, 0x1

    .line 178
    :goto_6f
    nop

    .line 179
    if-eqz p4, :cond_85

    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_76} :catch_9c

    if-nez v0, :cond_85

    :try_start_78
    const-string v0, "actors?limit=50"

    invoke-static {v0, p2, p3}, Le/e/a/FollowFeed;->fetch(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Le/e/a/FollowFeedData;->actors(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v0
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_82} :catch_84

    move-object v5, v0

    goto :goto_87

    :catch_84
    move-exception v0

    .line 180
    :cond_85
    const/4 v0, 0x0

    move-object v5, v0

    :goto_87
    nop

    .line 181
    :try_start_88
    sget-object v10, Le/e/a/FollowFeed;->MAIN:Landroid/os/Handler;

    new-instance v11, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;

    move-object v0, v11

    move-object v1, p3

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object v4, v6

    move-object v6, v7

    move v7, v9

    invoke-direct/range {v0 .. v7}, Le/e/a/FollowFeed$$ExternalSyntheticLambda1;-><init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_9b} :catch_9c

    .line 191
    goto :goto_b9

    :catch_9c
    move-exception v0

    .line 192
    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-eqz v1, :cond_a4

    return-void

    .line 193
    :cond_a4
    sget-object v1, Le/e/a/FollowFeed;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    invoke-direct {v2, p3, v3, v4, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda2;-><init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 197
    const-string v1, "nicoid-feed"

    const-string v2, "Feed request failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 199
    :goto_b9
    return-void
.end method

.method static synthetic lambda$6(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 9

    .line 182
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_dc

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-ne v0, p0, :cond_dc

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_dc

    iget-boolean p0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-eqz p0, :cond_16

    goto/16 :goto_dc

    .line 183
    :cond_16
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    :goto_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_c5

    .line 184
    iget-object p0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    new-instance p3, Le/e/a/FollowFeed$$ExternalSyntheticLambda4;

    invoke-direct {p3}, Le/e/a/FollowFeed$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {p0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 185
    if-eqz p4, :cond_4c

    iget-object p0, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_35
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_3c

    goto :goto_4c

    :cond_3c
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/FollowFeedData$Actor;

    iget-object p4, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {p3}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0, p3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    .line 186
    :cond_4c
    :goto_4c
    iget-object p0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_52
    :goto_52
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_99

    .line 187
    invoke-virtual {p5}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_60

    const/4 p0, 0x0

    goto :goto_61

    :cond_60
    move-object p0, p5

    :goto_61
    iput-object p0, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    const/4 p0, 0x0

    if-nez p6, :cond_74

    iget-object p3, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    if-eqz p3, :cond_74

    iget-object p3, p1, Le/e/a/FollowFeed$State;->cursors:Ljava/util/HashSet;

    invoke-virtual {p3, p5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_74

    const/4 p3, 0x0

    goto :goto_75

    :cond_74
    const/4 p3, 0x1

    :goto_75
    iput-boolean p3, p1, Le/e/a/FollowFeed$State;->end:Z

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->busy:Z

    .line 188
    invoke-static {p2, p1}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 189
    iget-object p0, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-nez p1, :cond_8b

    const-string p1, ""

    goto :goto_95

    :cond_8b
    const-string p1, "Filtered by creator"

    const-string p3, "\u4f9d\u6295\u7a3f\u8005\u7be9\u9078"

    const-string p4, "\u6295\u7a3f\u8005\u3067\u7d5e\u308a\u8fbc\u307f\u4e2d"

    invoke-static {p2, p4, p1, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_95
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    return-void

    .line 186
    :cond_99
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/FollowFeedData$Item;

    iget-object p4, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    iget-object p4, p4, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_52

    iget-object p4, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    iget-object v0, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    invoke-virtual {v0}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_52

    iget-object p4, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    iget-object v0, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    invoke-virtual {v0}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    invoke-virtual {p4, v0, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_52

    .line 183
    :cond_c5
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/FollowFeedData$Item;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->ids:Ljava/util/HashSet;

    iget-object v1, p3, Le/e/a/FollowFeedData$Item;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1a

    .line 182
    :cond_dc
    :goto_dc
    return-void
.end method

.method static synthetic lambda$7(Le/e/a/FollowFeedData$Item;Le/e/a/FollowFeedData$Item;)I
    .registers 4

    .line 184
    iget-wide v0, p1, Le/e/a/FollowFeedData$Item;->time:J

    iget-wide p0, p0, Le/e/a/FollowFeedData$Item;->time:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$8(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V
    .registers 6

    .line 193
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-ne v0, p0, :cond_40

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_40

    iget-boolean p0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-eqz p0, :cond_15

    goto :goto_40

    :cond_15
    const/4 p0, 0x0

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->busy:Z

    const/4 p0, 0x1

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->failed:Z

    .line 194
    iget-object p0, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    instance-of p3, p3, Le/e/a/FollowFeed$LoginRequired;

    if-eqz p3, :cond_2c

    const-string p3, "Please sign in again"

    const-string v0, "\u8acb\u91cd\u65b0\u767b\u5165"

    const-string v1, "\u30ed\u30b0\u30a4\u30f3\u3057\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, v1, p3, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_36

    .line 195
    :cond_2c
    const-string p3, "Could not load. Refresh to retry"

    const-string v0, "\u7121\u6cd5\u53d6\u5f97\uff0c\u8acb\u91cd\u65b0\u6574\u7406\u4ee5\u91cd\u8a66"

    const-string v1, "\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u66f4\u65b0\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, v1, p3, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 194
    :goto_36
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    invoke-static {p2, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void

    .line 193
    :cond_40
    :goto_40
    return-void
.end method

.method static synthetic lambda$9(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 230
    const/4 p2, 0x0

    iput-object p2, p0, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {p1, p0}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p1, p0}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p0, p0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    return-void
.end method

.method public static load(Landroid/app/Activity;)V
    .registers 17

    .line 71
    move-object/from16 v0, p0

    const-string v1, "Nico \u52d5\u614b"

    const-string v2, "Nico Reports"

    const-string v3, "\u30cb\u30b3\u30ec\u30dd"

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "nicoid_my_page"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_19

    invoke-static/range {p0 .. p0}, Le/e/a/AccountPage;->load(Landroid/app/Activity;)V

    return-void

    .line 73
    :cond_19
    :try_start_19
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "H"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v0, v6}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 74
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "I"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 75
    sget-object v4, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FollowFeed$State;

    .line 76
    if-nez v4, :cond_2c0

    .line 77
    new-instance v4, Le/e/a/FollowFeed$State;

    const/4 v7, 0x0

    invoke-direct {v4, v7}, Le/e/a/FollowFeed$State;-><init>(Le/e/a/FollowFeed$State;)V

    const-string v8, "A"

    invoke-static {v0, v8}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/ListView;

    iput-object v8, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v8, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    if-nez v8, :cond_53

    return-void

    .line 78
    :cond_53
    const-string v8, "O"

    invoke-static {v0, v8}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 79
    if-eqz v8, :cond_6a

    const-string v9, "b"

    new-array v10, v5, [Ljava/lang/Class;

    const-class v11, Ljava/lang/CharSequence;

    aput-object v11, v10, v6

    new-array v11, v5, [Ljava/lang/Object;

    aput-object v7, v11, v6

    invoke-static {v8, v9, v10, v11}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_6a
    invoke-static {v0, v3, v2, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    if-eqz v8, :cond_86

    const-string v9, "c"

    new-array v10, v5, [Ljava/lang/Class;

    const-class v11, Ljava/lang/CharSequence;

    aput-object v11, v10, v6

    new-array v11, v5, [Ljava/lang/Object;

    invoke-static {v0, v3, v2, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v6

    invoke-static {v8, v9, v10, v11}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_86
    const-string v8, "Q"

    invoke-static {v0, v8}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    if-eqz v8, :cond_95

    iget-object v9, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v9, v8}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    .line 83
    :cond_95
    iget-object v8, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v8}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    instance-of v8, v8, Landroid/view/ViewGroup;

    if-eqz v8, :cond_ac

    iget-object v8, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v8}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    iget-object v9, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 84
    :cond_ac
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {v8}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 85
    nop

    .line 86
    const/16 v9, 0x14

    invoke-static {v0, v9, v5}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v10

    invoke-static {v0, v3, v2, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x10

    invoke-static {v0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0xc

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {v0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v12

    const/4 v13, 0x4

    invoke-static {v0, v13}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v10, v2, v11, v12, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 87
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v10, 0x8

    invoke-static {v0, v10}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {v0, v10}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {v0, v10}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v0, v13}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v2, v11, v12, v14, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 88
    new-instance v11, Landroid/widget/HorizontalScrollView;

    invoke-direct {v11, v0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v6}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 89
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v12, v4, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    iget-object v12, v4, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v12, v4, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v12}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 90
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v15, -0x2

    invoke-direct {v12, v6, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    const-string v11, "\u30d5\u30a9\u30ed\u30fc\u4e00\u89a7"

    const-string v12, "Following"

    const-string v5, "\u8ffd\u8e64\u5217\u8868"

    invoke-static {v0, v11, v12, v5}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    .line 92
    new-instance v11, Le/e/a/FollowFeed$$ExternalSyntheticLambda5;

    invoke-direct {v11, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v5, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x30

    invoke-static {v0, v12}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v11, v15, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v10}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {v0, v10}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v2, v5, v7, v11, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 96
    const/4 v5, 0x0

    :goto_161
    if-lt v5, v13, :cond_276

    .line 102
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v5, v7, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {v0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v2, v5, v6, v1, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 104
    invoke-static {v0, v3, v6}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v4, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object v1, v4, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    const v5, 0x3f333333    # 0.7f

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v1, v4, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v6, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    new-instance v1, Landroid/widget/ProgressBar;

    invoke-direct {v1, v0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v1, v4, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iget-object v1, v4, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static/range {p0 .. p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v5

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v5, v10}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 106
    iget-object v1, v4, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {v0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v5, v10, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x1c

    invoke-static {v0, v5}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v1, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v0, v3}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v9, 0x18

    invoke-static {v0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v1, v2, v5, v3, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 108
    const-string v2, "\u904e\u53bb\u306e\u65b0\u7740\u3092\u8aad\u307f\u8fbc\u3080"

    const-string v3, "Load older activity"

    const-string v5, "\u8f09\u5165\u8f03\u65e9\u7684\u52d5\u614b"

    invoke-static {v0, v2, v3, v5}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, v4, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    .line 109
    iget-object v2, v4, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    new-instance v3, Le/e/a/FollowFeed$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0, v4}, Le/e/a/FollowFeed$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v4, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 110
    iget-object v2, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3, v6}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance v1, Le/e/a/FollowFeed$Rows;

    invoke-direct {v1, v0, v4}, Le/e/a/FollowFeed$Rows;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iput-object v1, v4, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v2, v4, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 111
    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v1, v6}, Landroid/widget/ListView;->setCacheColorHint(I)V

    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-static {v1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 113
    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v2, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;

    invoke-direct {v2, v4, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda8;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 116
    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v2, Le/e/a/FollowFeed$1;

    invoke-direct {v2, v4, v0}, Le/e/a/FollowFeed$1;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 122
    iget-object v1, v4, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v6, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "y"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    invoke-static {v0, v4}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {v0, v4}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 125
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    new-instance v2, Le/e/a/FollowFeed$2;

    invoke-direct {v2, v0, v4}, Le/e/a/FollowFeed$2;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-virtual {v1, v2}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_2c0

    .line 97
    :cond_276
    const/4 v10, 0x0

    invoke-static {v0, v5}, Le/e/a/FollowFeed;->filterName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v7

    iget-object v11, v4, Le/e/a/FollowFeed$State;->chips:Ljava/util/ArrayList;

    invoke-virtual {v11, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    const/high16 v11, 0x41300000    # 11.0f

    invoke-virtual {v7, v11}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v11, 0x3

    invoke-static {v0, v11}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v11}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v7, v1, v6, v3, v6}, Landroid/widget/Button;->setPadding(IIII)V

    const/4 v1, 0x2

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setMaxLines(I)V

    .line 99
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v12}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v6, v3, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-ne v5, v11, :cond_2a6

    const/4 v3, 0x0

    goto :goto_2aa

    :cond_2a6
    invoke-static {v0, v13}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v3

    :goto_2aa
    invoke-virtual {v1, v6, v6, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {v2, v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    new-instance v1, Le/e/a/FollowFeed$$ExternalSyntheticLambda6;

    invoke-direct {v1, v4, v5, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda6;-><init>(Le/e/a/FollowFeed$State;ILandroid/app/Activity;)V

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    add-int/lit8 v5, v5, 0x1

    const/16 v1, 0x10

    const/16 v3, 0xc

    goto/16 :goto_161

    .line 135
    :cond_2c0
    :goto_2c0
    const/4 v1, 0x1

    invoke-static {v0, v4, v1}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    :try_end_2c4
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_2c4} :catch_2c5

    .line 136
    goto :goto_2cd

    :catch_2c5
    move-exception v0

    const-string v1, "nicoid-feed"

    const-string v2, "Feed view failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 137
    :goto_2cd
    return-void
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)Z
    .registers 5

    .line 139
    invoke-interface {p1}, Landroid/view/Menu;->clear()V

    const-string v0, "Refresh"

    const-string v1, "\u91cd\u65b0\u6574\u7406"

    const-string v2, "\u66f4\u65b0"

    invoke-static {p0, v2, v0, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/FollowFeed$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    const/4 p0, 0x1

    return p0
.end method

.method private static open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    .registers 6

    .line 276
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 277
    if-eqz p2, :cond_21

    const-string p1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    goto :goto_23

    :cond_21
    const-string p1, "com.sauzask.nicoid.NicoidVideoActivity"

    :goto_23
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 276
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 278
    return-void
.end method

.method private static period(Landroid/content/Context;I)Ljava/lang/String;
    .registers 10

    .line 207
    const-string v0, "Today"

    const-string v1, "\u4eca\u5929"

    const-string v2, "\u4eca\u65e5"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "Yesterday"

    const-string v2, "\u6628\u5929"

    const-string v3, "\u6628\u65e5"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Past week"

    const-string v3, "\u4e00\u9031\u5167"

    const-string v4, "1\u9031\u9593"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "Past month"

    const-string v4, "\u4e00\u500b\u6708\u5167"

    const-string v5, "1\u304b\u6708"

    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "Older than a month"

    const-string v5, "\u4e00\u500b\u6708\u4ee5\u524d"

    const-string v6, "1\u304b\u6708\u4ee5\u4e0a\u524d"

    filled-new-array {v6, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Date unavailable"

    const-string v6, "\u65e5\u671f\u4e0d\u660e"

    const-string v7, "\u65e5\u4ed8\u4e0d\u660e"

    filled-new-array {v7, v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x6

    new-array v6, v6, [[Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v1, 0x2

    aput-object v2, v6, v1

    const/4 v2, 0x3

    aput-object v3, v6, v2

    const/4 v2, 0x4

    aput-object v4, v6, v2

    const/4 v2, 0x5

    aput-object v5, v6, v2

    .line 208
    aget-object v2, v6, p1

    aget-object v2, v2, v7

    aget-object v3, v6, p1

    aget-object v0, v3, v0

    aget-object p1, v6, p1

    aget-object p1, p1, v1

    invoke-static {p0, v2, v0, p1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 11

    .line 211
    iget-object v0, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 212
    iget-object v0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, -0x1

    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_a2

    .line 215
    const/4 v3, 0x0

    const/4 v0, 0x0

    :goto_15
    iget-object v2, p1, Le/e/a/FollowFeed$State;->chips:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_41

    .line 221
    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v0, :cond_3b

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez v0, :cond_3b

    iget-object v0, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-nez v1, :cond_2e

    const-string p0, ""

    goto :goto_38

    :cond_2e
    const-string v1, "Filtered by creator"

    const-string v2, "\u4f9d\u6295\u7a3f\u8005\u7be9\u9078"

    const-string v3, "\u6295\u7a3f\u8005\u3067\u7d5e\u308a\u8fbc\u307f\u4e2d"

    invoke-static {p0, v3, v1, v2}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_38
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    :cond_3b
    iget-object p0, p1, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    invoke-virtual {p0}, Le/e/a/FollowFeed$Rows;->notifyDataSetChanged()V

    .line 223
    return-void

    .line 216
    :cond_41
    iget-object v2, p1, Le/e/a/FollowFeed$State;->chips:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iget v4, p1, Le/e/a/FollowFeed$State;->filter:I

    if-ne v0, v4, :cond_4f

    const/4 v4, 0x1

    goto :goto_50

    :cond_4f
    const/4 v4, 0x0

    :goto_50
    invoke-virtual {v2, v4}, Landroid/widget/Button;->setSelected(Z)V

    .line 217
    if-eqz v4, :cond_5a

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v5

    goto :goto_5e

    :cond_5a
    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result v5

    :goto_5e
    const/16 v6, 0x18

    invoke-static {p0, v5, v6, v3}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 218
    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v6

    mul-int/lit16 v6, v6, 0x12b

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v7

    mul-int/lit16 v7, v7, 0x24b

    add-int/2addr v6, v7

    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x72

    add-int/2addr v6, v5

    int-to-double v5, v6

    const-wide v7, 0x408f400000000000L    # 1000.0

    div-double/2addr v5, v7

    .line 219
    if-eqz v4, :cond_97

    const-wide v7, 0x4063600000000000L    # 155.0

    cmpl-double v4, v5, v7

    if-lez v4, :cond_95

    const v4, -0xefeeec

    goto :goto_9b

    :cond_95
    const/4 v4, -0x1

    goto :goto_9b

    :cond_97
    invoke-static {v2}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v4

    :goto_9b
    invoke-virtual {v2, v4}, Landroid/widget/Button;->setTextColor(I)V

    .line 215
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_15

    .line 212
    :cond_a2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/FollowFeedData$Item;

    const/4 v4, 0x3

    iget-object v5, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Le/e/a/FollowFeedData$Item;->matches(ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 213
    iget-wide v4, v3, Le/e/a/FollowFeedData$Item;->time:J

    iget-wide v6, p1, Le/e/a/FollowFeed$State;->now:J

    invoke-static {v4, v5, v6, v7}, Le/e/a/FollowFeedData;->bucket(JJ)I

    move-result v4

    if-eq v4, v2, :cond_c5

    iget-object v2, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v2, v4

    :cond_c5
    iget-object v4, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d
.end method

.method private static renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 15

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    iget-object v1, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/16 v5, 0x32

    if-nez v4, :cond_20

    :goto_1f
    goto :goto_2b

    :cond_20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FollowFeedData$Actor;

    add-int/lit8 v6, v3, 0x1

    if-lt v3, v5, :cond_123

    goto :goto_1f

    .line 227
    :goto_2b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    return-void

    :cond_38
    iput-object v0, p1, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    .line 228
    iget-object v0, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 229
    const-string v0, "All"

    const-string v1, "\u5168\u90e8"

    const-string v3, "\u3059\u3079\u3066"

    invoke-static {p0, v3, v0, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    const/4 v3, 0x1

    if-nez v1, :cond_54

    const/4 v1, 0x1

    goto :goto_55

    :cond_54
    const/4 v1, 0x0

    :goto_55
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 230
    new-instance v1, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda9;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object v1, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x28

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, -0x2

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    nop

    .line 233
    iget-object v0, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v0, 0x0

    :goto_7d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_84

    goto :goto_8e

    :cond_84
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FollowFeedData$Actor;

    .line 234
    add-int/lit8 v4, v0, 0x1

    if-lt v0, v5, :cond_8f

    .line 244
    :goto_8e
    return-void

    .line 235
    :cond_8f
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v6, 0x11

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 236
    const/4 v9, 0x4

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v0, v10, v11, v12, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 237
    invoke-virtual {v1}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c9

    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result v9

    const/16 v10, 0xc

    invoke-static {p0, v9, v10, v3}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 238
    :cond_c9
    invoke-static {p0, v3}, Le/e/a/FollowFeed;->imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;

    move-result-object v9

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v11, 0x30

    invoke-static {p0, v11}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-static {p0, v11}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v10, v12, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 239
    const/16 v10, 0xb

    invoke-static {p0, v10, v2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v10

    iget-object v11, v1, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 240
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x1

    invoke-direct {v6, v11, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v10, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    invoke-static {v9, v6}, Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    .line 241
    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;

    invoke-direct {v6, p1, v1, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda10;-><init>(Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;Landroid/app/Activity;)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    iget-object v1, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x48

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move v0, v4

    goto/16 :goto_7d

    .line 226
    :cond_123
    const/16 v3, 0x7c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, v4, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v4, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v3, v6

    goto/16 :goto_17
.end method

.method private static request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    .registers 14

    .line 163
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_a4

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_a4

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-nez v0, :cond_a4

    if-nez p2, :cond_1c

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v0, :cond_a4

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->end:Z

    if-eqz v0, :cond_1c

    goto/16 :goto_a4

    .line 164
    :cond_1c
    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz v0, :cond_25

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    :cond_25
    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->failed:Z

    .line 165
    if-eqz p2, :cond_47

    const/4 v1, 0x0

    iput-object v1, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->end:Z

    iget-object v1, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p1, Le/e/a/FollowFeed$State;->ids:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    iget-object v1, p1, Le/e/a/FollowFeed$State;->cursors:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Le/e/a/FollowFeed$State;->now:J

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 166
    :cond_47
    :try_start_47
    invoke-static {p0}, Le/e/a/FollowFeed;->cookie(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_4b} :catch_4d

    :goto_4b
    move-object v5, v1

    goto :goto_51

    :catch_4d
    move-exception v1

    const-string v1, ""

    goto :goto_4b

    .line 167
    :goto_51
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_72

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    iput-boolean v2, p1, Le/e/a/FollowFeed$State;->failed:Z

    iget-object p2, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    const-string v0, "Sign in to view following activity"

    const-string v1, "\u8acb\u767b\u5165\u4ee5\u67e5\u770b\u8ffd\u8e64\u52d5\u614b"

    const-string v2, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {p0, v2, v0, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void

    .line 168
    :cond_72
    iget-object v4, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    iget v3, p1, Le/e/a/FollowFeed$State;->filter:I

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    iput-boolean v2, p1, Le/e/a/FollowFeed$State;->busy:Z

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 169
    iget-object v1, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    const-string v2, "Loading\u2026"

    const-string v6, "\u8f09\u5165\u4e2d\u2026"

    const-string v7, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v7, v2, v6}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    sget-object v1, Le/e/a/FollowFeed;->WORKER:Ljava/util/concurrent/ExecutorService;

    new-instance v10, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;

    move-object v2, v10

    move-object v6, v0

    move v7, p2

    move-object v8, p1

    move-object v9, p0

    invoke-direct/range {v2 .. v9}, Le/e/a/FollowFeed$$ExternalSyntheticLambda3;-><init>(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v10}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 200
    return-void

    .line 163
    :cond_a4
    :goto_a4
    return-void
.end method

.method private static shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    .registers 5

    .line 56
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-static {p0, p2}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 57
    if-eqz p3, :cond_2a

    const/4 p1, 0x1

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result p1

    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {p2}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    const p2, 0xffffff

    and-int/2addr p0, p2

    const/high16 p2, 0x22000000

    or-int/2addr p0, p2

    invoke-virtual {v0, p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 58
    :cond_2a
    return-object v0
.end method

.method private static surface(Landroid/content/Context;)I
    .registers 5

    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "attr"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "nicoidSurface"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const v1, -0xcfcdc8

    goto :goto_1d

    :cond_1a
    const v1, -0xe0c0c

    :goto_1d
    invoke-static {p0, v0, v1}, Le/e/a/FollowFeed;->color(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 38
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 39
    const-string v0, "-1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 40
    :cond_1c
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    const-string v0, "en"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    goto :goto_3f

    :cond_2d
    const-string p2, "2"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3d

    const-string p2, "zh"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_40

    :cond_3d
    move-object p1, p3

    goto :goto_40

    :cond_3f
    :goto_3f
    move-object p1, p2

    :cond_40
    :goto_40
    return-object p1
.end method

.method private static updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 6

    .line 202
    iget-object v0, p1, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_b

    const/4 v1, 0x0

    goto :goto_d

    :cond_b
    const/16 v1, 0x8

    :goto_d
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 203
    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->end:Z

    if-eqz v1, :cond_1b

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez v1, :cond_1b

    goto :goto_1c

    :cond_1b
    const/4 v2, 0x0

    :goto_1c
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v1, :cond_2a

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-nez v1, :cond_2a

    const/4 v3, 0x1

    :cond_2a
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 204
    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-eqz p1, :cond_3a

    const-string p1, "Retry"

    const-string v1, "\u91cd\u8a66"

    const-string v2, "\u518d\u8a66\u884c"

    goto :goto_40

    :cond_3a
    const-string p1, "Load older activity"

    const-string v1, "\u8f09\u5165\u8f03\u65e9\u7684\u52d5\u614b"

    const-string v2, "\u904e\u53bb\u306e\u65b0\u7740\u3092\u8aad\u307f\u8fbc\u3080"

    :goto_40
    invoke-static {p0, v2, p1, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 205
    return-void
.end method
