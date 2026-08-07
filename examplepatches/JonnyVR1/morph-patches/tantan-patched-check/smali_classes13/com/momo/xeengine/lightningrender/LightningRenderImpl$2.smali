.class Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;


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
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSwitchSkinSmooth(JI)V

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

.method public static synthetic b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSwitchSkinWhite(JI)V

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

.method public static synthetic c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSwitchV3DegreeSubVersion(JI)V

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

.method public static synthetic d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetFullSmoothEnable(JZ)V

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

.method public static synthetic e(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSwitchSkinV3WhiteVersion(JI)V

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

.method public static synthetic f(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Ljava/lang/String;F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetFaceBeautyValue(JLjava/lang/String;F)V

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
.method public getEnable()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetBeautyEnable(J)Z

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

.method public getSkinSmoothVersion()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetSmoothVersion(J)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    monitor-exit v0

    .line 13
    return p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public getSkinWhiteningVersion()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetWhiteVersion(J)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    monitor-exit v0

    .line 13
    return p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public setBigEyeVersion(I)V
    .locals 0

    return-void
.end method

.method public setDegreeV3SubVersion(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/o;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/o;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setEnable(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetBeautyEnable(JZ)V

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

.method public setFaceBeautyValue(Ljava/lang/String;F)V
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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    new-instance v2, Lcom/momo/xeengine/lightningrender/s;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, p2}, Lcom/momo/xeengine/lightningrender/s;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Ljava/lang/String;F)V

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

.method public setFullSmoothEnable(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/q;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/q;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setSkinSmoothVersion(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/p;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/p;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setSkinWhiteningVersion(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/n;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/n;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setWhitenV3SubVersion(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/r;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/r;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
