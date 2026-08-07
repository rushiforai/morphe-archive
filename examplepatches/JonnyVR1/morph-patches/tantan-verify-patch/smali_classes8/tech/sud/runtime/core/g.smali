.class public Ltech/sud/runtime/core/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ltech/sud/runtime/core/h;


# instance fields
.field private b:J

.field private c:J

.field private d:I

.field private e:I

.field private f:Ltech/sud/runtime/component/g/a;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ltech/sud/runtime/core/g;->d:I

    .line 6
    .line 7
    iput v0, p0, Ltech/sud/runtime/core/g;->e:I

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->create(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    iput-wide v2, p0, Ltech/sud/runtime/core/g;->b:J

    .line 16
    .line 17
    iput-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 18
    .line 19
    return-void
.end method

.method public static a(Ltech/sud/runtime/a/b;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/runtime/core/g;->a:Ltech/sud/runtime/core/h;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v1}, Ltech/sud/runtime/core/JNIShell;->setLogCallback(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Ltech/sud/runtime/core/g;->a:Ltech/sud/runtime/core/h;

    .line 10
    .line 11
    :cond_0
    if-nez p0, :cond_1

    .line 12
    .line 13
    invoke-static {v1}, Ltech/sud/runtime/core/JNIShell;->setLogCallback(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    new-instance v0, Ltech/sud/runtime/core/h;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/h;-><init>(Ltech/sud/runtime/a/b;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ltech/sud/runtime/core/g;->a:Ltech/sud/runtime/core/h;

    .line 23
    .line 24
    invoke-static {v0}, Ltech/sud/runtime/core/JNIShell;->setLogCallback(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private declared-synchronized i()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->create(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Ltech/sud/runtime/core/g;->c:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 5

    monitor-enter p0

    .line 42
    :try_start_0
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 43
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->destroy(J)V

    .line 44
    iput-wide v2, p0, Ltech/sud/runtime/core/g;->b:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :cond_0
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public a(II)V
    .locals 2

    .line 32
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    invoke-static {v0, v1, p1, p2}, Ltech/sud/runtime/core/JNIShell;->setScreenSize(JII)V

    return-void
.end method

.method public a(IIIF)V
    .locals 7

    .line 36
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 37
    invoke-direct {p0}, Ltech/sud/runtime/core/g;->i()V

    .line 38
    :cond_0
    iput p1, p0, Ltech/sud/runtime/core/g;->d:I

    .line 39
    iput p2, p0, Ltech/sud/runtime/core/g;->e:I

    .line 40
    iget-wide v1, p0, Ltech/sud/runtime/core/g;->c:J

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-static/range {v1 .. v6}, Ltech/sud/runtime/core/JNIShell;->gInitOrResize(JIIIF)V

    return-void
.end method

.method public declared-synchronized a(IIILjava/lang/String;)V
    .locals 6

    monitor-enter p0

    .line 35
    :try_start_0
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Ltech/sud/runtime/core/JNIShell;->call(JIIILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(IILandroid/graphics/Bitmap;II)V
    .locals 7

    .line 41
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Ltech/sud/runtime/core/JNIShell;->gTextBitmap(JIILandroid/graphics/Bitmap;II)V

    return-void
.end method

.method public a(ILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, p1, v0, v0, p2}, Ltech/sud/runtime/core/g;->a(IIILjava/lang/String;)V

    return-void
.end method

.method public a(I[I[F[FD)V
    .locals 8

    .line 29
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide v6, p5

    invoke-static/range {v0 .. v7}, Ltech/sud/runtime/core/JNIShell;->onTouch(JI[I[F[FD)V

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 28
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    invoke-static {v0, v1, p1, p2}, Ltech/sud/runtime/core/JNIShell;->setOption(JLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ltech/sud/runtime/core/b;Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 2

    .line 30
    new-instance v0, Ltech/sud/runtime/component/g/a;

    invoke-direct {v0, p2}, Ltech/sud/runtime/component/g/a;-><init>(Landroid/content/res/AssetManager;)V

    iput-object v0, p0, Ltech/sud/runtime/core/g;->f:Ltech/sud/runtime/component/g/a;

    .line 31
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    invoke-static {v0, v1, p1, p2, p3}, Ltech/sud/runtime/core/JNIShell;->setJNIContext(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public a(ZII)V
    .locals 2

    .line 33
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->b:J

    invoke-static {v0, v1, p1, p2, p3}, Ltech/sud/runtime/core/JNIShell;->setNotchInfo(JZII)V

    return-void
.end method

.method public b()Ltech/sud/runtime/component/g/a;
    .locals 0

    .line 7
    iget-object p0, p0, Ltech/sud/runtime/core/g;->f:Ltech/sud/runtime/component/g/a;

    return-object p0
.end method

.method public b(II)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, p2, v0, v1}, Ltech/sud/runtime/core/g;->a(IIILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/core/g;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/core/g;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->gRender(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->gPause(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->gResume(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ltech/sud/runtime/core/JNIShell;->gDestroy(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Ltech/sud/runtime/core/g;->c:J

    .line 9
    .line 10
    return-void
.end method
