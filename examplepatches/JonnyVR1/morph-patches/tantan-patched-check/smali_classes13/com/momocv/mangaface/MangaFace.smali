.class public Lcom/momocv/mangaface/MangaFace;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private inited:Z

.field private mOBJPtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/momocv/OsUtils;->isWindows()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "mmcv_api_mangaface"

    .line 6
    .line 7
    const-string v2, "mmcv_api_base"

    .line 8
    .line 9
    const-string v3, "mmcv_base"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "c++_shared"

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "MNN"

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v0, "MNN_CL"

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "MNN_Express"

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v3}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momocv/mangaface/MangaFace;->mOBJPtr:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momocv/mangaface/MangaFace;->inited:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momocv/mangaface/MangaFace;->Create()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static native nativeCreate()J
.end method

.method private static native nativeMangaFace(JLcom/momocv/mangaface/MangaFaceParams;Lcom/momocv/mangaface/MangaFaceInfo;)Z
.end method

.method private static native nativeRelease(J)V
.end method


# virtual methods
.method public declared-synchronized Create()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/momocv/mangaface/MangaFace;->Release()V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/momocv/mangaface/MangaFace;->nativeCreate()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iput-wide v0, p0, Lcom/momocv/mangaface/MangaFace;->mOBJPtr:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/momocv/mangaface/MangaFace;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public declared-synchronized Release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momocv/mangaface/MangaFace;->mOBJPtr:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/momocv/mangaface/MangaFace;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momocv/mangaface/MangaFace;->mOBJPtr:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/momocv/mangaface/MangaFace;->inited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momocv/mangaface/MangaFace;->Release()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public manga_face(Lcom/momocv/mangaface/MangaFaceParams;Lcom/momocv/mangaface/MangaFaceInfo;)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momocv/mangaface/MangaFace;->mOBJPtr:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/momocv/mangaface/MangaFace;->inited:Z

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne p0, v2, :cond_0

    .line 14
    .line 15
    invoke-static {v0, v1, p1, p2}, Lcom/momocv/mangaface/MangaFace;->nativeMangaFace(JLcom/momocv/mangaface/MangaFaceParams;Lcom/momocv/mangaface/MangaFaceInfo;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    return v3
.end method
