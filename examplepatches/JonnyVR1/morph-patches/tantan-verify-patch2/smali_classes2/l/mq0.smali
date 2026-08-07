.class public Ll/mq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lq0;


# static fields
.field public static e:Ll/kq0;

.field public static f:Ll/kq0;


# instance fields
.field public final a:Ll/bq0;

.field public final b:Ll/xc80;

.field public final c:Z

.field public final d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "com.facebook.animated.gif.GifImage"

    .line 2
    .line 3
    invoke-static {v0}, Ll/mq0;->g(Ljava/lang/String;)Ll/kq0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/mq0;->e:Ll/kq0;

    .line 8
    .line 9
    const-string v0, "com.facebook.animated.webp.WebPImage"

    .line 10
    .line 11
    invoke-static {v0}, Ll/mq0;->g(Ljava/lang/String;)Ll/kq0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/mq0;->f:Ll/kq0;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Ll/bq0;Ll/xc80;Z)V
    .locals 1

    const/4 v0, 0x1

    .line 13
    invoke-direct {p0, p1, p2, p3, v0}, Ll/mq0;-><init>(Ll/bq0;Ll/xc80;ZZ)V

    return-void
.end method

.method public constructor <init>(Ll/bq0;Ll/xc80;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mq0;->a:Ll/bq0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mq0;->b:Ll/xc80;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/mq0;->c:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/mq0;->d:Z

    .line 11
    .line 12
    return-void
.end method

.method public static g(Ljava/lang/String;)Ll/kq0;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/kq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :catchall_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method


# virtual methods
.method public a(Ll/n0f;Ll/phm;Landroid/graphics/Bitmap$Config;)Ll/db5;
    .locals 5

    .line 1
    sget-object v0, Ll/mq0;->f:Ll/kq0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/n0f;->t()Ll/fb5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 17
    .line 18
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget-object v2, Ll/mq0;->f:Ll/kq0;

    .line 25
    .line 26
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v2, v1, p2}, Ll/kq0;->decodeFromByteBuffer(Ljava/nio/ByteBuffer;Ll/phm;)Ll/jq0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    sget-object v2, Ll/mq0;->f:Ll/kq0;

    .line 38
    .line 39
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-interface {v2, v3, v4, v1, p2}, Ll/kq0;->decodeFromNativeMemory(JILl/phm;)Ll/jq0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-virtual {p1}, Ll/n0f;->N()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1, p2, v1, p3}, Ll/mq0;->f(Ljava/lang/String;Ll/phm;Ll/jq0;Landroid/graphics/Bitmap$Config;)Ll/db5;

    .line 56
    .line 57
    .line 58
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :goto_1
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 64
    .line 65
    .line 66
    throw p0

    .line 67
    :cond_1
    const-string p0, "To encode animated webp please add the dependency to the animated-webp module"

    .line 68
    .line 69
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method public b(Ll/n0f;Ll/phm;Landroid/graphics/Bitmap$Config;)Ll/db5;
    .locals 5

    .line 1
    sget-object v0, Ll/mq0;->e:Ll/kq0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/n0f;->t()Ll/fb5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 17
    .line 18
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget-object v2, Ll/mq0;->e:Ll/kq0;

    .line 25
    .line 26
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->getByteBuffer()Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v2, v1, p2}, Ll/kq0;->decodeFromByteBuffer(Ljava/nio/ByteBuffer;Ll/phm;)Ll/jq0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    sget-object v2, Ll/mq0;->e:Ll/kq0;

    .line 38
    .line 39
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-interface {v2, v3, v4, v1, p2}, Ll/kq0;->decodeFromNativeMemory(JILl/phm;)Ll/jq0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-virtual {p1}, Ll/n0f;->N()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1, p2, v1, p3}, Ll/mq0;->f(Ljava/lang/String;Ll/phm;Ll/jq0;Landroid/graphics/Bitmap$Config;)Ll/db5;

    .line 56
    .line 57
    .line 58
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 60
    .line 61
    .line 62
    return-object p0

    .line 63
    :goto_1
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 64
    .line 65
    .line 66
    throw p0

    .line 67
    :cond_1
    const-string p0, "To encode animated gif please add the dependency to the animated-gif module"

    .line 68
    .line 69
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0
.end method

