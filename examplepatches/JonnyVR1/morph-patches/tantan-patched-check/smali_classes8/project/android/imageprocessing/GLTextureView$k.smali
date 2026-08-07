.class Lproject/android/imageprocessing/GLTextureView$k;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lproject/android/imageprocessing/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "k"
.end annotation


# instance fields
.field private a:Z

.field private b:I

.field private c:Z

.field private d:Z

.field private e:Z

.field private f:Lproject/android/imageprocessing/GLTextureView$j;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lproject/android/imageprocessing/GLTextureView$a;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView$k;-><init>()V

    return-void
.end method

.method private b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->d:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->a:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized a(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->c:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView$k;->b()V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x1f01

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->b:I

    .line 16
    .line 17
    const/high16 v1, 0x20000

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    const-string v0, "Q3Dimension MSM7500 "

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    xor-int/2addr p1, v2

    .line 29
    iput-boolean p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->d:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    iget-boolean p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->d:Z

    .line 38
    .line 39
    xor-int/2addr p1, v2

    .line 40
    iput-boolean p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->e:Z

    .line 41
    .line 42
    iput-boolean v2, p0, Lproject/android/imageprocessing/GLTextureView$k;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    :cond_1
    monitor-exit p0

    .line 45
    return-void

    .line 46
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw p1
.end method

.method public c(Lproject/android/imageprocessing/GLTextureView$j;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public declared-synchronized d()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized e()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView$k;->b()V

    .line 3
    .line 4
    .line 5
    iget-boolean v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return v0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw v0
.end method

.method public declared-synchronized f(Lproject/android/imageprocessing/GLTextureView$j;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    invoke-static {p1, v0}, Lproject/android/imageprocessing/GLTextureView$j;->b(Lproject/android/imageprocessing/GLTextureView$j;Z)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 7
    .line 8
    if-ne v0, p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public g(Lproject/android/imageprocessing/GLTextureView$j;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, p1, :cond_3

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-direct {p0}, Lproject/android/imageprocessing/GLTextureView$k;->b()V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->d:Z

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    iget-object p0, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lproject/android/imageprocessing/GLTextureView$j;->h()V

    .line 22
    .line 23
    .line 24
    :cond_2
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_3
    :goto_0
    iput-object p1, p0, Lproject/android/imageprocessing/GLTextureView$k;->f:Lproject/android/imageprocessing/GLTextureView$j;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 29
    .line 30
    .line 31
    return v1
.end method
