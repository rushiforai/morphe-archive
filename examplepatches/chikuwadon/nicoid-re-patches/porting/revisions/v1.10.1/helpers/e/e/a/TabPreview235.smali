.class public final Le/e/a/TabPreview235;
.super Ljava/lang/Object;
.source "TabPreview235.java"


# static fields
.field static final CACHE:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field static final MAIN:Landroid/os/Handler;

.field static final pending:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Le/e/a/MultiTabs227$Host;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/TabPreview235;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/TabPreview235$1;

    const/high16 v1, 0xc00000

    invoke-direct {v0, v1}, Le/e/a/TabPreview235$1;-><init>(I)V

    sput-object v0, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/TabPreview235;->pending:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static destroy(Le/e/a/MultiTabs227$Host;)V
    .registers 2

    .line 7
    sget-object v0, Le/e/a/TabPreview235;->pending:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    if-eqz p0, :cond_f

    sget-object v0, Le/e/a/TabPreview235;->MAIN:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_f
    return-void
.end method

.method static get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 2

    .line 6
    sget-object v0, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    invoke-virtual {v0, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V
    .registers 9

    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/MultiTabs227$Host;

    if-nez p0, :cond_9

    return-void

    :cond_9
    sget-object v0, Le/e/a/TabPreview235;->pending:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_ac

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_ac

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_ac

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_ac

    sget-object v0, Le/e/a/TabPager233;->states:Ljava/util/WeakHashMap;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    goto/16 :goto_ac

    :cond_38
    :try_start_38
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-nez v0, :cond_3f

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    goto :goto_4e

    :cond_3f
    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    const-string v0, "V"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, v0, v2, v1}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    :goto_4e
    if-eqz p0, :cond_aa

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_aa

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_aa

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_63

    goto :goto_aa

    :cond_63
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x43f00000    # 480.0f

    div-float/2addr v1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    nop

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    float-to-int v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-long v3, v1

    int-to-long v5, v2

    mul-long/2addr v3, v5

    const-wide/32 v5, 0x600000

    cmp-long v3, v3, v5

    if-lez v3, :cond_93

    return-void

    :cond_93
    sget-object v3, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-virtual {p0, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    sget-object p0, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    invoke-virtual {p0, p1, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_a9} :catch_ab

    goto :goto_ac

    :cond_aa
    :goto_aa
    return-void

    :catch_ab
    move-exception p0

    :cond_ac
    :goto_ac
    return-void
.end method

.method static schedule(Le/e/a/MultiTabs227$Host;)V
    .registers 4

    sget-object v0, Le/e/a/TabPreview235;->pending:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_f

    sget-object v1, Le/e/a/TabPreview235;->MAIN:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_f
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/16 v2, 0x13

    new-array v2, v2, [C

    fill-array-data v2, :array_42

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_29

    return-void

    :cond_29
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    new-instance v2, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, v1}, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    sget-object v0, Le/e/a/TabPreview235;->pending:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/TabPreview235;->MAIN:Landroid/os/Handler;

    const-wide/16 v0, 0x15e

    invoke-virtual {p0, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :array_42
    .array-data 2
        0x74s
        0x61s
        0x62s
        0x5fs
        0x73s
        0x77s
        0x69s
        0x70s
        0x65s
        0x5fs
        0x61s
        0x6es
        0x69s
        0x6ds
        0x61s
        0x74s
        0x69s
        0x6fs
        0x6es
    .end array-data
.end method
