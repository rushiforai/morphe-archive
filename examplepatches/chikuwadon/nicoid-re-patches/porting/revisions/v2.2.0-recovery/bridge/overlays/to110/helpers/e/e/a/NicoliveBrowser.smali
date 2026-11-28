.class Le/e/a/NicoliveBrowser;
.super Ljava/lang/Object;
.source "NicoliveBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveBrowser$Feed;,
        Le/e/a/NicoliveBrowser$Result;
    }
.end annotation


# static fields
.field private static final RESERVATION_API:Ljava/lang/String; = "https://live2.nicovideo.jp/api/v2/"

.field static final images:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private volatile appContext:Landroid/content/Context;

.field volatile closed:Z

.field volatile feedConnection:Ljava/net/HttpURLConnection;

.field final feeds:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/NicoliveBrowser$Feed;",
            ">;"
        }
    .end annotation
.end field

.field volatile generation:I

.field volatile imageGeneration:I

.field final imageWork:Ljava/util/concurrent/ExecutorService;

.field volatile imagesPaused:Z

.field loading:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field final main:Landroid/os/Handler;

.field final missingHistory:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final pending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;>;>;"
        }
    .end annotation
.end field

.field final requests:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/net/HttpURLConnection;",
            ">;"
        }
    .end annotation
.end field

.field final reservationWork:Ljava/util/concurrent/ExecutorService;

.field final work:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    new-instance v0, Le/e/a/NicoliveBrowser$1;

    const/high16 v1, 0x800000

    invoke-direct {v0, v1}, Le/e/a/NicoliveBrowser$1;-><init>(I)V

    sput-object v0, Le/e/a/NicoliveBrowser;->images:Landroid/util/LruCache;

    return-void
.end method

