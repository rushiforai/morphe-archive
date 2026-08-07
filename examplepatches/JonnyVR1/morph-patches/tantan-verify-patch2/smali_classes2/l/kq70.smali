.class public Ll/kq70;
.super Ll/c7;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/c7<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/qim;",
        ">;"
    }
.end annotation


# static fields
.field public static final M:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field public final A:Ll/rce;

.field public final B:Lcom/facebook/common/internal/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;"
        }
    .end annotation
.end field

.field public final C:Ll/mpy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ll/by3;

.field public E:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public F:Z

.field public G:Lcom/facebook/common/internal/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;"
        }
    .end annotation
.end field

.field public H:Ll/ijm;

.field public I:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/j2d0;",
            ">;"
        }
    .end annotation
.end field

.field public J:Lcom/facebook/imagepipeline/request/ImageRequest;

.field public K:[Lcom/facebook/imagepipeline/request/ImageRequest;

.field public L:Lcom/facebook/imagepipeline/request/ImageRequest;

.field public final z:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Ll/kq70;

    .line 2
    .line 3
    sput-object v0, Ll/kq70;->M:Ljava/lang/Class;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Ll/ytd;Ll/rce;Ljava/util/concurrent/Executor;Ll/mpy;Lcom/facebook/common/internal/ImmutableList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ll/ytd;",
            "Ll/rce;",
            "Ljava/util/concurrent/Executor;",
            "Ll/mpy<",
            "Ll/by3;",
            "Ll/db5;",
            ">;",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p2, p4, v0, v0}, Ll/c7;-><init>(Ll/ytd;Ljava/util/concurrent/Executor;Ljava/lang/String;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/kq70;->z:Landroid/content/res/Resources;

    .line 6
    .line 7
    new-instance p2, Ll/aod;

    .line 8
    .line 9
    invoke-direct {p2, p1, p3}, Ll/aod;-><init>(Landroid/content/res/Resources;Ll/rce;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/kq70;->A:Ll/rce;

    .line 13
    .line 14
    iput-object p6, p0, Ll/kq70;->B:Lcom/facebook/common/internal/ImmutableList;

    .line 15
    .line 16
    iput-object p5, p0, Ll/kq70;->C:Ll/mpy;

    .line 17
    .line 18
    return-void
.end method

.method public static j0(Landroid/graphics/drawable/Drawable;)Ll/x0e0;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    instance-of v1, p0, Ll/x0e0;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p0, Ll/x0e0;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    instance-of v1, p0, Ll/uce;

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    check-cast p0, Ll/uce;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/uce;->i()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/kq70;->j0(Landroid/graphics/drawable/Drawable;)Ll/x0e0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_2
    instance-of v1, p0, Ll/g01;

    .line 28
    .line 29
    if-eqz v1, :cond_4

    .line 30
    .line 31
    check-cast p0, Ll/g01;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/g01;->d()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    :goto_0
    if-ge v2, v1, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ll/g01;->b(I)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-static {v3}, Ll/kq70;->j0(Landroid/graphics/drawable/Drawable;)Ll/x0e0;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    if-eqz v3, :cond_3

    .line 49
    .line 50
    return-object v3

    .line 51
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_4
    return-object v0
.end method


# virtual methods
.method public A0(Ll/db5;Ll/o9c;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/c7;->u()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p2, v0}, Ll/o9c;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/c7;->getHierarchy()Ll/mde;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ll/mde;->b()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/kq70;->j0(Landroid/graphics/drawable/Drawable;)Ll/x0e0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/x0e0;->v()Ll/h1e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :cond_0
    invoke-virtual {p2, v1}, Ll/o9c;->m(Ll/h1e0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/kq70;->l0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const-string v0, "cc"

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0}, Ll/o9c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    if-eqz p1, :cond_2

    .line 44
    .line 45
    invoke-interface {p1}, Ll/db5;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-interface {p1}, Ll/db5;->getHeight()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p2, p0, v0}, Ll/o9c;->k(II)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1}, Ll/db5;->getSizeInBytes()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {p2, p0}, Ll/o9c;->l(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    invoke-virtual {p2}, Ll/o9c;->i()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public bridge synthetic J(Ljava/lang/Object;)Ljava/util/Map;
    .locals 0

    .line 1
    check-cast p1, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kq70;->u0(Ll/qim;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic L(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kq70;->v0(Ljava/lang/String;Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    instance-of p0, p1, Ll/hde;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/hde;

    .line 6
    .line 7
    invoke-interface {p1}, Ll/hde;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic Q(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kq70;->w0(Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/mde;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/c7;->c(Ll/mde;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Ll/kq70;->t0(Ll/db5;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized h0(Ll/j2d0;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kq70;->I:Ljava/util/Set;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/kq70;->I:Ljava/util/Set;

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
    iget-object v0, p0, Ll/kq70;->I:Ljava/util/Set;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
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
    throw p1
.end method

.method public i0(Ll/fb5;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation

    .line 1
    const-string v0, "Unrecognized image class: "

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "PipelineDraweeController#createDrawable"

    .line 10
    .line 11
    invoke-static {v1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ll/wn80;->i(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ll/db5;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/kq70;->t0(Ll/db5;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/kq70;->G:Lcom/facebook/common/internal/ImmutableList;

    .line 31
    .line 32
    invoke-virtual {p0, v1, p1}, Ll/kq70;->s0(Lcom/facebook/common/internal/ImmutableList;Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/i9j;->d()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    invoke-static {}, Ll/i9j;->b()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-object v1

    .line 48
    :cond_2
    :try_start_1
    iget-object v1, p0, Ll/kq70;->B:Lcom/facebook/common/internal/ImmutableList;

    .line 49
    .line 50
    invoke-virtual {p0, v1, p1}, Ll/kq70;->s0(Lcom/facebook/common/internal/ImmutableList;Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    invoke-static {}, Ll/i9j;->d()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    invoke-static {}, Ll/i9j;->b()V

    .line 63
    .line 64
    .line 65
    :cond_3
    return-object v1

    .line 66
    :cond_4
    :try_start_2
    iget-object p0, p0, Ll/kq70;->A:Ll/rce;

    .line 67
    .line 68
    invoke-interface {p0, p1}, Ll/rce;->b(Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    invoke-static {}, Ll/i9j;->d()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_5

    .line 79
    .line 80
    invoke-static {}, Ll/i9j;->b()V

    .line 81
    .line 82
    .line 83
    :cond_5
    return-object p0

    .line 84
    :cond_6
    :try_start_3
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 85
    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 102
    :catchall_0
    move-exception p0

    .line 103
    invoke-static {}, Ll/i9j;->d()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_7

    .line 108
    .line 109
    invoke-static {}, Ll/i9j;->b()V

    .line 110
    .line 111
    .line 112
    :cond_7
    throw p0
.end method

.method public k0()Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "PipelineDraweeController#getCachedImage"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/kq70;->C:Ll/mpy;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_5

    .line 16
    .line 17
    iget-object p0, p0, Ll/kq70;->D:Ll/by3;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-interface {v0, p0}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/db5;

    .line 33
    .line 34
    invoke-interface {v0}, Ll/db5;->Y()Ll/qvb0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Ll/qvb0;->a()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/fb5;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/i9j;->d()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-static {}, Ll/i9j;->b()V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-object v1

    .line 57
    :cond_3
    invoke-static {}, Ll/i9j;->d()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-static {}, Ll/i9j;->b()V

    .line 64
    .line 65
    .line 66
    :cond_4
    return-object p0

    .line 67
    :cond_5
    :goto_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    invoke-static {}, Ll/i9j;->b()V

    .line 74
    .line 75
    .line 76
    :cond_6
    return-object v1

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    invoke-static {}, Ll/i9j;->d()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_7

    .line 83
    .line 84
    invoke-static {}, Ll/i9j;->b()V

    .line 85
    .line 86
    .line 87
    :cond_7
    throw p0
.end method

.method public bridge synthetic l(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kq70;->i0(Ll/fb5;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l0()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c7;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic m()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kq70;->k0()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m0(Ll/fb5;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)I"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/fb5;->M()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public n0(Ll/fb5;)Ll/qim;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)",
            "Ll/qim;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ll/wn80;->i(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/db5;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/db5;->G()Ll/qim;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public declared-synchronized o0()Ll/j2d0;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kq70;->I:Ljava/util/Set;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-instance v1, Ll/y2j;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/y2j;-><init>(Ljava/util/Set;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-object v1

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    monitor-exit p0

    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public final p0(Ll/a7h0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kq70;->E:Ll/a7h0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/kq70;->t0(Ll/db5;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q0(Ll/a7h0;Ljava/lang/String;Ll/by3;Ljava/lang/Object;Lcom/facebook/common/internal/ImmutableList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;>;",
            "Ljava/lang/String;",
            "Ll/by3;",
            "Ljava/lang/Object;",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "PipelineDraweeController#initialize"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-super {p0, p2, p4}, Ll/c7;->C(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/kq70;->p0(Ll/a7h0;)V

    .line 16
    .line 17
    .line 18
    iput-object p3, p0, Ll/kq70;->D:Ll/by3;

    .line 19
    .line 20
    invoke-virtual {p0, p5}, Ll/kq70;->y0(Lcom/facebook/common/internal/ImmutableList;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Ll/kq70;->t0(Ll/db5;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/i9j;->d()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/i9j;->b()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public r()Ll/i6c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/i6c<",
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "PipelineDraweeController#getDataSource"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x2

    .line 13
    invoke-static {v0}, Ll/huf;->m(I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Ll/kq70;->M:Ljava/lang/Class;

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "controller %x: getDataSource"

    .line 30
    .line 31
    invoke-static {v0, v2, v1}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ll/kq70;->E:Ll/a7h0;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/i6c;

    .line 41
    .line 42
    invoke-static {}, Ll/i9j;->d()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-static {}, Ll/i9j;->b()V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-object p0
.end method

.method public declared-synchronized r0(Ll/gjm;Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gjm;",
            "Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder<",
            "Ll/lq70;",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ll/fb5<",
            "Ll/db5;",
            ">;",
            "Ll/qim;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kq70;->H:Ll/ijm;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ijm;->f()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    if-eqz p1, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/kq70;->H:Ll/ijm;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ll/ijm;

    .line 19
    .line 20
    invoke-static {}, Lcom/facebook/common/time/AwakeTimeSinceBootClock;->get()Lcom/facebook/common/time/AwakeTimeSinceBootClock;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1, p0}, Ll/ijm;-><init>(Ll/l610;Ll/kq70;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/kq70;->H:Ll/ijm;

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Ll/kq70;->H:Ll/ijm;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/ijm;->c(Ll/gjm;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/kq70;->H:Ll/ijm;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Ll/ijm;->g(Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-virtual {p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->n()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 45
    .line 46
    iput-object p1, p0, Ll/kq70;->J:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->m()[Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, [Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 53
    .line 54
    iput-object p1, p0, Ll/kq70;->K:[Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->o()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 61
    .line 62
    iput-object p1, p0, Ll/kq70;->L:Lcom/facebook/imagepipeline/request/ImageRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    monitor-exit p0

    .line 65
    return-void

    .line 66
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    throw p1
.end method

.method public final s0(Lcom/facebook/common/internal/ImmutableList;Ll/db5;)Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;",
            "Ll/db5;",
            ")",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/rce;

    .line 20
    .line 21
    invoke-interface {v0, p2}, Ll/rce;->a(Ll/db5;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0, p2}, Ll/rce;->b(Ll/db5;)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_2
    return-object p0
.end method

.method public final t0(Ll/db5;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/kq70;->F:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/c7;->q()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/o9c;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/o9c;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/yim;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/yim;-><init>(Ll/zim;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/c7;->j(Ll/v36;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/c7;->Z(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/c7;->q()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Ll/o9c;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/c7;->q()Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/o9c;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0}, Ll/kq70;->A0(Ll/db5;Ll/o9c;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/i950;->b(Ljava/lang/Object;)Ll/i950$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "super"

    .line 6
    .line 7
    invoke-super {p0}, Ll/c7;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "dataSourceSupplier"

    .line 16
    .line 17
    iget-object p0, p0, Ll/kq70;->E:Ll/a7h0;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public u0(Ll/qim;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qim;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-interface {p1}, Ll/nyk;->getExtras()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public v0(Ljava/lang/String;Ll/fb5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/c7;->L(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw p1
.end method

.method public bridge synthetic w(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kq70;->m0(Ll/fb5;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public w0(Ll/fb5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic x(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kq70;->n0(Ll/fb5;)Ll/qim;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public declared-synchronized x0(Ll/j2d0;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kq70;->I:Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 15
    throw p1
.end method

.method public y()Landroid/net/Uri;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kq70;->J:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kq70;->L:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 4
    .line 5
    iget-object p0, p0, Ll/kq70;->K:[Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    sget-object v2, Lcom/facebook/imagepipeline/request/ImageRequest;->A:Ll/bwi;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, v2}, Ll/hu10;->a(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;Ll/bwi;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public y0(Lcom/facebook/common/internal/ImmutableList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/internal/ImmutableList<",
            "Ll/rce;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kq70;->G:Lcom/facebook/common/internal/ImmutableList;

    .line 2
    .line 3
    return-void
.end method

.method public z0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/kq70;->F:Z

    .line 2
    .line 3
    return-void
.end method
