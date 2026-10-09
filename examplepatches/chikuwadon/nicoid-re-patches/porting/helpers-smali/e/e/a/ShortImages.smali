.class final Le/e/a/ShortImages;
.super Ljava/lang/Object;
.source "ShortImages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ShortImages$Job;,
        Le/e/a/ShortImages$Subscription;,
        Le/e/a/ShortImages$Binding;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static final bindings:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/ImageView;",
            "Le/e/a/ShortImages$Binding;",
            ">;"
        }
    .end annotation
.end field

.field private static disk:Le/e/a/ImageDiskCache;

.field private static final jobs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/ShortImages$Job;",
            ">;"
        }
    .end annotation
.end field

.field private static final memory:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ShortImages;->MAIN:Landroid/os/Handler;

    .line 23
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v3, 0x3

    const/4 v4, 0x3

    const-wide/16 v5, 0x1e

    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v2, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    .line 25
    new-instance v0, Le/e/a/ShortImages$1;

    const/high16 v1, 0xc00000

    invoke-direct {v0, v1}, Le/e/a/ShortImages$1;-><init>(I)V

    sput-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    .line 29
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V
    .registers 2
    .param p0, "x0"    # Le/e/a/ShortImages$Job;
    .param p1, "x1"    # Le/e/a/ShortImages$Subscription;

    .line 21
    invoke-static {p0, p1}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    return-void
.end method