.method constructor <init>()V
    .registers 10

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;

    invoke-direct {v7}, Ljava/util/concurrent/ThreadPoolExecutor$DiscardOldestPolicy;-><init>()V

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->work:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v0, 0x20

    invoke-direct {v7, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor$AbortPolicy;

    invoke-direct {v8}, Ljava/util/concurrent/ThreadPoolExecutor$AbortPolicy;-><init>()V

    const/4 v2, 0x2

    const/4 v3, 0x2

    const-wide/16 v4, 0x0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    iput-object v1, p0, Le/e/a/NicoliveBrowser;->imageWork:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    .line 7
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v0, 0x8

    invoke-direct {v7, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor$AbortPolicy;

    invoke-direct {v8}, Ljava/util/concurrent/ThreadPoolExecutor$AbortPolicy;-><init>()V

    const/4 v2, 0x1

    const/4 v3, 0x1

    .line 7
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    iput-object v1, p0, Le/e/a/NicoliveBrowser;->reservationWork:Ljava/util/concurrent/ExecutorService;

    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    return-void
.end method

.method static cookie(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    .line 18
    :try_start_0
    invoke-static {p0, v0}, Le/e/a/SessionCookies194;->cookie(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, ""

    return-object p0
.end method

.method private decodeImage(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 74
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 75
    const-string v1, ""

    const/high16 v2, 0x200000

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v1, v2, v3}, Le/e/a/NicoliveBrowser;->bytes(Ljava/lang/String;Ljava/lang/String;IZ)[B

    move-result-object p0

    .line 76
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 77
    iput-boolean v1, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 78
    array-length v2, p0

    invoke-static {p0, v3, v2, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 79
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v2, :cond_1

    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v2, :cond_1

    .line 80
    iput v1, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 81
    :goto_0
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v0, v2

    const/16 v2, 0x180

    if-gt v0, v2, :cond_0

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v0, v2

    const/16 v2, 0xd8

    if-gt v0, v2, :cond_0

    .line 82
    iput-boolean v3, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 83
    array-length v0, p0

    invoke-static {p0, v3, v0, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    .line 81
    :cond_0
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    shl-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private image(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 14

    .line 86
    invoke-virtual {p4, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    sget-object v1, Le/e/a/NicoliveBrowser;->images:Landroid/util/LruCache;

    invoke-virtual {v1, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {p4, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :cond_1
    invoke-virtual {p4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-nez v0, :cond_5

    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_5

    .line 87
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    .line 88
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-nez p0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/16 p1, 0x10

    if-ge p0, p1, :cond_5

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p4, :cond_2

    goto :goto_1

    .line 89
    :cond_4
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 90
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p4, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {p4, p1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget v6, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    .line 92
    :try_start_0
    iget-object p4, p0, Le/e/a/NicoliveBrowser;->imageWork:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/NicoliveBrowser$0;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, p0

    move-object v4, p1

    move-object v8, p2

    move-object v7, p3

    :try_start_1
    invoke-direct/range {v2 .. v8}, Le/e/a/NicoliveBrowser$0;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move-object v3, p0

    move-object v4, p1

    .line 124
    :catch_1
    iget-object p0, v3, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {p0, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    :goto_1
    return-void
.end method

.method static synthetic lambda$0(Ljava/net/HttpURLConnection;)V
    .registers 1

    .line 20
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void
.end method

.method static synthetic lambda$10(Ljava/util/ArrayList;)V
    .registers 2

    .line 126
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0
.end method

.method private mutateReservation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 12

    .line 36
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "lv[0-9]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    .line 38
    :try_start_0
    iget-object p1, p0, Le/e/a/NicoliveBrowser;->reservationWork:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/NicoliveBrowser$4;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, p0

    move-object v4, p2

    move-object v3, p3

    move-object v2, p4

    move-object v5, p5

    :try_start_1
    invoke-direct/range {v0 .. v5}, Le/e/a/NicoliveBrowser$4;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move-object v5, p5

    .line 55
    :catch_1
    invoke-interface {v5}, Le/e/a/NicoliveBrowser$Result;->error()V

    return-void

    :cond_0
    move-object v5, p5

    .line 36
    invoke-interface {v5}, Le/e/a/NicoliveBrowser$Result;->error()V

    return-void
.end method


# virtual methods
.method bytes(Ljava/lang/String;Ljava/lang/String;IZ)[B
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_1a

    .line 59
    iget-boolean v2, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v2, :cond_19

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_19

    if-nez p4, :cond_0

    iget-boolean v2, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-nez v2, :cond_19

    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    const-string v4, "https"

    invoke-virtual {v2}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    if-eqz v3, :cond_18

    const-string v4, "nicovideo.jp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, ".nicovideo.jp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "nimg.jp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, ".nimg.jp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 60
    :cond_1
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v4, p2}, Lnicoid/network238/ReadOnlyConnection239;->openLiveBrowser(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iget-object v4, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    monitor-enter v4

    :try_start_1
    iget-boolean v5, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v5, :cond_17

    if-nez p4, :cond_2

    iget-boolean v5, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-nez v5, :cond_17

    :cond_2
    iget-object v5, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    if-eqz p4, :cond_3

    iput-object p1, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    :cond_3
    const/4 v4, 0x0

    :try_start_2
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    if-eqz p4, :cond_4

    const/16 v5, 0x3a98

    goto :goto_1

    :cond_4
    const/16 v5, 0x1f40

    :goto_1
    invoke-virtual {p1, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    if-eqz p4, :cond_5

    const/16 v5, 0x4e20

    goto :goto_2

    :cond_5
    const/16 v5, 0x2710

    :goto_2
    invoke-virtual {p1, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v5, "User-Agent"

    const-string v6, "Mozilla/5.0"

    invoke-virtual {p1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "Accept-Encoding"

    const-string v6, "gzip"

    invoke-virtual {p1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "live.nicovideo.jp"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, "live2.nicovideo.jp"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    :cond_6
    if-eqz p2, :cond_7

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "Cookie"

    invoke-virtual {p1, v3, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v5, 0x12c

    if-lt v3, v5, :cond_a

    const/16 v5, 0x190

    if-ge v3, v5, :cond_a

    const-string v3, "Location"

    invoke-virtual {p1, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    invoke-virtual {v2, v3}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    iget-object v3, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v3, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    if-ne v3, p1, :cond_8

    iput-object v4, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    :cond_8
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    add-int/lit8 v1, v1, 0x1

    move-object p1, v2

    goto/16 :goto_0

    :cond_9
    :try_start_3
    new-instance p2, Ljava/io/IOException;

    const-string p3, "REDIRECT"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    :cond_a
    const/16 p2, 0xc8

    if-ne v3, p2, :cond_15

    :try_start_4
    const-string p2, "gzip"

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_b

    new-instance p2, Ljava/util/zip/GZIPInputStream;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_3

    :cond_b
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :goto_3
    :try_start_5
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x2000

    new-array v2, v2, [B

    :goto_4
    invoke-virtual {p2, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v5, -0x1

    if-ne v3, v5, :cond_e

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz p2, :cond_c

    :try_start_6
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :cond_c
    iget-object p2, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p2, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    if-ne p2, p1, :cond_d

    iput-object v4, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    :cond_d
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p3

    :cond_e
    :try_start_7
    iget-boolean v5, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v5, :cond_11

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v5

    if-nez v5, :cond_11

    if-nez p4, :cond_f

    iget-boolean v5, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-nez v5, :cond_11

    :cond_f
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v3

    if-gt v5, p3, :cond_10

    invoke-virtual {v1, v2, v0, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_4

    :cond_10
    new-instance p3, Ljava/io/IOException;

    const-string p4, "TOO_LARGE"

    invoke-direct {p3, p4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p3

    :cond_11
    new-instance p3, Ljava/io/IOException;

    const-string p4, "CANCELLED"

    invoke-direct {p3, p4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :catchall_0
    move-exception p3

    if-eqz p2, :cond_12

    :try_start_8
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_12
    throw p3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p2

    goto :goto_5

    :catchall_2
    move-exception p2

    move-object p3, v4

    :goto_5
    if-eqz p3, :cond_14

    if-eq p3, p2, :cond_13

    :try_start_9
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_13
    move-object p2, p3

    :cond_14
    throw p2

    :cond_15
    new-instance p2, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "HTTP_"

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :catchall_3
    move-exception p2

    iget-object p3, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    invoke-interface {p3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p3, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    if-ne p3, p1, :cond_16

    iput-object v4, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    :cond_16
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p2

    :cond_17
    :try_start_a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "CANCELLED"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_6
    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw p0

    :catchall_4
    move-exception p0

    goto :goto_6

    .line 59
    :cond_18
    new-instance p0, Ljava/io/IOException;

    const-string p1, "INVALID_HOST"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "INVALID_URI"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_19
    new-instance p0, Ljava/io/IOException;

    const-string p1, "CANCELLED"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 61
    :cond_1a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "REDIRECT_LIMIT"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method cancelReservation(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 12

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "timeshift/reservations?programIds="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v5, "DELETE"

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Le/e/a/NicoliveBrowser;->mutateReservation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method close()V
    .registers 4

    .line 129
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicoliveBrowser;->appContext:Landroid/content/Context;

    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/NicoliveBrowser;->closed:Z

    iget v2, p0, Le/e/a/NicoliveBrowser;->generation:I

    add-int/2addr v2, v1

    iput v2, p0, Le/e/a/NicoliveBrowser;->generation:I

    iget v2, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    add-int/2addr v2, v1

    iput v2, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    iget-object v1, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    iget-object v1, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v1, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-virtual {p0}, Le/e/a/NicoliveBrowser;->disconnectRequests()V

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->work:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->imageWork:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    iget-object p0, p0, Le/e/a/NicoliveBrowser;->reservationWork:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method

.method disconnectRequests()V
    .registers 3

    .line 126
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object p0, p0, Le/e/a/NicoliveBrowser;->requests:Ljava/util/Set;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Le/e/a/NicoliveBrowser$3;

    invoke-direct {p0, v1}, Le/e/a/NicoliveBrowser$3;-><init>(Ljava/util/ArrayList;)V

    invoke-static {p0}, Le/e/a/NicoliveIo;->execute(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method historyImage(Le/e/a/NicoliveData$Program;Landroid/widget/ImageView;)V
    .registers 8

    .line 65
    iget-boolean v0, p1, Le/e/a/NicoliveData$Program;->programThumbnail:Z

    if-eqz v0, :cond_0

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Le/e/a/NicoliveBrowser;->image(Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void

    .line 66
    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 67
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/32 v3, 0x2bf20

    cmp-long v0, v1, v3

    if-gez v0, :cond_1

    .line 68
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Le/e/a/NicoliveBrowser;->image(Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void

    .line 71
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "history:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1, p2}, Le/e/a/NicoliveBrowser;->image(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void
.end method

.method image(Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 4

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, p1, v0, p2}, Le/e/a/NicoliveBrowser;->image(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-NicoliveBrowser(ILe/e/a/NicoliveBrowser$Result;Le/e/a/NicoliveBrowser$Feed;)V
    .registers 5

    .line 22
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_0

    iget p0, p0, Le/e/a/NicoliveBrowser;->generation:I

    if-ne p1, p0, :cond_0

    iget-object p0, p3, Le/e/a/NicoliveBrowser$Feed;->html:Ljava/lang/String;

    invoke-interface {p2, p0}, Le/e/a/NicoliveBrowser$Result;->done(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$2$e-e-a-NicoliveBrowser(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 9

    .line 23
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_0

    iget v0, p0, Le/e/a/NicoliveBrowser;->generation:I

    if-ne p1, v0, :cond_0

    move-object v0, p3

    move-object p3, p4

    :try_start_0
    new-instance p4, Ljava/lang/String;

    const/high16 v1, 0x200000

    const/4 v2, 0x1

    invoke-virtual {p0, p2, v0, v1, v2}, Le/e/a/NicoliveBrowser;->bytes(Ljava/lang/String;Ljava/lang/String;IZ)[B

    move-result-object p2

    const-string v0, "UTF-8"

    invoke-direct {p4, p2, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move p2, p1

    move-object p1, p0

    :try_start_1
    new-instance p0, Le/e/a/NicoliveBrowser$5;

    invoke-direct/range {p0 .. p5}, Le/e/a/NicoliveBrowser$5;-><init>(Le/e/a/NicoliveBrowser;ILjava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move p2, p1

    move-object p1, p0

    :catch_1
    iget-object p0, p1, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance p3, Le/e/a/NicoliveBrowser$6;

    invoke-direct {p3, p1, p2, p5}, Le/e/a/NicoliveBrowser$6;-><init>(Le/e/a/NicoliveBrowser;ILe/e/a/NicoliveBrowser$Result;)V

    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method synthetic lambda$3$e-e-a-NicoliveBrowser(ILjava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 6

    .line 23
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_1

    iget v0, p0, Le/e/a/NicoliveBrowser;->generation:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    new-instance v0, Le/e/a/NicoliveBrowser$Feed;

    invoke-direct {v0, p3}, Le/e/a/NicoliveBrowser$Feed;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    iget-object p1, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->size()I

    move-result p1

    const/4 p2, 0x3

    if-gt p1, p2, :cond_0

    invoke-interface {p4, p3}, Le/e/a/NicoliveBrowser$Result;->done(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p1, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method synthetic lambda$4$e-e-a-NicoliveBrowser(ILe/e/a/NicoliveBrowser$Result;)V
    .registers 4

    .line 23
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_0

    iget p0, p0, Le/e/a/NicoliveBrowser;->generation:I

    if-ne p1, p0, :cond_0

    invoke-interface {p2}, Le/e/a/NicoliveBrowser$Result;->error()V

    :cond_0
    return-void
.end method

.method synthetic lambda$5$e-e-a-NicoliveBrowser(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 8

    .line 0
    const/4 v0, 0x0

    .line 41
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://live2.nicovideo.jp/api/v2/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NicoliveBrowser;->openReservationConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v0

    const/4 p1, 0x0

    .line 42
    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 p1, 0x3a98

    .line 43
    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 44
    invoke-virtual {v0, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 45
    const-string p1, "Cookie"

    invoke-virtual {v0, p1, p3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    const-string p1, "User-Agent"

    const-string p2, "Mozilla/5.0"

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const-string p1, "X-Frontend-Id"

    const-string p2, "9"

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    const-string p1, "Origin"

    const-string p2, "https://live.nicovideo.jp"

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    const-string p1, "Accept"

    const-string p2, "application/json"

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    .line 51
    iget-object p2, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance p3, Le/e/a/NicoliveBrowser$7;

    invoke-direct {p3, p0, p1, p4}, Le/e/a/NicoliveBrowser$7;-><init>(Le/e/a/NicoliveBrowser;ILe/e/a/NicoliveBrowser$Result;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    .line 52
    :catch_0
    :try_start_1
    iget-object p1, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/NicoliveBrowser$8;

    invoke-direct {p2, p0, p4}, Le/e/a/NicoliveBrowser$8;-><init>(Le/e/a/NicoliveBrowser;Le/e/a/NicoliveBrowser$Result;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    throw p0
.end method

.method synthetic lambda$6$e-e-a-NicoliveBrowser(ILe/e/a/NicoliveBrowser$Result;)V
    .registers 4

    .line 51
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0xc8

    if-lt p1, v0, :cond_1

    const/16 v0, 0x12c

    if-ge p1, v0, :cond_1

    invoke-virtual {p0}, Le/e/a/NicoliveBrowser;->refresh()V

    const-string p0, ""

    invoke-interface {p2, p0}, Le/e/a/NicoliveBrowser$Result;->done(Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-interface {p2}, Le/e/a/NicoliveBrowser$Result;->error()V

    return-void
.end method

.method synthetic lambda$7$e-e-a-NicoliveBrowser(Le/e/a/NicoliveBrowser$Result;)V
    .registers 2

    .line 52
    iget-boolean p0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez p0, :cond_0

    invoke-interface {p1}, Le/e/a/NicoliveBrowser$Result;->error()V

    :cond_0
    return-void
.end method

.method synthetic lambda$8$e-e-a-NicoliveBrowser(Ljava/lang/String;Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;)V
    .registers 13

    .line 0
    move-object v0, p5

    const/4 p5, 0x0

    .line 95
    :try_start_0
    iget v1, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eq p3, v1, :cond_0

    .line 115
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    move-object v2, p0

    new-instance p0, Le/e/a/NicoliveBrowser$2;

    move p4, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, v2

    invoke-direct/range {p0 .. p5}, Le/e/a/NicoliveBrowser$2;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    if-eqz p4, :cond_4

    .line 99
    :try_start_1
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->appContext:Landroid/content/Context;

    if-nez p0, :cond_1

    .line 100
    const-string p0, ""

    goto :goto_0

    :cond_1
    invoke-static {p0}, Le/e/a/NicoliveBrowser;->cookie(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 101
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "https://live.nicovideo.jp/watch/"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/high16 p2, 0x200000

    const/4 p3, 0x0

    invoke-virtual {v2, p1, p0, p2, p3}, Le/e/a/NicoliveBrowser;->bytes(Ljava/lang/String;Ljava/lang/String;IZ)[B

    move-result-object p0

    .line 103
    new-instance p1, Ljava/lang/String;

    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, p0, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 102
    invoke-static {p1, p4}, Le/e/a/NicoliveData;->historyThumbnail(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 104
    invoke-direct {v2, p0}, Le/e/a/NicoliveBrowser;->decodeImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object p5, p0

    :catch_0
    if-nez p5, :cond_3

    .line 106
    :try_start_2
    iget p0, v2, Le/e/a/NicoliveBrowser;->imageGeneration:I

    if-ne v5, p0, :cond_4

    .line 107
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    move-result p0

    const/16 p1, 0x80

    if-le p0, p1, :cond_2

    iget-object p0, v2, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 108
    :cond_2
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 109
    :cond_3
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->missingHistory:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0, p4}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_1
    if-nez p5, :cond_5

    .line 111
    iget p0, v2, Le/e/a/NicoliveBrowser;->imageGeneration:I

    if-ne v5, p0, :cond_5

    invoke-direct {v2, v0}, Le/e/a/NicoliveBrowser;->decodeImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v6, p0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_4

    :cond_5
    move-object v6, p5

    :goto_2
    if-eqz v6, :cond_6

    .line 112
    :try_start_3
    sget-object p0, Le/e/a/NicoliveBrowser;->images:Landroid/util/LruCache;

    invoke-virtual {p0, v3, v6}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    move-object p0, v0

    goto :goto_5

    .line 115
    :cond_6
    :goto_3
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/NicoliveBrowser$2;

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveBrowser$2;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Bitmap;)V

    goto :goto_6

    :catchall_2
    move-exception v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    :goto_4
    move-object p0, v0

    move-object v6, p5

    :goto_5
    iget-object p1, v2, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/NicoliveBrowser$2;

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveBrowser$2;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Bitmap;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 123
    throw p0

    :catch_1
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    :catch_2
    move-object v6, p5

    .line 115
    :catch_3
    iget-object p0, v2, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/NicoliveBrowser$2;

    invoke-direct/range {v1 .. v6}, Le/e/a/NicoliveBrowser$2;-><init>(Le/e/a/NicoliveBrowser;Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Bitmap;)V

    :goto_6
    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$9$e-e-a-NicoliveBrowser(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Bitmap;)V
    .registers 6

    .line 116
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    :cond_0
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    if-nez v0, :cond_2

    iget p0, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    if-ne p3, p0, :cond_2

    if-eqz p4, :cond_2

    .line 118
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/ref/WeakReference;

    .line 119
    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    if-eqz p2, :cond_1

    .line 120
    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method load(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 13

    .line 20
    iget-boolean v0, p0, Le/e/a/NicoliveBrowser;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->loading:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->work:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->feedConnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_2

    new-instance v2, Le/e/a/NicoliveBrowser$9;

    invoke-direct {v2, v0}, Le/e/a/NicoliveBrowser$9;-><init>(Ljava/net/HttpURLConnection;)V

    invoke-static {v2}, Le/e/a/NicoliveIo;->execute(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 21
    :cond_2
    iget v0, p0, Le/e/a/NicoliveBrowser;->generation:I

    add-int/lit8 v4, v0, 0x1

    iput v4, p0, Le/e/a/NicoliveBrowser;->generation:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NicoliveBrowser$Feed;

    if-eqz v0, :cond_3

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v5, v0, Le/e/a/NicoliveBrowser$Feed;->at:J

    sub-long/2addr v1, v5

    const-wide/16 v5, 0x7530

    cmp-long v1, v1, v5

    if-gez v1, :cond_3

    iget-object p1, p0, Le/e/a/NicoliveBrowser;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/NicoliveBrowser$10;

    invoke-direct {p2, p0, v4, p3, v0}, Le/e/a/NicoliveBrowser$10;-><init>(Le/e/a/NicoliveBrowser;ILe/e/a/NicoliveBrowser$Result;Le/e/a/NicoliveBrowser$Feed;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 23
    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->work:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Le/e/a/NicoliveBrowser$11;

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    move-object v8, p3

    invoke-direct/range {v2 .. v8}, Le/e/a/NicoliveBrowser$11;-><init>(Le/e/a/NicoliveBrowser;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    iput-object p0, v3, Le/e/a/NicoliveBrowser;->loading:Ljava/util/concurrent/Future;

    return-void
.end method

.method openReservationConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    return-object p0
.end method

.method pauseImages()V
    .registers 3

    const/4 v0, 0x1

    .line 127
    iput-boolean v0, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    iget v1, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/NicoliveBrowser;->imageGeneration:I

    iget v1, p0, Le/e/a/NicoliveBrowser;->generation:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/NicoliveBrowser;->generation:I

    iget-object v1, p0, Le/e/a/NicoliveBrowser;->loading:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveBrowser;->work:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->pending:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveBrowser;->imageWork:Ljava/util/concurrent/ExecutorService;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->getQueue()Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    invoke-virtual {p0}, Le/e/a/NicoliveBrowser;->disconnectRequests()V

    return-void
.end method

.method refresh()V
    .registers 1

    .line 57
    iget-object p0, p0, Le/e/a/NicoliveBrowser;->feeds:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    return-void
.end method

.method reserve(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V
    .registers 12

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "programs/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/timeshift/reservation"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v5, "POST"

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Le/e/a/NicoliveBrowser;->mutateReservation(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveBrowser$Result;)V

    return-void
.end method

.method resumeImages()V
    .registers 2

    const/4 v0, 0x0

    .line 128
    iput-boolean v0, p0, Le/e/a/NicoliveBrowser;->imagesPaused:Z

    return-void
.end method

.method setContext(Landroid/content/Context;)V
    .registers 2

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveBrowser;->appContext:Landroid/content/Context;

    return-void
.end method
