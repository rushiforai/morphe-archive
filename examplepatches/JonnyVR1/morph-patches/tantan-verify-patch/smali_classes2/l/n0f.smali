.class public Ll/n0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static n:Z


# instance fields
.field public final a:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/io/FileInputStream;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/him;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:Ll/vr3;

.field public k:Landroid/graphics/ColorSpace;

.field public l:Ljava/lang/String;

.field public m:Z


# direct methods
.method public constructor <init>(Ll/a7h0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ljava/io/FileInputStream;",
            ">;)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    sget-object v0, Ll/him;->c:Ll/him;

    iput-object v0, p0, Ll/n0f;->c:Ll/him;

    const/4 v0, -0x1

    .line 46
    iput v0, p0, Ll/n0f;->d:I

    const/4 v1, 0x0

    .line 47
    iput v1, p0, Ll/n0f;->e:I

    .line 48
    iput v0, p0, Ll/n0f;->f:I

    .line 49
    iput v0, p0, Ll/n0f;->g:I

    const/4 v1, 0x1

    .line 50
    iput v1, p0, Ll/n0f;->h:I

    .line 51
    iput v0, p0, Ll/n0f;->i:I

    .line 52
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Ll/n0f;->a:Ll/fb5;

    .line 54
    iput-object p1, p0, Ll/n0f;->b:Ll/a7h0;

    return-void
.end method

.method public constructor <init>(Ll/a7h0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ljava/io/FileInputStream;",
            ">;I)V"
        }
    .end annotation

    .line 55
    invoke-direct {p0, p1}, Ll/n0f;-><init>(Ll/a7h0;)V

    .line 56
    iput p2, p0, Ll/n0f;->i:I

    return-void
.end method

.method public constructor <init>(Ll/fb5;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/him;->c:Ll/him;

    .line 5
    .line 6
    iput-object v0, p0, Ll/n0f;->c:Ll/him;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/n0f;->d:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Ll/n0f;->e:I

    .line 13
    .line 14
    iput v0, p0, Ll/n0f;->f:I

    .line 15
    .line 16
    iput v0, p0, Ll/n0f;->g:I

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput v1, p0, Ll/n0f;->h:I

    .line 20
    .line 21
    iput v0, p0, Ll/n0f;->i:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/fb5;->m()Ll/fb5;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/n0f;->a:Ll/fb5;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-object p1, p0, Ll/n0f;->b:Ll/a7h0;

    .line 42
    .line 43
    return-void
.end method

.method public static Z(Ll/n0f;)Z
    .locals 1

    .line 1
    iget v0, p0, Ll/n0f;->d:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/n0f;->f:I

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Ll/n0f;->g:I

    .line 10
    .line 11
    if-ltz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static d0(Ll/n0f;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n0f;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static m(Ll/n0f;)Ll/n0f;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n0f;->k()Ll/n0f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public static n(Ll/n0f;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n0f;->close()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public B(I)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/n0f;->t()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/n0f;->M()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    new-array p1, p0, [B

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/facebook/common/memory/PooledByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/fb5;->close()V

    .line 29
    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_1
    const/4 v1, 0x0

    .line 33
    :try_start_1
    invoke-interface {v2, v1, p1, v1, p0}, Lcom/facebook/common/memory/PooledByteBuffer;->p(I[BII)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ll/fb5;->close()V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    mul-int/lit8 v2, p0, 0x2

    .line 42
    .line 43
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    if-ge v1, p0, :cond_2

    .line 47
    .line 48
    aget-byte v2, p1, v1

    .line 49
    .line 50
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v3, "%02X"

    .line 59
    .line 60
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    invoke-virtual {v0}, Ll/fb5;->close()V

    .line 77
    .line 78
    .line 79
    throw p0
.end method

.method public F()Ll/him;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/n0f;->c:Ll/him;

    .line 5
    .line 6
    return-object p0
.end method

.method public H()Ljava/io/InputStream;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n0f;->b:Ll/a7h0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/io/InputStream;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/n0f;->a:Ll/fb5;

    .line 13
    .line 14
    invoke-static {p0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    :try_start_0
    new-instance v0, Ll/gj80;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/gj80;-><init>(Lcom/facebook/common/memory/PooledByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 37
    .line 38
    .line 39
    throw v0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public I()Ljava/io/InputStream;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/io/InputStream;

    .line 10
    .line 11
    return-object p0
.end method

.method public J()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n0f;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public M()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n0f;->a:Ll/fb5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/n0f;->a:Ll/fb5;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/facebook/common/memory/PooledByteBuffer;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    iget p0, p0, Ll/n0f;->i:I

    .line 25
    .line 26
    return p0
.end method

.method public N()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0f;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/n0f;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public final S()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jim;->d(Ljava/io/InputStream;)Ll/him;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/n0f;->c:Ll/him;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ppd;->b(Ll/him;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n0f;->j0()Lkotlin/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/n0f;->i0()Ll/ajm;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/ajm;->b()Lkotlin/Pair;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    :goto_0
    sget-object v2, Ll/ppd;->a:Ll/him;

    .line 31
    .line 32
    const/4 v3, -0x1

    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    iget v2, p0, Ll/n0f;->d:I

    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ll/uoq;->b(Ljava/io/InputStream;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/n0f;->e:I

    .line 50
    .line 51
    invoke-static {v0}, Ll/uoq;->a(I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Ll/n0f;->d:I

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    sget-object v1, Ll/ppd;->k:Ll/him;

    .line 59
    .line 60
    if-ne v0, v1, :cond_2

    .line 61
    .line 62
    iget v0, p0, Ll/n0f;->d:I

    .line 63
    .line 64
    if-ne v0, v3, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Ll/j1l;->a(Ljava/io/InputStream;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Ll/n0f;->e:I

    .line 75
    .line 76
    invoke-static {v0}, Ll/uoq;->a(I)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Ll/n0f;->d:I

    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget v0, p0, Ll/n0f;->d:I

    .line 84
    .line 85
    if-ne v0, v3, :cond_3

    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    iput v0, p0, Ll/n0f;->d:I

    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method public U(I)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n0f;->c:Ll/him;

    .line 2
    .line 3
    sget-object v1, Ll/ppd;->a:Ll/him;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/ppd;->l:Ll/him;

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget-object v0, p0, Ll/n0f;->b:Ll/a7h0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    return v2

    .line 18
    :cond_1
    iget-object v0, p0, Ll/n0f;->a:Ll/fb5;

    .line 19
    .line 20
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/n0f;->a:Ll/fb5;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    const/4 v1, 0x2

    .line 33
    if-ge p1, v1, :cond_2

    .line 34
    .line 35
    return v0

    .line 36
    :cond_2
    add-int/lit8 v1, p1, -0x2

    .line 37
    .line 38
    invoke-interface {p0, v1}, Lcom/facebook/common/memory/PooledByteBuffer;->r(I)B

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v3, -0x1

    .line 43
    if-ne v1, v3, :cond_3

    .line 44
    .line 45
    sub-int/2addr p1, v2

    .line 46
    invoke-interface {p0, p1}, Lcom/facebook/common/memory/PooledByteBuffer;->r(I)B

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    const/16 p1, -0x27

    .line 51
    .line 52
    if-ne p0, p1, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :cond_3
    return v0
.end method

.method public V()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/n0f;->d:I

    .line 5
    .line 6
    return p0
.end method

.method public declared-synchronized a0()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/n0f;->a:Ll/fb5;

    .line 3
    .line 4
    invoke-static {v0}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/n0f;->b:Ll/a7h0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    goto :goto_1

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_2

    .line 19
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 20
    :goto_1
    monitor-exit p0

    .line 21
    return v0

    .line 22
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0f;->a:Ll/fb5;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/n0f;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n0f;->S()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean v0, p0, Ll/n0f;->m:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    invoke-virtual {p0}, Ll/n0f;->S()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/n0f;->m:Z

    .line 19
    .line 20
    return-void
.end method

.method public getHeight()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/n0f;->g:I

    .line 5
    .line 6
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/n0f;->f:I

    .line 5
    .line 6
    return p0
.end method

.method public final h0()V
    .locals 1

    .line 1
    iget v0, p0, Ll/n0f;->f:I

    .line 2
    .line 3
    if-ltz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/n0f;->g:I

    .line 6
    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/n0f;->e0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i0()Ll/ajm;
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    invoke-static {v0}, Ll/j33;->d(Ljava/io/InputStream;)Ll/ajm;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/ajm;->a()Landroid/graphics/ColorSpace;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iput-object v2, p0, Ll/n0f;->k:Landroid/graphics/ColorSpace;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/ajm;->b()Lkotlin/Pair;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iput v3, p0, Ll/n0f;->f:I

    .line 32
    .line 33
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iput v2, p0, Ll/n0f;->g:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 49
    .line 50
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    .line 52
    .line 53
    :catch_0
    :cond_1
    return-object v1

    .line 54
    :catchall_1
    move-exception p0

    .line 55
    const/4 v0, 0x0

    .line 56
    :goto_1
    if-eqz v0, :cond_2

    .line 57
    .line 58
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 59
    .line 60
    .line 61
    :catch_1
    :cond_2
    throw p0
.end method

.method public final j0()Lkotlin/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/n0f;->H()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {v0}, Ll/wup0;->f(Ljava/io/InputStream;)Lkotlin/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, p0, Ll/n0f;->f:I

    .line 26
    .line 27
    invoke-virtual {v0}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Ll/n0f;->g:I

    .line 38
    .line 39
    :cond_1
    return-object v0
.end method

.method public k()Ll/n0f;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n0f;->b:Ll/a7h0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/n0f;

    .line 6
    .line 7
    iget v2, p0, Ll/n0f;->i:I

    .line 8
    .line 9
    invoke-direct {v1, v0, v2}, Ll/n0f;-><init>(Ll/a7h0;I)V

    .line 10
    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/n0f;->a:Ll/fb5;

    .line 14
    .line 15
    invoke-static {v0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    :try_start_0
    new-instance v1, Ll/n0f;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 29
    .line 30
    .line 31
    :goto_1
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ll/n0f;->q(Ll/n0f;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-object v1

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 39
    .line 40
    .line 41
    throw p0
.end method

.method public k0(Ll/vr3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n0f;->j:Ll/vr3;

    .line 2
    .line 3
    return-void
.end method

.method public l0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n0f;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public m0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n0f;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public n0(Ll/him;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n0f;->c:Ll/him;

    .line 2
    .line 3
    return-void
.end method

.method public o0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n0f;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public p0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n0f;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public q(Ll/n0f;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/n0f;->c:Ll/him;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/n0f;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/n0f;->f:I

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/n0f;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Ll/n0f;->g:I

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/n0f;->V()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/n0f;->d:I

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/n0f;->x()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/n0f;->e:I

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/n0f;->J()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/n0f;->h:I

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/n0f;->M()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/n0f;->i:I

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/n0f;->u()Ll/vr3;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/n0f;->j:Ll/vr3;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/n0f;->v()Landroid/graphics/ColorSpace;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/n0f;->k:Landroid/graphics/ColorSpace;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/n0f;->Q()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iput-boolean p1, p0, Ll/n0f;->m:Z

    .line 60
    .line 61
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n0f;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public r0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n0f;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public t()Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n0f;->a:Ll/fb5;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public u()Ll/vr3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0f;->j:Ll/vr3;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Landroid/graphics/ColorSpace;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/n0f;->k:Landroid/graphics/ColorSpace;

    .line 5
    .line 6
    return-object p0
.end method

.method public x()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n0f;->h0()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/n0f;->e:I

    .line 5
    .line 6
    return p0
.end method
