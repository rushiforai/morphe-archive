.class final Le/e/a/Media3Diagnostics276$NetworkRetry;
.super Ljava/lang/Object;
.source "Media3Diagnostics276.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Media3Diagnostics276;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NetworkRetry"
.end annotation


# static fields
.field private static final DELAYS_MS:[J


# instance fields
.field final item:Ljava/lang/Object;

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final player:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field queued:Z

.field used:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 161
    const/4 v0, 0x4

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Le/e/a/Media3Diagnostics276$NetworkRetry;->DELAYS_MS:[J

    return-void

    nop

    :array_0
    .array-data 8
        0xbb8
        0x1b58
        0x3a98
        0x7530
    .end array-data
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->owner:Ljava/lang/ref/WeakReference;

    .line 170
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->player:Ljava/lang/ref/WeakReference;

    .line 171
    iput-object p3, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->item:Ljava/lang/Object;

    .line 172
    return-void
.end method


# virtual methods
.method queue()V
    .registers 4

    .line 175
    iget-boolean v0, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->queued:Z

    if-nez v0, :cond_1

    iget v0, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->used:I

    sget-object v1, Le/e/a/Media3Diagnostics276$NetworkRetry;->DELAYS_MS:[J

    array-length v1, v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 176
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->queued:Z

    .line 177
    # getter for: Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/Media3Diagnostics276;->access$000()Landroid/os/Handler;

    move-result-object v0

    sget-object v1, Le/e/a/Media3Diagnostics276$NetworkRetry;->DELAYS_MS:[J

    iget v2, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->used:I

    aget-wide v1, v1, v2

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 178
    return-void

    .line 175
    :cond_1
    :goto_0
    return-void
.end method

.method public run()V
    .registers 10

    .line 181
    const-string v0, "nicoid-media-intent"

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->queued:Z

    .line 182
    iget-object v2, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    .line 183
    iget-object v3, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    .line 184
    if-eqz v2, :cond_4

    if-eqz v3, :cond_4

    .line 185
    # getter for: Le/e/a/Media3Diagnostics276;->NETWORK_RETRIES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/Media3Diagnostics276;->access$100()Ljava/util/WeakHashMap;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eq v4, p0, :cond_0

    goto/16 :goto_3

    .line 186
    :cond_0
    # invokes: Le/e/a/Media3Diagnostics276;->canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z
    invoke-static {v2, v3}, Le/e/a/Media3Diagnostics276;->access$200(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 187
    const-string v4, "getCurrentMediaItem"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v3, v4}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->item:Ljava/lang/Object;

    if-eq v4, v5, :cond_1

    goto :goto_2

    .line 191
    :cond_1
    const-string v4, "getPlaybackState"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v3, v4}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    # invokes: Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I
    invoke-static {v4}, Le/e/a/Media3Diagnostics276;->access$500(Ljava/lang/Object;)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_2

    .line 192
    # invokes: Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V
    invoke-static {v2}, Le/e/a/Media3Diagnostics276;->access$400(Ljava/lang/Object;)V

    .line 193
    return-void

    .line 195
    :cond_2
    iget v2, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->used:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Le/e/a/Media3Diagnostics276$NetworkRetry;->used:I

    .line 196
    const-string v4, "getCurrentPosition"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v3, v4}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    # invokes: Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J
    invoke-static {v4}, Le/e/a/Media3Diagnostics276;->access$600(Ljava/lang/Object;)J

    move-result-wide v4

    .line 198
    :try_start_0
    const-string v6, "androidx.media3.common.Player"

    .line 199
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    .line 198
    invoke-static {v6, v1, v7}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    .line 202
    const-string v7, "prepare"

    new-array v8, v1, [Ljava/lang/Class;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v6, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Network recovery attempt "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/4 at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    goto :goto_1

    .line 205
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 206
    :goto_0
    const-string v2, "Network recovery prepare failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 210
    :goto_1
    return-void

    .line 188
    :cond_3
    :goto_2
    # invokes: Le/e/a/Media3Diagnostics276;->cancelNetwork(Ljava/lang/Object;)V
    invoke-static {v2}, Le/e/a/Media3Diagnostics276;->access$400(Ljava/lang/Object;)V

    .line 189
    return-void

    .line 185
    :cond_4
    :goto_3
    return-void
.end method
