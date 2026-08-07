.class Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;


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
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;[BII)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v3, v2, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    const-wide/16 v5, 0x0

    .line 9
    .line 10
    cmp-long p0, v3, v5

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    move-object v5, p1

    .line 15
    move-object v6, p2

    .line 16
    move v7, p3

    .line 17
    move v8, p4

    .line 18
    invoke-virtual/range {v2 .. v8}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetTextureData(JLjava/lang/String;[BII)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    move-object p0, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    monitor-exit v1

    .line 26
    return-void

    .line 27
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Lcom/momo/xeengine/lightningrender/StickerModel;)V
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 5
    .line 6
    iget-wide v3, v2, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getAssetPath()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v5

    .line 12
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getStickerId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v6

    .line 16
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getBusinessType()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v7

    .line 20
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getDuration()J

    .line 21
    .line 22
    .line 23
    move-result-wide v8

    .line 24
    invoke-virtual/range {v2 .. v9}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeLoadSticker(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    cmp-long p1, v2, v4

    .line 31
    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 35
    .line 36
    iget-wide v4, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 37
    .line 38
    invoke-virtual {p0, v4, v5, v2, v3}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeAddStickerModel(JJ)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    move-object p0, v0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    :goto_0
    monitor-exit v1

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method

.method public static synthetic c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeClearEngineModel(JLjava/lang/String;)V

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

.method public static synthetic d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeClearAllEngineModel(J)V

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

.method public static synthetic e(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeAddStickerModel(JJ)V

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

.method public static synthetic f(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

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
    invoke-virtual {p0, v1, v2, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeClearEngineModelWithId(JLjava/lang/String;)V

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
.method public declared-synchronized add(Lcom/momo/xeengine/lightningrender/StickerModel;)V
    .locals 14

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 7
    .line 8
    iget-wide v2, v1, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 9
    .line 10
    const-wide/16 v4, 0x0

    .line 11
    .line 12
    cmp-long v0, v2, v4

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {v1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/momo/xeengine/lightningrender/y;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/y;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Lcom/momo/xeengine/lightningrender/StickerModel;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    move-object p1, v0

    .line 31
    goto :goto_3

    .line 32
    :cond_1
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    :try_start_1
    iget-object v6, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 34
    .line 35
    iget-wide v7, v6, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 36
    .line 37
    cmp-long v0, v7, v4

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getAssetPath()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getStickerId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v10

    .line 49
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getBusinessType()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v11

    .line 53
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getDuration()J

    .line 54
    .line 55
    .line 56
    move-result-wide v12

    .line 57
    invoke-virtual/range {v6 .. v13}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeLoadSticker(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v2

    .line 61
    goto :goto_0

    .line 62
    :catchall_1
    move-exception v0

    .line 63
    move-object p1, v0

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    move-wide v2, v4

    .line 66
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 67
    cmp-long p1, v2, v4

    .line 68
    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    :try_start_2
    iget-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Lcom/momo/xeengine/lightningrender/z;

    .line 78
    .line 79
    invoke-direct {v0, p0, v2, v3}, Lcom/momo/xeengine/lightningrender/z;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    .line 84
    .line 85
    :cond_3
    :goto_1
    monitor-exit p0

    .line 86
    return-void

    .line 87
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 88
    :try_start_4
    throw p1

    .line 89
    :goto_3
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    throw p1
.end method

.method public addListener(Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$102(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public removeAll()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/c0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/momo/xeengine/lightningrender/c0;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public declared-synchronized removeByBusinessType(Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/momo/xeengine/lightningrender/b0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/b0;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p1
.end method

.method public declared-synchronized removeByID(Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/momo/xeengine/lightningrender/x;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/x;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p1
.end method

.method public setTextureData(Ljava/lang/String;[BII)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->this$0:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/momo/xeengine/lightningrender/a0;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-object v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move v5, p3

    .line 13
    move v6, p4

    .line 14
    invoke-direct/range {v1 .. v6}, Lcom/momo/xeengine/lightningrender/a0;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Ljava/lang/String;[BII)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
