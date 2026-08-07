.class Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;


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
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;IF)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    if-eqz v3, :cond_1

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1, v2, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetLookup0Intensity(JF)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v3, 0x1

    .line 23
    if-ne p1, v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v1, v2, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetLookup1Intensity(JF)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;ILjava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    if-eqz v3, :cond_1

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1, v2, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetLookup0Path(JLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v3, 0x1

    .line 23
    if-ne p1, v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v1, v2, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetLookup1Path(JLjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public static synthetic c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetLookupEnable(JZ)V

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

.method public static synthetic d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    if-eqz v3, :cond_1

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeClearLookup0(J)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    const/4 v3, 0x1

    .line 23
    if-ne p1, v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeClearLookup1(J)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->clear(I)V

    return-void
.end method

.method public clear(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/w;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/w;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;I)V

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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetLookupEnable(J)Z

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

.method public setEnable(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/u;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/u;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setIntensity(F)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->setIntensity(IF)V

    return-void
.end method

.method public setIntensity(IF)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/t;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/t;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;IF)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setPath(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/v;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/v;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->setPath(ILjava/lang/String;)V

    return-void
.end method