.method public final c(IILandroid/graphics/Bitmap$Config;)Ll/fb5;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/graphics/Bitmap$Config;",
            ")",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mq0;->b:Ll/xc80;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/xc80;->d(IILandroid/graphics/Bitmap$Config;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/graphics/Bitmap;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/graphics/Bitmap;

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public final d(Ll/jq0;Landroid/graphics/Bitmap$Config;I)Ll/fb5;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jq0;",
            "Landroid/graphics/Bitmap$Config;",
            "I)",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/jq0;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-interface {p1}, Ll/jq0;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1, p2}, Ll/mq0;->c(IILandroid/graphics/Bitmap$Config;)Ll/fb5;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p1}, Ll/oq0;->b(Ll/jq0;)Ll/oq0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/mq0;->a:Ll/bq0;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {v0, p1, v1}, Ll/bq0;->a(Ll/oq0;Landroid/graphics/Rect;)Ll/xp0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;

    .line 25
    .line 26
    iget-boolean v1, p0, Ll/mq0;->c:Z

    .line 27
    .line 28
    new-instance v2, Ll/mq0$a;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/mq0$a;-><init>(Ll/mq0;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {v0, p1, v1, v2}, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;-><init>(Ll/xp0;ZLcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor$b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Landroid/graphics/Bitmap;

    .line 41
    .line 42
    invoke-virtual {v0, p3, p0}, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;->h(ILandroid/graphics/Bitmap;)V

    .line 43
    .line 44
    .line 45
    return-object p2
.end method

.method public final e(Ll/jq0;Landroid/graphics/Bitmap$Config;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jq0;",
            "Landroid/graphics/Bitmap$Config;",
            ")",
            "Ljava/util/List<",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/oq0;->b(Ll/jq0;)Ll/oq0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/mq0;->a:Ll/bq0;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, p1, v1}, Ll/bq0;->a(Ll/oq0;Landroid/graphics/Rect;)Ll/xp0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-interface {p1}, Ll/xp0;->getFrameCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;

    .line 22
    .line 23
    iget-boolean v2, p0, Ll/mq0;->c:Z

    .line 24
    .line 25
    new-instance v3, Ll/mq0$b;

    .line 26
    .line 27
    invoke-direct {v3, p0, v0}, Ll/mq0$b;-><init>(Ll/mq0;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v1, p1, v2, v3}, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;-><init>(Ll/xp0;ZLcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor$b;)V

    .line 31
    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    invoke-interface {p1}, Ll/xp0;->getFrameCount()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-ge v2, v3, :cond_0

    .line 39
    .line 40
    invoke-interface {p1}, Ll/xp0;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-interface {p1}, Ll/xp0;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    invoke-virtual {p0, v3, v4, p2}, Ll/mq0;->c(IILandroid/graphics/Bitmap$Config;)Ll/fb5;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ll/fb5;->B()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Landroid/graphics/Bitmap;

    .line 57
    .line 58
    invoke-virtual {v1, v2, v4}, Lcom/facebook/imagepipeline/animated/impl/AnimatedImageCompositor;->h(ILandroid/graphics/Bitmap;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    return-object v0
.end method

.method public final f(Ljava/lang/String;Ll/phm;Ll/jq0;Landroid/graphics/Bitmap$Config;)Ll/db5;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-boolean v1, p2, Ll/phm;->d:Z

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-interface {p3}, Ll/jq0;->getFrameCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/lit8 v1, v1, -0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    move-object v2, v0

    .line 16
    goto :goto_3

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    iget-boolean v3, p2, Ll/phm;->g:Z

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p3, p4, v1}, Ll/mq0;->d(Ll/jq0;Landroid/graphics/Bitmap$Config;I)Ll/fb5;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object p1, Ll/anm;->d:Ll/qvb0;

    .line 27
    .line 28
    invoke-static {p0, p1, v2}, Ll/ib5;->z(Ll/fb5;Ll/qvb0;I)Ll/ib5;

    .line 29
    .line 30
    .line 31
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    :try_start_1
    iget-boolean v2, p2, Ll/phm;->f:Z

    .line 40
    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, p3, p4}, Ll/mq0;->e(Ll/jq0;Landroid/graphics/Bitmap$Config;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    :try_start_2
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Ll/fb5;

    .line 52
    .line 53
    invoke-static {v3}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 54
    .line 55
    .line 56
    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 57
    goto :goto_1

    .line 58
    :catchall_1
    move-exception p0

    .line 59
    goto :goto_3

    .line 60
    :cond_2
    move-object v2, v0

    .line 61
    move-object v3, v2

    .line 62
    :goto_1
    :try_start_3
    iget-boolean p2, p2, Ll/phm;->c:Z

    .line 63
    .line 64
    if-eqz p2, :cond_3

    .line 65
    .line 66
    if-nez v3, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, p3, p4, v1}, Ll/mq0;->d(Ll/jq0;Landroid/graphics/Bitmap$Config;I)Ll/fb5;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    goto :goto_2

    .line 73
    :catchall_2
    move-exception p0

    .line 74
    move-object v0, v3

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    :goto_2
    invoke-static {p3}, Ll/oq0;->f(Ll/jq0;)Ll/pq0;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p2, v3}, Ll/pq0;->k(Ll/fb5;)Ll/pq0;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p2, v1}, Ll/pq0;->j(I)Ll/pq0;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p2, v2}, Ll/pq0;->i(Ljava/util/List;)Ll/pq0;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p2, v0}, Ll/pq0;->h(Ll/f33;)Ll/pq0;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, p1}, Ll/pq0;->l(Ljava/lang/String;)Ll/pq0;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/pq0;->a()Ll/oq0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance p2, Ll/za5;

    .line 105
    .line 106
    iget-boolean p0, p0, Ll/mq0;->d:Z

    .line 107
    .line 108
    invoke-direct {p2, p1, p0}, Ll/za5;-><init>(Ll/oq0;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 109
    .line 110
    .line 111
    invoke-static {v3}, Ll/fb5;->v(Ll/fb5;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v2}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 115
    .line 116
    .line 117
    return-object p2

    .line 118
    :goto_3
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v2}, Ll/fb5;->u(Ljava/lang/Iterable;)V

    .line 122
    .line 123
    .line 124
    throw p0
.end method