.method static synthetic access$100([B)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # [B

    .line 21
    invoke-static {p0}, Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Landroid/util/LruCache;
    .registers 1

    .line 21
    sget-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    return-object v0
.end method

.method static synthetic access$300()Landroid/os/Handler;
    .registers 1

    .line 21
    sget-object v0, Le/e/a/ShortImages;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400()Ljava/util/Map;
    .registers 1

    .line 21
    sget-object v0, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    return-object v0
.end method

.method static cancel(Landroid/app/Activity;)V
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Job;

    .line 55
    .local v1, "job":Le/e/a/ShortImages$Job;
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v1, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_26
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ShortImages$Subscription;

    .line 56
    .local v3, "subscriber":Le/e/a/ShortImages$Subscription;
    iget-object v4, v3, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 57
    .local v4, "target":Landroid/widget/ImageView;
    if-eqz v4, :cond_46

    invoke-virtual {v4}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Le/e/a/ShortImages;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    if-ne v5, p0, :cond_49

    :cond_46
    invoke-static {v1, v3}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    .line 58
    .end local v3    # "subscriber":Le/e/a/ShortImages$Subscription;
    .end local v4    # "target":Landroid/widget/ImageView;
    :cond_49
    goto :goto_26

    .line 59
    .end local v1    # "job":Le/e/a/ShortImages$Job;
    :cond_4a
    goto :goto_f

    .line 60
    :cond_4b
    return-void
.end method

.method private static decode([B)Landroid/graphics/Bitmap;
    .registers 7
    .param p0, "bytes"    # [B

    .line 129
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 130
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 131
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v3, 0x0

    if-lez v1, :cond_45

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gtz v1, :cond_17

    goto :goto_45

    .line 132
    :cond_17
    const/4 v1, 0x1

    .local v1, "sample":I
    :goto_18
    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v4, v1

    const/16 v5, 0x384

    if-gt v4, v5, :cond_26

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v4, v1

    const/16 v5, 0x640

    if-le v4, v5, :cond_2d

    :cond_26
    const/16 v4, 0x40

    if-ge v1, v4, :cond_2d

    mul-int/lit8 v1, v1, 0x2

    goto :goto_18

    .line 133
    :cond_2d
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 134
    array-length v4, p0

    invoke-static {p0, v2, v4, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 135
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_44

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v4

    const/high16 v5, 0x800000

    if-le v4, v5, :cond_44

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    return-object v3

    .line 136
    :cond_44
    return-object v2

    .line 131
    .end local v1    # "sample":I
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :cond_45
    :goto_45
    return-object v3
.end method

.method static load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 11
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "target"    # Landroid/widget/ImageView;
    .param p2, "placeholder"    # Landroid/widget/TextView;

    .line 41
    if-eqz p0, :cond_9b

    const-string v0, "https://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_9b

    .line 42
    :cond_c
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    sget-object v0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    new-instance v1, Le/e/a/ShortImages$Binding;

    invoke-direct {v1, p0, p2}, Le/e/a/ShortImages$Binding;-><init>(Ljava/lang/String;Landroid/widget/TextView;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 44
    .local v0, "cached":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2c

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    .line 45
    :cond_2c
    sget-object v1, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    if-nez v1, :cond_43

    new-instance v1, Le/e/a/ImageDiskCache;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/ImageDiskCache;-><init>(Ljava/io/File;)V

    sput-object v1, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    .line 46
    :cond_43
    sget-object v1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Job;

    .local v1, "job":Le/e/a/ShortImages$Job;
    if-nez v1, :cond_4f

    const/4 v2, 0x1

    goto :goto_50

    :cond_4f
    const/4 v2, 0x0

    .line 47
    .local v2, "start":Z
    :goto_50
    if-eqz v2, :cond_5f

    new-instance v3, Le/e/a/ShortImages$Job;

    sget-object v4, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    invoke-direct {v3, p0, v4}, Le/e/a/ShortImages$Job;-><init>(Ljava/lang/String;Le/e/a/ImageDiskCache;)V

    move-object v1, v3

    sget-object v3, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    invoke-interface {v3, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    :cond_5f
    iget-object v3, v1, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_65
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/ShortImages$Subscription;

    .local v4, "existing":Le/e/a/ShortImages$Subscription;
    iget-object v5, v4, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p1, :cond_7a

    return-void

    .end local v4    # "existing":Le/e/a/ShortImages$Subscription;
    :cond_7a
    goto :goto_65

    .line 49
    :cond_7b
    new-instance v3, Le/e/a/ShortImages$Subscription;

    invoke-direct {v3, p1, p2, v1}, Le/e/a/ShortImages$Subscription;-><init>(Landroid/widget/ImageView;Landroid/widget/TextView;Le/e/a/ShortImages$Job;)V

    .line 50
    .local v3, "subscriber":Le/e/a/ShortImages$Subscription;
    iget-object v4, v1, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 51
    if-eqz v2, :cond_9a

    move-object v4, v1

    .local v4, "next":Le/e/a/ShortImages$Job;
    iget-object v5, v4, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    sget-object v6, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Le/e/a/ShortImages$0;

    invoke-direct {v7, v4}, Le/e/a/ShortImages$0;-><init>(Le/e/a/ShortImages$Job;)V

    invoke-virtual {v5, v6, v7}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 52
    .end local v4    # "next":Le/e/a/ShortImages$Job;
    :cond_9a
    return-void

    .line 41
    .end local v0    # "cached":Landroid/graphics/Bitmap;
    .end local v1    # "job":Le/e/a/ShortImages$Job;
    .end local v2    # "start":Z
    .end local v3    # "subscriber":Le/e/a/ShortImages$Subscription;
    :cond_9b
    :goto_9b
    return-void
.end method

.method private static owner(Landroid/content/Context;)Landroid/app/Activity;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .line 62
    nop

    :goto_1
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_19

    .line 63
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_d

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 64
    :cond_d
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "next":Landroid/content/Context;
    if-ne v0, p0, :cond_17

    goto :goto_19

    :cond_17
    move-object p0, v0

    .line 65
    .end local v0    # "next":Landroid/content/Context;
    goto :goto_1

    .line 66
    :cond_19
    :goto_19
    const/4 v0, 0x0

    return-object v0
.end method

.method private static remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V
    .registers 5
    .param p0, "job"    # Le/e/a/ShortImages$Job;
    .param p1, "subscriber"    # Le/e/a/ShortImages$Subscription;

    .line 69
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p1, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 70
    .local v0, "target":Landroid/widget/ImageView;
    if-eqz v0, :cond_12

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 71
    :cond_12
    iget-object v1, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_35

    sget-object v1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p0, :cond_35

    .line 72
    sget-object v1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancel()V

    sget-object v1, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    .line 74
    :cond_35
    return-void
.end method

.method static resume(Landroid/app/Activity;)V
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_55

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 36
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/widget/ImageView;Le/e/a/ShortImages$Binding;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .local v2, "view":Landroid/widget/ImageView;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ShortImages$Binding;

    .local v3, "binding":Le/e/a/ShortImages$Binding;
    iget-object v4, v3, Le/e/a/ShortImages$Binding;->placeholder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 37
    .local v4, "placeholder":Landroid/widget/TextView;
    if-eqz v2, :cond_54

    if-eqz v4, :cond_54

    invoke-virtual {v2}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Le/e/a/ShortImages;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    if-ne v5, p0, :cond_54

    invoke-virtual {v2}, Landroid/widget/ImageView;->isAttachedToWindow()Z

    move-result v5

    if-eqz v5, :cond_54

    iget-object v5, v3, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_54

    iget-object v5, v3, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-static {v5, v2, v4}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    .line 38
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/widget/ImageView;Le/e/a/ShortImages$Binding;>;"
    .end local v2    # "view":Landroid/widget/ImageView;
    .end local v3    # "binding":Le/e/a/ShortImages$Binding;
    .end local v4    # "placeholder":Landroid/widget/TextView;
    :cond_54
    goto :goto_f

    .line 39
    :cond_55
    return-void
.end method
