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

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    .registers 3

    .line 54
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1(Landroid/content/Context;I)I
    .registers 2

    .line 40
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$10(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Item;Z)V
    .registers 4

    .line 297
    invoke-static {p0, p1, p2, p3}, Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Item;Z)V

    return-void
.end method

.method static synthetic access$11(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    .registers 3

    .line 180
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    return-void
.end method

.method static synthetic access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 219
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void
.end method

.method static synthetic access$13(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 230
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void
.end method

.method static synthetic access$14()Ljava/util/WeakHashMap;
    .registers 1

    .line 23
    sget-object v0, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 41
    invoke-static {p0, p1, p2, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Landroid/content/Context;I)Ljava/lang/String;
    .registers 2

    .line 226
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->period(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    .registers 2

    .line 267
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$5(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    .registers 4

    .line 59
    invoke-static {p0, p1, p2, p3}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$6(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 64
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 2

    .line 291
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->event(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 2

    .line 286
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->badge(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$9(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    .registers 2

    .line 281
    invoke-static {p0, p1}, Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    return-void
.end method

.method private static badge(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 4

    .line 287
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

    .line 288
    :cond_13
    iget-boolean v0, p1, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz v0, :cond_22

    const-string p1, "Short upload"

    const-string v0, "\u77ed\u5f71\u7247\u6295\u7a3f"

    const-string v1, "\u30b7\u30e7\u30fc\u30c8\u6295\u7a3f"

    invoke-static {p0, v1, p1, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_37

    .line 289
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

    .line 288
    :goto_37
    return-object p0
.end method

.method private static bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    .registers 5

    .line 282
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/view/View;

    const/4 v0, 0x0

    aget-object v1, p0, v0

    check-cast v1, Landroid/widget/ImageView;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    check-cast p0, Landroid/widget/TextView;

    .line 283
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_21

    return-void

    .line 284
    :cond_21
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-static {p1, v1, p0}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 285
    return-void
.end method

.method private static chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    .registers 7

    .line 65
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 66
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 67
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

    .line 68
    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setTextColor(I)V

    return-object v0
.end method

.method private static chooseActor(Landroid/app/Activity;Le/e/a/FollowFeed$State;Ljava/lang/String;)V
    .registers 10

    .line 240
    iget-object v0, p1, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    if-nez v0, :cond_6

    move-object v0, p1

    goto :goto_8

    :cond_6
    iget-object v0, p1, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    .line 241
    :goto_8
    iput-object p2, v0, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FollowFeedData$Actor;

    if-eqz v1, :cond_19

    iget-object v2, v0, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    :cond_19
    iget-object v2, v0, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    const/4 v3, 0x0

    if-eqz v2, :cond_3a

    iget-object v0, v0, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    array-length v2, v0

    move v4, v3

    :goto_22
    if-lt v4, v2, :cond_25

    goto :goto_3a

    :cond_25
    aget-object v5, v0, v4

    if-eqz v5, :cond_37

    iput-object p2, v5, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-eqz v1, :cond_32

    iget-object v6, v5, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, p2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_32
    const/4 v6, 0x0

    iput-object v6, v5, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    iput-object v6, v5, Le/e/a/FollowFeed$State;->scroll:Landroid/os/Parcelable;

    :cond_37
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 243
    :cond_3a
    :goto_3a
    iput-object p2, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p0, p1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {p0, v3}, Landroid/widget/ListView;->setSelection(I)V

    .line 244
    return-void
.end method

.method private static color(Landroid/content/Context;II)I
    .registers 6

    .line 47
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-nez p1, :cond_11

    return p2

    .line 49
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
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 161
    const-string v0, "E"

    invoke-static {p0, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/SessionCookies194;->cookie(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 2

    .line 40
    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static event(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 4

    .line 292
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

    .line 293
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

    .line 294
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

    .line 295
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

    .line 294
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

    .line 164
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

    .line 165
    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v0

    if-eqz v0, :cond_e7

    .line 167
    const/16 v0, 0x2710

    :try_start_22
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 168
    const-string v1, "X-Frontend-Id"

    const-string v2, "6"

    invoke-virtual {p0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "X-Frontend-Version"

    const-string v2, "0"

    invoke-virtual {p0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Cookie"

    invoke-virtual {p0, v1, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v1, 0x191

    const/4 v2, 0x0

    if-eq p1, v1, :cond_d9

    const/16 v1, 0x193

    if-eq p1, v1, :cond_d9

    const/16 v1, 0xc8

    if-ne p1, v1, :cond_c4

    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_55
    .catchall {:try_start_22 .. :try_end_55} :catchall_df

    .line 171
    :try_start_55
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v1, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_60
    .catchall {:try_start_55 .. :try_end_60} :catchall_ba

    .line 172
    const/16 v3, 0x1000

    :try_start_62
    new-array v3, v3, [C

    .line 173
    :goto_64
    invoke-virtual {v1, v3}, Ljava/io/Reader;->read([C)I

    move-result v4
    :try_end_68
    .catchall {:try_start_62 .. :try_end_68} :catchall_b4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_94

    .line 174
    :try_start_6b
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_6e
    .catchall {:try_start_6b .. :try_end_6e} :catchall_ba

    .line 175
    :try_start_6e
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 176
    const-string p1, "ok"

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_83
    .catchall {:try_start_6e .. :try_end_83} :catchall_df

    if-eqz p1, :cond_8c

    .line 177
    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    .line 176
    :cond_8c
    :try_start_8c
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Feed did not return ok"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_94
    .catchall {:try_start_8c .. :try_end_94} :catchall_df

    .line 173
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

    .line 174
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

    .line 169
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

    .line 177
    :catchall_df
    move-exception p1

    invoke-virtual {p2, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1

    .line 165
    :cond_e7
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method private static filterName(Landroid/content/Context;I)Ljava/lang/String;
    .registers 8

    .line 71
    const-string v0, "Content"

    const-string v1, "\u5167\u5bb9"

    const-string v2, "\u30b3\u30f3\u30c6\u30f3\u30c4"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "Videos"

    const-string v2, "\u5f71\u7247"

    const-string v3, "\u52d5\u753b"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Shorts"

    const-string v3, "\u77ed\u5f71\u7247"

    const-string v4, "\u30b7\u30e7\u30fc\u30c8"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "All"

    const-string v4, "\u5168\u90e8"

    const-string v5, "\u3059\u3079\u3066"

    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    filled-new-array {v0, v1, v2, v3}, [[Ljava/lang/String;

    move-result-object v0

    .line 72
    aget-object v1, v0, p1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    aget-object v2, v0, p1

    const/4 v3, 0x1

    aget-object v2, v2, v3

    aget-object p1, v0, p1

    const/4 v0, 0x2

    aget-object p1, p1, v0

    invoke-static {p0, v1, v2, p1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    .registers 8

    .line 268
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
    move v3, v2

    :goto_18
    invoke-static {p0, v1, v3, v2}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 269
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 270
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

    .line 271
    const/4 p0, 0x2

    new-array p0, p0, [Landroid/view/View;

    aput-object v1, p0, v2

    const/4 v1, 0x1

    aput-object v3, p0, v1

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 272
    if-eqz p1, :cond_6b

    invoke-static {v0}, Le/e/a/Following190;->roundAvatar(Landroid/view/View;)V

    :cond_6b
    return-object v0
.end method

.method private static label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    .registers 4

    .line 55
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    int-to-float p0, p1

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {v0}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    if-eqz p2, :cond_1c

    const-string p0, "sans-serif-medium"

    const/4 p1, 0x0

    invoke-static {p0, p1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 57
    :cond_1c
    return-object v0
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 96
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.sauzask.nicoid.NicoidFavUserActivity"

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Le/e/a/FollowFeed$State;I)V
    .registers 3

    .line 99
    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->select(Landroid/app/Activity;Le/e/a/FollowFeed$State;I)V

    return-void
.end method

.method static synthetic lambda$10(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V
    .registers 5

    .line 211
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_3e

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-ne v0, p0, :cond_3e

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_3e

    iget-boolean p0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-eqz p0, :cond_15

    goto :goto_3e

    :cond_15
    const/4 p0, 0x0

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->busy:Z

    const/4 p0, 0x1

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->failed:Z

    .line 212
    instance-of p0, p3, Le/e/a/FollowFeed$LoginRequired;

    if-eqz p0, :cond_2a

    const-string p0, "Please sign in again"

    const-string p3, "\u8acb\u91cd\u65b0\u767b\u5165"

    const-string v0, "\u30ed\u30b0\u30a4\u30f3\u3057\u76f4\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, v0, p0, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_34

    .line 213
    :cond_2a
    const-string p0, "Could not load. Refresh to retry"

    const-string p3, "\u7121\u6cd5\u53d6\u5f97\uff0c\u8acb\u91cd\u65b0\u6574\u7406\u4ee5\u91cd\u8a66"

    const-string v0, "\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u66f4\u65b0\u3057\u3066\u518d\u8a66\u884c\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, v0, p0, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 212
    :goto_34
    invoke-static {p1, p0}, Le/e/a/FollowFeed;->status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V

    .line 214
    invoke-static {p2, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void

    .line 211
    :cond_3e
    :goto_3e
    return-void
.end method

.method static synthetic lambda$11(Landroid/app/Activity;Le/e/a/FollowFeed$State;Landroid/view/View;)V
    .registers 3

    .line 252
    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->chooseActor(Landroid/app/Activity;Le/e/a/FollowFeed$State;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;Landroid/view/View;)V
    .registers 4

    .line 263
    invoke-virtual {p2}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Le/e/a/FollowFeed;->chooseActor(Landroid/app/Activity;Le/e/a/FollowFeed$State;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/FollowFeed$State;I)V
    .registers 2

    .line 100
    iget-object p0, p0, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    invoke-virtual {p0, p1}, Le/e/a/Ui110$Swipe;->select(I)V

    return-void
.end method

.method static synthetic lambda$3(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/view/View;)V
    .registers 3

    .line 107
    iget-object p0, p0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    iget-boolean p2, p0, Le/e/a/FollowFeed$State;->failed:Z

    if-eqz p2, :cond_10

    iget-object p2, p0, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_10

    const/4 p2, 0x1

    goto :goto_11

    :cond_10
    const/4 p2, 0x0

    :goto_11
    invoke-static {p1, p0, p2}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    return-void
.end method

.method static synthetic lambda$4(Le/e/a/FollowFeed$State;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7

    .line 112
    iget-object p0, p0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    iget-object p2, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p4, p2, :cond_20

    iget-object p2, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    instance-of p2, p2, Le/e/a/FollowFeedData$Item;

    if-eqz p2, :cond_20

    iget-object p2, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/FollowFeedData$Item;

    const/4 p3, 0x0

    invoke-static {p1, p0, p2, p3}, Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Item;Z)V

    .line 113
    :cond_20
    return-void
.end method

.method static synthetic lambda$5(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 3

    .line 120
    iget-object p0, p0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    iget-object p0, p0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    return-void
.end method

.method static synthetic lambda$6(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 158
    invoke-static {p0}, Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$7(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V
    .registers 15

    .line 190
    :try_start_0
    const-string v0, "publish"

    const-string v1, "video"

    const-string v2, "short_video"

    const-string v3, "all"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "activities/followings/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-object p0, v0, p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "?context=my_timeline&limit=50"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 192
    if-eqz p1, :cond_42

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "&cursor="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 193
    :cond_42
    invoke-static {p0, p2, p3}, Le/e/a/FollowFeed;->fetch(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Le/e/a/FollowFeedData;->parse(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v4

    .line 194
    const-string p1, "nextCursor"

    invoke-static {p0, p1}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 195
    const-string p1, "activities"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-eqz p0, :cond_60

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-eqz p0, :cond_60

    const/4 p0, 0x0

    goto :goto_61

    :cond_60
    const/4 p0, 0x1

    :goto_61
    move v7, p0

    .line 196
    nop

    .line 197
    if-eqz p4, :cond_78

    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p0
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_69} :catch_8a

    if-nez p0, :cond_78

    :try_start_6b
    const-string p0, "actors?limit=50"

    invoke-static {p0, p2, p3}, Le/e/a/FollowFeed;->fetch(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Le/e/a/FollowFeedData;->actors(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object p0
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_75} :catch_77

    move-object v5, p0

    goto :goto_7a

    :catch_77
    move-exception p0

    .line 198
    :cond_78
    const/4 p0, 0x0

    move-object v5, p0

    :goto_7a
    nop

    .line 199
    :try_start_7b
    sget-object p0, Le/e/a/FollowFeed;->MAIN:Landroid/os/Handler;

    new-instance p1, Le/e/a/FollowFeed$$ExternalSyntheticLambda23;

    move-object v0, p1

    move-object v1, p3

    move-object v2, p5

    move-object v3, p6

    invoke-direct/range {v0 .. v7}, Le/e/a/FollowFeed$$ExternalSyntheticLambda23;-><init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_89} :catch_8a

    .line 209
    goto :goto_a3

    :catch_8a
    move-exception p0

    .line 210
    invoke-virtual {p3}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_92

    return-void

    .line 211
    :cond_92
    sget-object p1, Le/e/a/FollowFeed;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/FollowFeed$$ExternalSyntheticLambda24;

    invoke-direct {p2, p3, p5, p6, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda24;-><init>(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/lang/Exception;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 215
    const-string p1, "nicoid-feed"

    const-string p2, "Feed request failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 217
    :goto_a3
    return-void
.end method

.method static synthetic lambda$8(Le/e/a/NetworkTask;Le/e/a/FollowFeed$State;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 9

    .line 200
    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_da

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-ne v0, p0, :cond_da

    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_da

    iget-boolean p0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-eqz p0, :cond_16

    goto/16 :goto_da

    .line 201
    :cond_16
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    :goto_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_c3

    .line 202
    iget-object p0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    new-instance p3, Le/e/a/FollowFeed$$ExternalSyntheticLambda25;

    invoke-direct {p3}, Le/e/a/FollowFeed$$ExternalSyntheticLambda25;-><init>()V

    invoke-static {p0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 203
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

    .line 204
    :cond_4c
    :goto_4c
    iget-object p0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_52
    :goto_52
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_97

    .line 205
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

    move p3, p0

    goto :goto_75

    :cond_74
    const/4 p3, 0x1

    :goto_75
    iput-boolean p3, p1, Le/e/a/FollowFeed$State;->end:Z

    iput-boolean p0, p1, Le/e/a/FollowFeed$State;->busy:Z

    .line 206
    invoke-static {p2, p1}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p2, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 207
    iget-object p0, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-nez p0, :cond_89

    const-string p0, ""

    goto :goto_93

    :cond_89
    const-string p0, "Filtered by creator"

    const-string p3, "\u4f9d\u6295\u7a3f\u8005\u7be9\u9078"

    const-string p4, "\u6295\u7a3f\u8005\u3067\u7d5e\u308a\u8fbc\u307f\u4e2d"

    invoke-static {p2, p4, p0, p3}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_93
    invoke-static {p1, p0}, Le/e/a/FollowFeed;->status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V

    .line 208
    return-void

    .line 204
    :cond_97
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

    .line 201
    :cond_c3
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

    .line 200
    :cond_da
    :goto_da
    return-void
.end method

.method static synthetic lambda$9(Le/e/a/FollowFeedData$Item;Le/e/a/FollowFeedData$Item;)I
    .registers 4

    .line 202
    iget-wide v0, p1, Le/e/a/FollowFeedData$Item;->time:J

    iget-wide p0, p0, Le/e/a/FollowFeedData$Item;->time:J

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method public static load(Landroid/app/Activity;)V
    .registers 14

    .line 76
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_my_page"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {p0}, Le/e/a/AccountPage;->load(Landroid/app/Activity;)V

    return-void

    .line 77
    :cond_11
    invoke-static {p0}, Le/e/a/CreatorPage;->open(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_18

    return-void

    .line 78
    :cond_18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "H"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 79
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "I"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 80
    sget-object v0, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FollowFeed$State;

    .line 81
    if-nez v0, :cond_297

    .line 82
    new-instance v0, Le/e/a/FollowFeed$State;

    const/4 v3, 0x0

    invoke-direct {v0, v3}, Le/e/a/FollowFeed$State;-><init>(Le/e/a/FollowFeed$State;)V

    const-string v4, "A"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    iput-object v4, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v4, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    if-nez v4, :cond_52

    return-void

    .line 83
    :cond_52
    const-string v4, "O"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_58} :catch_29d

    .line 84
    const-string v5, "Nico \u52d5\u614b"

    const-string v6, "Nico Reports"

    const-string v7, "\u30cb\u30b3\u30ec\u30dd"

    if-eqz v4, :cond_73

    :try_start_60
    const-string v8, "b"

    const-class v9, Ljava/lang/CharSequence;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-static {p0, v7, v6, v5}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v4, v8, v9, v10}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    :cond_73
    invoke-static {p0, v7, v6, v5}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 86
    if-eqz v4, :cond_8b

    const-string v5, "c"

    const-class v6, Ljava/lang/CharSequence;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_8b
    const-string v4, "Q"

    invoke-static {p0, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    if-eqz v4, :cond_9a

    iget-object v5, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v5, v4}, Landroid/widget/ListView;->removeFooterView(Landroid/view/View;)Z

    .line 88
    :cond_9a
    iget-object v4, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup;

    if-eqz v4, :cond_b1

    iget-object v4, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v5, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 89
    :cond_b1
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {v4}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {v4}, Le/e/a/TabViewport110;->fill(Landroid/view/View;)V

    .line 90
    iput-object v0, v0, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    iput-object v0, v0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    const/4 v5, 0x4

    new-array v6, v5, [Le/e/a/FollowFeed$State;

    iput-object v6, v0, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    iget-object v6, v0, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    aput-object v0, v6, v2

    .line 91
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v8, 0x8

    invoke-static {p0, v8}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-static {p0, v8}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-static {p0, v8}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {p0, v5}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v6, v9, v10, v8, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 92
    new-instance v8, Landroid/widget/HorizontalScrollView;

    invoke-direct {v8, p0}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v2}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 93
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v9, v0, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    iget-object v9, v0, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v9, v0, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v9}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 94
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, -0x2

    invoke-direct {v9, v2, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    const-string v8, "\u30d5\u30a9\u30ed\u30fc\u4e00\u89a7 \u203a"

    const-string v9, "Following \u203a"

    const-string v12, "\u8ffd\u8e64\u5217\u8868 \u203a"

    invoke-static {p0, v8, v9, v12}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    invoke-static {v8}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    const/high16 v9, 0x41500000    # 13.0f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setTextSize(F)V

    .line 96
    new-instance v9, Le/e/a/FollowFeed$$ExternalSyntheticLambda15;

    invoke-direct {v9, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda15;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v12, 0x30

    invoke-static {p0, v12}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v9, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 99
    new-instance v6, Le/e/a/Ui110$Swipe;

    new-instance v8, Le/e/a/FollowFeed$$ExternalSyntheticLambda16;

    invoke-direct {v8, p0, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda16;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-direct {v6, p0, v5, v8}, Le/e/a/Ui110$Swipe;-><init>(Landroid/content/Context;ILjava/util/function/IntConsumer;)V

    iput-object v6, v0, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    .line 100
    new-instance v5, Le/e/a/Ui110$Tabs;

    invoke-static {p0, v2}, Le/e/a/FollowFeed;->filterName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v1}, Le/e/a/FollowFeed;->filterName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->filterName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    invoke-static {p0, v12}, Le/e/a/FollowFeed;->filterName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v12

    filled-new-array {v6, v8, v9, v12}, [Ljava/lang/String;

    move-result-object v6

    new-instance v8, Le/e/a/FollowFeed$$ExternalSyntheticLambda17;

    invoke-direct {v8, v0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda17;-><init>(Le/e/a/FollowFeed$State;)V

    invoke-direct {v5, p0, v6, v8}, Le/e/a/Ui110$Tabs;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/util/function/IntConsumer;)V

    iput-object v5, v0, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    iget-object v5, v0, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0, v7}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v7}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v5, v6, v2, v7, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 102
    const/16 v6, 0xc

    invoke-static {p0, v6, v2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, v0, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object v7, v0, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    const v8, 0x3f333333    # 0.7f

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v7, v0, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v2, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    new-instance v7, Landroid/widget/ProgressBar;

    invoke-direct {v7, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iget-object v7, v0, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v7}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v8

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v7, v8, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 104
    iget-object v7, v0, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x14

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x1c

    invoke-static {p0, v8}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v8

    const/4 v9, -0x1

    invoke-direct {v7, v9, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v7, 0x11

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v11, 0x18

    invoke-static {p0, v11}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v5, v7, v8, v6, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 106
    const-string v6, "\u904e\u53bb\u306e\u65b0\u7740\u3092\u8aad\u307f\u8fbc\u3080"

    const-string v7, "Load older activity"

    const-string v8, "\u8f09\u5165\u8f03\u65e9\u7684\u52d5\u614b"

    invoke-static {p0, v6, v7, v8}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v6

    iput-object v6, v0, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    .line 107
    iget-object v6, v0, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    new-instance v7, Le/e/a/FollowFeed$$ExternalSyntheticLambda18;

    invoke-direct {v7, v0, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda18;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v6, v0, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 108
    iget-object v6, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v6, v5, v3, v2}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance v5, Le/e/a/FollowFeed$Rows;

    invoke-direct {v5, p0, v0}, Le/e/a/FollowFeed$Rows;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iput-object v5, v0, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    iget-object v5, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v6, v0, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 109
    iget-object v5, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v5, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v3, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v2}, Landroid/widget/ListView;->setCacheColorHint(I)V

    iget-object v3, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-static {v3}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 111
    iget-object v3, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v5, Le/e/a/FollowFeed$$ExternalSyntheticLambda19;

    invoke-direct {v5, v0, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda19;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 114
    iget-object v3, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v5, Le/e/a/FollowFeed$1;

    invoke-direct {v5, v0, p0}, Le/e/a/FollowFeed$1;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 120
    iget-object v3, v0, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    iget-object v5, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v9, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v6}, Le/e/a/Ui110$Swipe;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/FeedRefresh209;

    iget-object v5, v0, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    new-instance v6, Le/e/a/FollowFeed$$ExternalSyntheticLambda20;

    invoke-direct {v6, v0, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda20;-><init>(Le/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-direct {v3, p0, v5, v6}, Le/e/a/FeedRefresh209;-><init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V

    iput-object v3, v0, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    iget-object v3, v0, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v9, v2, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v2, Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    invoke-static {p0, v0}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, v0}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 123
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    new-instance v3, Le/e/a/FollowFeed$2;

    invoke-direct {v3, p0, v0}, Le/e/a/FollowFeed$2;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-virtual {v2, v3}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 133
    :cond_297
    iget-object v0, v0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    invoke-static {p0, v0, v1}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    :try_end_29c
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_29c} :catch_29d

    .line 134
    goto :goto_2a5

    :catch_29d
    move-exception p0

    const-string v0, "nicoid-feed"

    const-string v1, "Feed view failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 135
    :goto_2a5
    return-void
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)Z
    .registers 6

    .line 157
    invoke-static {p0, p1}, Le/e/a/Ranking190;->managerMenu(Landroid/app/Activity;Landroid/view/Menu;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 158
    :cond_8
    invoke-interface {p1}, Landroid/view/Menu;->clear()V

    const-string v0, "Refresh"

    const-string v2, "\u91cd\u65b0\u6574\u7406"

    const-string v3, "\u66f4\u65b0"

    invoke-static {p0, v3, v0, v2}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    new-instance v0, Le/e/a/FollowFeed$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0}, Le/e/a/FollowFeed$$ExternalSyntheticLambda13;-><init>(Landroid/app/Activity;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    return v1
.end method

.method private static open(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Item;Z)V
    .registers 12

    .line 298
    if-nez p3, :cond_75

    iget-boolean v0, p2, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz v0, :cond_75

    .line 299
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 302
    iget-object v3, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, -0x1

    :cond_1c
    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_44

    .line 306
    if-ltz v4, :cond_75

    const/4 p1, 0x0

    new-array v3, p1, [Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    new-array v3, p1, [Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-static {p0, v0, v1, p1, v4}, Le/e/a/ModernShorts;->openVideos(Landroid/app/Activity;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_75

    return-void

    .line 302
    :cond_44
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/FollowFeedData$Item;

    const/4 v6, 0x3

    iget-object v7, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Le/e/a/FollowFeedData$Item;->matches(ILjava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1c

    iget-boolean v6, v5, Le/e/a/FollowFeedData$Item;->shortVideo:Z

    if-eqz v6, :cond_1c

    .line 303
    iget-object v6, v5, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    iget-object v7, p2, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_65

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 304
    :cond_65
    iget-object v6, v5, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, v5, Le/e/a/FollowFeedData$Item;->title:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, v5, Le/e/a/FollowFeedData$Item;->thumbnail:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 308
    :cond_75
    new-instance p1, Landroid/content/Intent;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p2, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 309
    if-eqz p3, :cond_96

    const-string p2, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    goto :goto_98

    :cond_96
    const-string p2, "com.sauzask.nicoid.NicoidVideoActivity"

    :goto_98
    invoke-virtual {p1, p0, p2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 308
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 310
    return-void
.end method

.method private static period(Landroid/content/Context;I)Ljava/lang/String;
    .registers 11

    .line 227
    const-string v0, "Today"

    const-string v1, "\u4eca\u5929"

    const-string v2, "\u4eca\u65e5"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v3

    const-string v0, "Yesterday"

    const-string v1, "\u6628\u5929"

    const-string v2, "\u6628\u65e5"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v0, "Past week"

    const-string v1, "\u4e00\u9031\u5167"

    const-string v2, "1\u9031\u9593"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    const-string v0, "Past month"

    const-string v1, "\u4e00\u500b\u6708\u5167"

    const-string v2, "1\u304b\u6708"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const-string v0, "Older than a month"

    const-string v1, "\u4e00\u500b\u6708\u4ee5\u524d"

    const-string v2, "1\u304b\u6708\u4ee5\u4e0a\u524d"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v7

    const-string v0, "Date unavailable"

    const-string v1, "\u65e5\u671f\u4e0d\u660e"

    const-string v2, "\u65e5\u4ed8\u4e0d\u660e"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v8

    filled-new-array/range {v3 .. v8}, [[Ljava/lang/String;

    move-result-object v0

    .line 228
    aget-object v1, v0, p1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    aget-object v2, v0, p1

    const/4 v3, 0x1

    aget-object v2, v2, v3

    aget-object p1, v0, p1

    const/4 v0, 0x2

    aget-object p1, p1, v0

    invoke-static {p0, v1, v2, p1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 9

    .line 231
    invoke-virtual {p1}, Le/e/a/FollowFeed$State;->active()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 232
    :cond_7
    iget-object v0, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 233
    iget-object v0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, -0x1

    :cond_13
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_46

    .line 236
    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v0, :cond_35

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez v0, :cond_35

    iget-object v0, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-nez v0, :cond_28

    const-string p0, ""

    goto :goto_32

    :cond_28
    const-string v0, "Filtered by creator"

    const-string v1, "\u4f9d\u6295\u7a3f\u8005\u7be9\u9078"

    const-string v2, "\u6295\u7a3f\u8005\u3067\u7d5e\u308a\u8fbc\u307f\u4e2d"

    invoke-static {p0, v2, v0, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :goto_32
    invoke-static {p1, p0}, Le/e/a/FollowFeed;->status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V

    .line 237
    :cond_35
    iget-object p0, p1, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    if-eqz p0, :cond_40

    iget-object p0, p1, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    iget v0, p1, Le/e/a/FollowFeed$State;->filter:I

    invoke-virtual {p0, v0}, Le/e/a/Ui110$Tabs;->select(I)V

    :cond_40
    iget-object p0, p1, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    invoke-virtual {p0}, Le/e/a/FollowFeed$Rows;->notifyDataSetChanged()V

    .line 238
    return-void

    .line 233
    :cond_46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FollowFeedData$Item;

    const/4 v3, 0x3

    iget-object v4, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Le/e/a/FollowFeedData$Item;->matches(ILjava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 234
    iget-wide v3, v2, Le/e/a/FollowFeedData$Item;->time:J

    iget-wide v5, p1, Le/e/a/FollowFeed$State;->now:J

    invoke-static {v3, v4, v5, v6}, Le/e/a/FollowFeedData;->bucket(JJ)I

    move-result v3

    if-eq v3, v1, :cond_69

    iget-object v1, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v1, v3

    :cond_69
    iget-object v3, p1, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13
.end method

.method private static renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 15

    .line 246
    invoke-virtual {p1}, Le/e/a/FollowFeed$State;->active()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 247
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 248
    iget-object v1, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/16 v5, 0x32

    if-nez v4, :cond_27

    :goto_26
    goto :goto_32

    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FollowFeedData$Actor;

    add-int/lit8 v6, v3, 0x1

    if-lt v3, v5, :cond_12a

    goto :goto_26

    .line 249
    :goto_32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    return-void

    :cond_3f
    iput-object v0, p1, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    .line 250
    iget-object v0, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 251
    const-string v0, "All"

    const-string v1, "\u5168\u90e8"

    const-string v3, "\u3059\u3079\u3066"

    invoke-static {p0, v3, v0, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    const/4 v3, 0x1

    if-nez v1, :cond_5b

    move v1, v3

    goto :goto_5c

    :cond_5b
    move v1, v2

    :goto_5c
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setSelected(Z)V

    .line 252
    new-instance v1, Le/e/a/FollowFeed$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0, p1}, Le/e/a/FollowFeed$$ExternalSyntheticLambda21;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 253
    iget-object v1, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x28

    invoke-static {p0, v6}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, -0x2

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    nop

    .line 255
    iget-object v0, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v0, v2

    :goto_84
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_8b

    goto :goto_95

    :cond_8b
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FollowFeedData$Actor;

    .line 256
    add-int/lit8 v4, v0, 0x1

    if-lt v0, v5, :cond_96

    .line 266
    :goto_95
    return-void

    .line 257
    :cond_96
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v6, 0x11

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 258
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

    .line 259
    invoke-virtual {v1}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d0

    invoke-static {p0}, Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I

    move-result v9

    const/16 v10, 0xc

    invoke-static {p0, v9, v10, v3}, Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 260
    :cond_d0
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

    .line 261
    const/16 v10, 0xb

    invoke-static {p0, v10, v2}, Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v10

    iget-object v11, v1, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v11, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 262
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v11, -0x1

    invoke-direct {v6, v11, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v10, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    invoke-static {v9, v6}, Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    .line 263
    iget-object v6, v1, Le/e/a/FollowFeedData$Actor;->name:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v6, Le/e/a/FollowFeed$$ExternalSyntheticLambda22;

    invoke-direct {v6, p0, p1, v1}, Le/e/a/FollowFeed$$ExternalSyntheticLambda22;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;Le/e/a/FollowFeedData$Actor;)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 264
    iget-object v1, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v9, 0x48

    invoke-static {p0, v9}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move v0, v4

    goto/16 :goto_84

    .line 248
    :cond_12a
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

    goto/16 :goto_1e
.end method

.method private static request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    .registers 14

    .line 181
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_a2

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_a2

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-nez v0, :cond_a2

    if-nez p2, :cond_1e

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v0, :cond_a2

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->end:Z

    if-eqz v0, :cond_1e

    goto/16 :goto_a2

    .line 182
    :cond_1e
    iput-boolean v1, p1, Le/e/a/FollowFeed$State;->initialized:Z

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz v0, :cond_29

    iget-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    :cond_29
    iput-boolean v2, p1, Le/e/a/FollowFeed$State;->failed:Z

    .line 183
    if-eqz p2, :cond_4a

    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    iput-boolean v2, p1, Le/e/a/FollowFeed$State;->end:Z

    iget-object v0, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p1, Le/e/a/FollowFeed$State;->ids:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    iget-object v0, p1, Le/e/a/FollowFeed$State;->cursors:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p1, Le/e/a/FollowFeed$State;->now:J

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 184
    :cond_4a
    :try_start_4a
    invoke-static {p0}, Le/e/a/FollowFeed;->cookie(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4e} :catch_50

    :goto_4e
    move-object v6, v0

    goto :goto_54

    :catch_50
    move-exception v0

    const-string v0, ""

    goto :goto_4e

    .line 185
    :goto_54
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_72

    iput-boolean v2, p1, Le/e/a/FollowFeed$State;->busy:Z

    iput-boolean v1, p1, Le/e/a/FollowFeed$State;->failed:Z

    const-string p2, "Sign in to view following activity"

    const-string v0, "\u8acb\u767b\u5165\u4ee5\u67e5\u770b\u8ffd\u8e64\u52d5\u614b"

    const-string v1, "\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    invoke-static {p0, v1, p2, v0}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Le/e/a/FollowFeed;->status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    return-void

    .line 186
    :cond_72
    iget-object v5, p1, Le/e/a/FollowFeed$State;->cursor:Ljava/lang/String;

    iget v4, p1, Le/e/a/FollowFeed$State;->filter:I

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    iput-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 187
    const-string v1, "Loading\u2026"

    const-string v2, "\u8f09\u5165\u4e2d\u2026"

    const-string v3, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {p0, v3, v1, v2}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Le/e/a/FollowFeed;->status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V

    .line 188
    sget-object v1, Le/e/a/FollowFeed;->WORKER:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/FollowFeed$$ExternalSyntheticLambda14;

    move-object v3, v2

    move-object v7, v0

    move v8, p2

    move-object v9, p1

    move-object v10, p0

    invoke-direct/range {v3 .. v10}, Le/e/a/FollowFeed$$ExternalSyntheticLambda14;-><init>(ILjava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;ZLe/e/a/FollowFeed$State;Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 218
    return-void

    .line 181
    :cond_a2
    :goto_a2
    if-eqz p2, :cond_b7

    iget-object p0, p1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    if-eqz p0, :cond_b7

    iget-object p0, p1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    iget-boolean p2, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-eqz p2, :cond_b3

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-nez p1, :cond_b3

    goto :goto_b4

    :cond_b3
    move v1, v2

    :goto_b4
    invoke-virtual {p0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    :cond_b7
    return-void
.end method

.method private static select(Landroid/app/Activity;Le/e/a/FollowFeed$State;I)V
    .registers 10

    .line 137
    iget-object v0, p1, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    .line 138
    iget v1, v0, Le/e/a/FollowFeed$State;->filter:I

    if-ne v1, p2, :cond_7

    return-void

    .line 139
    :cond_7
    iget-object v1, v0, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    iput-object v1, v0, Le/e/a/FollowFeed$State;->scroll:Landroid/os/Parcelable;

    .line 140
    iget-object v1, p1, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    aget-object v1, v1, p2

    .line 141
    const/4 v2, 0x0

    if-nez v1, :cond_4e

    .line 142
    new-instance v1, Le/e/a/FollowFeed$State;

    invoke-direct {v1, v2}, Le/e/a/FollowFeed$State;-><init>(Le/e/a/FollowFeed$State;)V

    iput p2, v1, Le/e/a/FollowFeed$State;->filter:I

    iput-object p1, v1, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    iget-boolean v0, v0, Le/e/a/FollowFeed$State;->stopped:Z

    iput-boolean v0, v1, Le/e/a/FollowFeed$State;->stopped:Z

    .line 143
    iget-object v0, p1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    .line 144
    iget-object v0, p1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->swipe:Le/e/a/Ui110$Swipe;

    iget-object v0, p1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    iput-object v0, v1, Le/e/a/FollowFeed$State;->authors:Landroid/widget/LinearLayout;

    new-instance v0, Le/e/a/FollowFeed$Rows;

    invoke-direct {v0, p0, v1}, Le/e/a/FollowFeed$Rows;-><init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iput-object v0, v1, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    .line 145
    iget-object v0, p1, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    aput-object v1, v0, p2

    .line 147
    :cond_4e
    iget-object v0, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    iget-object v3, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-static {v0, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 148
    iget-object v3, p1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    iput-object v3, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    iget-object v3, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    if-eqz v3, :cond_79

    iget-object v3, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    iget-object v4, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_79

    iget-object v3, v1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    iget-object v4, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    iget-object v5, p1, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    iget-object v6, v1, Le/e/a/FollowFeed$State;->actorKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/FollowFeedData$Actor;

    invoke-virtual {v3, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_79
    if-nez v0, :cond_7d

    iput-object v2, v1, Le/e/a/FollowFeed$State;->scroll:Landroid/os/Parcelable;

    .line 149
    :cond_7d
    iput-object v1, p1, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    const/4 p1, 0x0

    iput-boolean p1, v1, Le/e/a/FollowFeed$State;->autoLoad:Z

    iput-object v2, v1, Le/e/a/FollowFeed$State;->authorStamp:Ljava/lang/String;

    .line 150
    iget-object v0, v1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object v2, v1, Le/e/a/FollowFeed$State;->rows:Le/e/a/FollowFeed$Rows;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, v1, Le/e/a/FollowFeed$State;->tabs:Le/e/a/Ui110$Tabs;

    invoke-virtual {v0, p2}, Le/e/a/Ui110$Tabs;->select(I)V

    iget-object p2, v1, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    iget-object v0, v1, Le/e/a/FollowFeed$State;->message:Ljava/lang/CharSequence;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    invoke-static {p0, v1}, Le/e/a/FollowFeed;->renderAuthors(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, v1}, Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    invoke-static {p0, v1}, Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    .line 152
    iget-object p2, v1, Le/e/a/FollowFeed$State;->scroll:Landroid/os/Parcelable;

    if-eqz p2, :cond_ac

    iget-object p1, v1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    iget-object p2, v1, Le/e/a/FollowFeed$State;->scroll:Landroid/os/Parcelable;

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_b1

    :cond_ac
    iget-object p2, v1, Le/e/a/FollowFeed$State;->list:Landroid/widget/ListView;

    invoke-virtual {p2, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 153
    :goto_b1
    iget-boolean p1, v1, Le/e/a/FollowFeed$State;->initialized:Z

    if-nez p1, :cond_b9

    const/4 p1, 0x1

    invoke-static {p0, v1, p1}, Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    .line 154
    :cond_b9
    return-void
.end method

.method private static shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    .registers 5

    .line 60
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-static {p0, p2}, Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 61
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

    .line 62
    :cond_2a
    return-object v0
.end method

.method private static status(Le/e/a/FollowFeed$State;Ljava/lang/CharSequence;)V
    .registers 3

    .line 155
    iput-object p1, p0, Le/e/a/FollowFeed$State;->message:Ljava/lang/CharSequence;

    invoke-virtual {p0}, Le/e/a/FollowFeed$State;->active()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object p0, p0, Le/e/a/FollowFeed$State;->status:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method private static surface(Landroid/content/Context;)I
    .registers 5

    .line 52
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

    .line 42
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "0"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 43
    const-string v0, "-1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 44
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

    .line 220
    invoke-virtual {p1}, Le/e/a/FollowFeed$State;->active()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 221
    :cond_7
    iget-object v0, p1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    if-eqz v0, :cond_12

    iget-object v0, p1, Le/e/a/FollowFeed$State;->refresh:Le/e/a/FeedRefresh209;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    invoke-virtual {v0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    .line 222
    :cond_12
    iget-object v0, p1, Le/e/a/FollowFeed$State;->progress:Landroid/widget/ProgressBar;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_1d

    move v1, v3

    goto :goto_1e

    :cond_1d
    move v1, v2

    :goto_1e
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 223
    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->end:Z

    if-eqz v1, :cond_2c

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez v1, :cond_2c

    goto :goto_2d

    :cond_2c
    move v2, v3

    :goto_2d
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v1, :cond_3b

    iget-boolean v1, p1, Le/e/a/FollowFeed$State;->stopped:Z

    if-nez v1, :cond_3b

    const/4 v3, 0x1

    :cond_3b
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 224
    iget-object v0, p1, Le/e/a/FollowFeed$State;->more:Landroid/widget/Button;

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-eqz p1, :cond_4b

    const-string p1, "Retry"

    const-string v1, "\u91cd\u8a66"

    const-string v2, "\u518d\u8a66\u884c"

    goto :goto_51

    :cond_4b
    const-string p1, "Load older activity"

    const-string v1, "\u8f09\u5165\u8f03\u65e9\u7684\u52d5\u614b"

    const-string v2, "\u904e\u53bb\u306e\u65b0\u7740\u3092\u8aad\u307f\u8fbc\u3080"

    :goto_51
    invoke-static {p0, v2, p1, v1}, Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 225
    return-void
.end method
