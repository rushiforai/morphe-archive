.class Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/lightningrender/LightningRenderImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLevelAddEffect(JLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeDisableMakeupEffect(JLjava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLipsSetLipsEffect(JI)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLevelRemoveAll(J)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic e(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;F)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetFaceBeautyValue(JLjava/lang/String;F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLevelRemoveWithType(JLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic g(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetMakeupEnable(JZ)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public static synthetic h(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLevelSetEffectIntensity(JLjava/lang/String;F)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public addEffect(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/j;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/j;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public disableEffect(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/l;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/l;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getEnable()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetMakeupEnable(J)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    monitor-exit v0

    .line 23
    return p0

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public isEffectActive()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeIsMakeupEffectActive(J)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    monitor-exit v0

    .line 23
    return p0

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public isStickerEffectActive()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v3, v1, v3

    .line 11
    .line 12
    if-eqz v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeIsStickerMakeupEffectActive(J)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    monitor-exit v0

    .line 23
    return p0

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public removeAll()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/m;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/momo/xeengine/lightningrender/m;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public removeWithType(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/g;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/g;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setEffectIntensity(Ljava/lang/String;F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v2, v1, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v4, v2, v4

    .line 11
    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v2, v3, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeMakeupLevelSetEffectIntensity(JLjava/lang/String;F)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {v1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Lcom/momo/xeengine/lightningrender/k;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/k;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;F)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0
.end method

.method public setEnable(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/h;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/h;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setLipsEffect(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/i;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/i;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setValue(Ljava/lang/String;F)V
    .locals 6

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 12
    .line 13
    iget-wide v2, v1, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v4, v2, v4

    .line 18
    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetFaceBeautyValue(JLjava/lang/String;F)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-static {v1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Lcom/momo/xeengine/lightningrender/f;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/f;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    monitor-exit v0

    .line 40
    return-void

    .line 41
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    throw p0
.end method
