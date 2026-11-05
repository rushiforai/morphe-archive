.class final Le/e/a/ShortImages;
.super Ljava/lang/Object;
.source "ShortImages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ShortImages$Binding;,
        Le/e/a/ShortImages$Job;,
        Le/e/a/ShortImages$Subscription;
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
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v3, 0x3

    const/4 v4, 0x3

    const-wide/16 v5, 0x1e

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    sput-object v0, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 24
    sget-object v0, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    .line 26
    new-instance v0, Le/e/a/ShortImages$1;

    const/high16 v1, 0xc00000

    invoke-direct {v0, v1}, Le/e/a/ShortImages$1;-><init>(I)V

    sput-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    .line 30
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

.method static synthetic access$0(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V
    .registers 2

    .line 83
    invoke-static {p0, p1}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    return-void
.end method

.method static synthetic access$1([B)Landroid/graphics/Bitmap;
    .registers 1

    .line 149
    invoke-static {p0}, Le/e/a/ShortImages;->decode([B)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2()Landroid/util/LruCache;
    .registers 1

    .line 26
    sget-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    return-object v0
.end method

.method static synthetic access$3()Landroid/os/Handler;
    .registers 1

    .line 22
    sget-object v0, Le/e/a/ShortImages;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$4()Ljava/util/Map;
    .registers 1

    .line 25
    sget-object v0, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$5()Ljava/util/WeakHashMap;
    .registers 1

    .line 30
    sget-object v0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static cancel(Landroid/app/Activity;)V
    .registers 6

    .line 69
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

    if-nez v1, :cond_16

    .line 75
    return-void

    .line 69
    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Job;

    .line 70
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v1, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_27
    :goto_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2e

    goto :goto_f

    :cond_2e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ShortImages$Subscription;

    .line 71
    iget-object v4, v3, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 72
    if-eqz v4, :cond_48

    invoke-virtual {v4}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Le/e/a/ShortImages;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    if-ne v4, p0, :cond_27

    :cond_48
    invoke-static {v1, v3}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    goto :goto_27
.end method

.method private static decode([B)Landroid/graphics/Bitmap;
    .registers 7

    .line 150
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 151
    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 152
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v4, 0x0

    if-lez v2, :cond_41

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gtz v2, :cond_17

    goto :goto_41

    .line 153
    :cond_17
    nop

    :goto_18
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v2, v1

    const/16 v5, 0x384

    if-gt v2, v5, :cond_3e

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v2, v1

    const/16 v5, 0x640

    if-gt v2, v5, :cond_3e

    .line 154
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 155
    array-length v1, p0

    invoke-static {p0, v3, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 156
    if-eqz p0, :cond_3d

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v0

    const/high16 v1, 0x800000

    if-le v0, v1, :cond_3d

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    return-object v4

    .line 157
    :cond_3d
    return-object p0

    .line 153
    :cond_3e
    mul-int/lit8 v1, v1, 0x2

    goto :goto_18

    .line 152
    :cond_41
    :goto_41
    return-object v4
.end method

.method static load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .registers 9

    .line 43
    sget-object v0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ShortImages$Binding;

    .line 44
    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz p0, :cond_dc

    const-string v3, "https://"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_16

    goto/16 :goto_dc

    .line 50
    :cond_16
    if-eqz v0, :cond_2d

    iget-object v3, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    if-eqz v3, :cond_2d

    iget-object v3, v0, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2d

    .line 51
    iget-object v3, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    iget-object v3, v3, Le/e/a/ShortImages$Subscription;->job:Le/e/a/ShortImages$Job;

    iget-object v4, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    invoke-static {v3, v4}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    .line 52
    :cond_2d
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 53
    new-instance v3, Le/e/a/ShortImages$Binding;

    invoke-direct {v3, p0, p2}, Le/e/a/ShortImages$Binding;-><init>(Ljava/lang/String;Landroid/widget/TextView;)V

    .line 54
    if-eqz v0, :cond_43

    iget-object v4, v0, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43

    iget-object v0, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    iput-object v0, v3, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    .line 55
    :cond_43
    sget-object v0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 57
    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    if-eqz v4, :cond_5e

    sget-object v0, Le/e/a/ShortImages;->memory:Landroid/util/LruCache;

    invoke-virtual {v0, p0}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5f

    .line 58
    :cond_5e
    move-object v2, v0

    :goto_5f
    if-eqz v2, :cond_6c

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-eqz p2, :cond_6b

    const/16 p0, 0x8

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_6b
    return-void

    .line 59
    :cond_6c
    sget-object v0, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    if-nez v0, :cond_83

    new-instance v0, Le/e/a/ImageDiskCache;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2}, Le/e/a/ImageDiskCache;-><init>(Ljava/io/File;)V

    sput-object v0, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    .line 60
    :cond_83
    sget-object v0, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ShortImages$Job;

    if-nez v0, :cond_90

    const/4 v1, 0x1

    const/4 v4, 0x1

    goto :goto_91

    :cond_90
    const/4 v4, 0x0

    .line 61
    :goto_91
    if-eqz v4, :cond_9f

    new-instance v0, Le/e/a/ShortImages$Job;

    sget-object v1, Le/e/a/ShortImages;->disk:Le/e/a/ImageDiskCache;

    invoke-direct {v0, p0, v1}, Le/e/a/ShortImages$Job;-><init>(Ljava/lang/String;Le/e/a/ImageDiskCache;)V

    sget-object v1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9f
    move-object p0, v0

    .line 62
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_a6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_cd

    .line 63
    new-instance v0, Le/e/a/ShortImages$Subscription;

    invoke-direct {v0, p1, p2, p0}, Le/e/a/ShortImages$Subscription;-><init>(Landroid/widget/ImageView;Landroid/widget/TextView;Le/e/a/ShortImages$Job;)V

    .line 64
    iput-object v0, v3, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    .line 65
    iget-object p2, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 66
    if-eqz v4, :cond_cc

    iget-object p1, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    sget-object p2, Le/e/a/ShortImages;->WORKERS:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Le/e/a/ShortImages$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/ShortImages$$ExternalSyntheticLambda0;-><init>(Le/e/a/ShortImages$Job;)V

    invoke-virtual {p1, p2, v0}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 67
    :cond_cc
    return-void

    .line 62
    :cond_cd
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ShortImages$Subscription;

    iget-object v0, v0, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_a6

    return-void

    .line 45
    :cond_dc
    :goto_dc
    if-eqz v0, :cond_eb

    iget-object p0, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    if-eqz p0, :cond_eb

    iget-object p0, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    iget-object p0, p0, Le/e/a/ShortImages$Subscription;->job:Le/e/a/ShortImages$Job;

    iget-object v0, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    invoke-static {p0, v0}, Le/e/a/ShortImages;->remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V

    .line 46
    :cond_eb
    sget-object p0, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 47
    if-eqz p2, :cond_fb

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 48
    :cond_fb
    return-void
.end method

.method private static owner(Landroid/content/Context;)Landroid/app/Activity;
    .registers 3

    .line 77
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    if-ge v0, v1, :cond_1f

    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_a

    goto :goto_1f

    .line 78
    :cond_a
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_11

    check-cast p0, Landroid/app/Activity;

    return-object p0

    .line 79
    :cond_11
    move-object v1, p0

    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    if-ne v1, p0, :cond_1b

    goto :goto_1f

    .line 77
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    move-object p0, v1

    goto :goto_1

    .line 81
    :cond_1f
    :goto_1f
    const/4 p0, 0x0

    return-object p0
.end method

.method private static remove(Le/e/a/ShortImages$Job;Le/e/a/ShortImages$Subscription;)V
    .registers 4

    .line 84
    iget-object v0, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p1, Le/e/a/ShortImages$Subscription;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 85
    if-eqz v0, :cond_23

    .line 86
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 87
    sget-object v1, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ShortImages$Binding;

    .line 88
    if-eqz v0, :cond_23

    iget-object v1, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    if-ne v1, p1, :cond_23

    const/4 p1, 0x0

    iput-object p1, v0, Le/e/a/ShortImages$Binding;->subscription:Le/e/a/ShortImages$Subscription;

    .line 90
    :cond_23
    iget-object p1, p0, Le/e/a/ShortImages$Job;->subscribers:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_41

    sget-object p1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    iget-object v0, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_41

    .line 91
    sget-object p1, Le/e/a/ShortImages;->jobs:Ljava/util/Map;

    iget-object v0, p0, Le/e/a/ShortImages$Job;->url:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Le/e/a/ShortImages$Job;->task:Le/e/a/NetworkTask;

    invoke-virtual {p0}, Le/e/a/NetworkTask;->cancel()V

    .line 93
    :cond_41
    return-void
.end method

.method static resume(Landroid/app/Activity;)V
    .registers 7

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/ShortImages;->bindings:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    .line 41
    return-void

    .line 37
    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 38
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ShortImages$Binding;

    iget-object v3, v1, Le/e/a/ShortImages$Binding;->placeholder:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 39
    if-eqz v2, :cond_f

    invoke-virtual {v2}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Le/e/a/ShortImages;->owner(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    if-ne v4, p0, :cond_f

    invoke-virtual {v2}, Landroid/widget/ImageView;->isAttachedToWindow()Z

    move-result v4

    if-eqz v4, :cond_f

    iget-object v4, v1, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    iget-object v1, v1, Le/e/a/ShortImages$Binding;->url:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    goto :goto_f
.end method
