.class final Le/e/a/Media3Diagnostics276$Probe;
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
    name = "Probe"
.end annotation


# instance fields
.field buffered:J

.field final item:Ljava/lang/Object;

.field lastProgress:J

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

.field position:J


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JJ)V
    .registers 9

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 300
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Media3Diagnostics276$Probe;->owner:Ljava/lang/ref/WeakReference;

    .line 301
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/Media3Diagnostics276$Probe;->player:Ljava/lang/ref/WeakReference;

    .line 302
    iput-object p3, p0, Le/e/a/Media3Diagnostics276$Probe;->item:Ljava/lang/Object;

    .line 303
    iput-wide p4, p0, Le/e/a/Media3Diagnostics276$Probe;->position:J

    .line 304
    iput-wide p6, p0, Le/e/a/Media3Diagnostics276$Probe;->buffered:J

    .line 305
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/Media3Diagnostics276$Probe;->lastProgress:J

    .line 306
    return-void
.end method


# virtual methods
.method recordProgress(JJ)V
    .registers 9

    .line 309
    iget-wide v0, p0, Le/e/a/Media3Diagnostics276$Probe;->position:J

    sub-long/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v2, 0xfa

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    iget-wide v0, p0, Le/e/a/Media3Diagnostics276$Probe;->buffered:J

    cmp-long v0, v0, p3

    if-eqz v0, :cond_1

    .line 310
    :cond_0
    iput-wide p1, p0, Le/e/a/Media3Diagnostics276$Probe;->position:J

    .line 311
    iput-wide p3, p0, Le/e/a/Media3Diagnostics276$Probe;->buffered:J

    .line 312
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/Media3Diagnostics276$Probe;->lastProgress:J

    .line 314
    :cond_1
    return-void
.end method

