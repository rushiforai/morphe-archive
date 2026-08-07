.class public Ll/bi2;
.super Ll/ai2;
.source "SourceFile"

# interfaces
.implements Ll/ib5;


# static fields
.field public static i:Z


# instance fields
.field public d:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public volatile e:Landroid/graphics/Bitmap;

.field public final f:Ll/qvb0;

.field public final g:I

.field public final h:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Ll/w4d0;Ll/qvb0;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ll/w4d0<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ai2;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/graphics/Bitmap;

    .line 9
    .line 10
    iput-object p1, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget-object p1, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-static {p2}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Ll/w4d0;

    .line 19
    .line 20
    invoke-static {p1, p2}, Ll/fb5;->Z(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/bi2;->d:Ll/fb5;

    .line 25
    .line 26
    iput-object p3, p0, Ll/bi2;->f:Ll/qvb0;

    .line 27
    .line 28
    iput p4, p0, Ll/bi2;->g:I

    .line 29
    .line 30
    iput p5, p0, Ll/bi2;->h:I

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Ll/fb5;Ll/qvb0;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ll/qvb0;",
            "II)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ll/ai2;-><init>()V

    .line 34
    invoke-virtual {p1}, Ll/fb5;->q()Ll/fb5;

    move-result-object p1

    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/fb5;

    iput-object p1, p0, Ll/bi2;->d:Ll/fb5;

    .line 35
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 36
    iput-object p2, p0, Ll/bi2;->f:Ll/qvb0;

    .line 37
    iput p3, p0, Ll/bi2;->g:I

    .line 38
    iput p4, p0, Ll/bi2;->h:I

    return-void
.end method

.method public static M(Landroid/graphics/Bitmap;)I
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static N(Landroid/graphics/Bitmap;)I
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static Q()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/bi2;->i:Z

    .line 2
    .line 3
    return v0
.end method


# virtual methods
.method public final declared-synchronized J()Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/bi2;->d:Ll/fb5;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Ll/bi2;->d:Ll/fb5;

    .line 6
    .line 7
    iput-object v1, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-object v0

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

.method public V()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bi2;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public Y()Ll/qvb0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bi2;->f:Ll/qvb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b0()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bi2;->J()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fb5;->close()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getHeight()I
    .locals 2

    .line 1
    iget v0, p0, Ll/bi2;->g:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Ll/bi2;->h:I

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x7

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-static {p0}, Ll/bi2;->M(Landroid/graphics/Bitmap;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-static {p0}, Ll/bi2;->N(Landroid/graphics/Bitmap;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public getSizeInBytes()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-static {p0}, Ll/j33;->i(Landroid/graphics/Bitmap;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWidth()I
    .locals 2

    .line 1
    iget v0, p0, Ll/bi2;->g:I

    .line 2
    .line 3
    rem-int/lit16 v0, v0, 0xb4

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Ll/bi2;->h:I

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x7

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-static {p0}, Ll/bi2;->N(Landroid/graphics/Bitmap;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/bi2;->e:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-static {p0}, Ll/bi2;->M(Landroid/graphics/Bitmap;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public declared-synchronized isClosed()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/bi2;->d:Ll/fb5;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
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

.method public declared-synchronized s()Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/bi2;->d:Ll/fb5;

    .line 3
    .line 4
    invoke-static {v0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 5
    .line 6
    .line 7
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public x()I
    .locals 0

    .line 1
    iget p0, p0, Ll/bi2;->h:I

    .line 2
    .line 3
    return p0
.end method