.method public run()V
    .registers 14

    .line 317
    const-string v0, "nicoid-media-intent"

    iget-object v1, p0, Le/e/a/Media3Diagnostics276$Probe;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 318
    iget-object v2, p0, Le/e/a/Media3Diagnostics276$Probe;->player:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    .line 319
    if-eqz v1, :cond_a

    # getter for: Le/e/a/Media3Diagnostics276;->PROBES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/Media3Diagnostics276;->access$700()Ljava/util/WeakHashMap;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, p0, :cond_0

    goto/16 :goto_5

    .line 320
    :cond_0
    if-nez v2, :cond_1

    .line 321
    # invokes: Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$800(Ljava/lang/Object;)V

    .line 322
    return-void

    .line 324
    :cond_1
    nop

    .line 325
    const-string v3, "getPlaybackState"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v3}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    # invokes: Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I
    invoke-static {v4}, Le/e/a/Media3Diagnostics276;->access$500(Ljava/lang/Object;)I

    move-result v4

    .line 324
    # invokes: Le/e/a/Media3Diagnostics276;->eligible(Ljava/lang/Object;Ljava/lang/Object;I)Z
    invoke-static {v1, v2, v4}, Le/e/a/Media3Diagnostics276;->access$900(Ljava/lang/Object;Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 326
    const-string v4, "getCurrentMediaItem"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v4}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, p0, Le/e/a/Media3Diagnostics276$Probe;->item:Ljava/lang/Object;

    if-eq v5, v6, :cond_2

    goto/16 :goto_4

    .line 330
    :cond_2
    const-string v5, "getCurrentPosition"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v5}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    # invokes: Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J
    invoke-static {v5}, Le/e/a/Media3Diagnostics276;->access$600(Ljava/lang/Object;)J

    move-result-wide v5

    .line 331
    const-string v7, "getBufferedPosition"

    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v7}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    # invokes: Le/e/a/Media3Diagnostics276;->number(Ljava/lang/Object;)J
    invoke-static {v7}, Le/e/a/Media3Diagnostics276;->access$600(Ljava/lang/Object;)J

    move-result-wide v7

    .line 332
    const-wide/16 v9, 0x0

    cmp-long v11, v5, v9

    if-ltz v11, :cond_8

    cmp-long v11, v7, v9

    if-gez v11, :cond_3

    goto/16 :goto_3

    .line 336
    :cond_3
    invoke-virtual {p0, v5, v6, v7, v8}, Le/e/a/Media3Diagnostics276$Probe;->recordProgress(JJ)V

    .line 337
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iget-wide v11, p0, Le/e/a/Media3Diagnostics276$Probe;->lastProgress:J

    sub-long/2addr v7, v11

    const-wide/16 v11, 0x1f40

    sub-long/2addr v11, v7

    .line 338
    cmp-long v7, v11, v9

    if-lez v7, :cond_4

    .line 339
    # getter for: Le/e/a/Media3Diagnostics276;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/Media3Diagnostics276;->access$000()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-static {v1, v2, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 340
    return-void

    .line 342
    :cond_4
    # getter for: Le/e/a/Media3Diagnostics276;->ATTEMPTS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/Media3Diagnostics276;->access$1000()Ljava/util/WeakHashMap;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/Media3Diagnostics276$Attempt;

    .line 343
    if-eqz v7, :cond_7

    iget-object v8, v7, Le/e/a/Media3Diagnostics276$Attempt;->item:Ljava/lang/Object;

    iget-object v9, p0, Le/e/a/Media3Diagnostics276$Probe;->item:Ljava/lang/Object;

    if-ne v8, v9, :cond_7

    iget-boolean v8, v7, Le/e/a/Media3Diagnostics276$Attempt;->used:Z

    if-eqz v8, :cond_5

    goto :goto_2

    .line 347
    :cond_5
    const/4 v8, 0x1

    iput-boolean v8, v7, Le/e/a/Media3Diagnostics276$Attempt;->used:Z

    .line 348
    # invokes: Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$800(Ljava/lang/Object;)V

    .line 350
    :try_start_0
    const-string v7, "androidx.media3.common.Player"

    .line 351
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    .line 350
    const/4 v10, 0x0

    invoke-static {v7, v10, v9}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v7

    .line 352
    const-string v9, "stop"

    new-array v11, v10, [Ljava/lang/Class;

    invoke-virtual {v7, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 353
    const-string v11, "prepare"

    new-array v12, v10, [Ljava/lang/Class;

    invoke-virtual {v7, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 356
    new-array v11, v10, [Ljava/lang/Object;

    invoke-virtual {v9, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    # invokes: Le/e/a/Media3Diagnostics276;->canRecover(Ljava/lang/Object;Ljava/lang/Object;)Z
    invoke-static {v1, v2}, Le/e/a/Media3Diagnostics276;->access$200(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 358
    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v3}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    # invokes: Le/e/a/Media3Diagnostics276;->integer(Ljava/lang/Object;)I
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$500(Ljava/lang/Object;)I

    move-result v1

    if-ne v1, v8, :cond_6

    .line 359
    # invokes: Le/e/a/Media3Diagnostics276;->read(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v4}, Le/e/a/Media3Diagnostics276;->access$300(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iget-object v3, p0, Le/e/a/Media3Diagnostics276$Probe;->item:Ljava/lang/Object;

    if-ne v1, v3, :cond_6

    .line 360
    new-array v1, v10, [Ljava/lang/Object;

    invoke-virtual {v7, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Retried stalled seek buffering at position="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

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

    .line 365
    :cond_6
    goto :goto_1

    .line 363
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 364
    :goto_0
    const-string v2, "Bounded seek-buffer recovery failed"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 366
    :goto_1
    return-void

    .line 344
    :cond_7
    :goto_2
    # invokes: Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$800(Ljava/lang/Object;)V

    .line 345
    return-void

    .line 333
    :cond_8
    :goto_3
    # invokes: Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$800(Ljava/lang/Object;)V

    .line 334
    return-void

    .line 327
    :cond_9
    :goto_4
    # invokes: Le/e/a/Media3Diagnostics276;->cancel(Ljava/lang/Object;)V
    invoke-static {v1}, Le/e/a/Media3Diagnostics276;->access$800(Ljava/lang/Object;)V

    .line 328
    return-void

    .line 319
    :cond_a
    :goto_5
    return-void
.end method
