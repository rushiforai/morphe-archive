.class public Ll/ijm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jjm;


# instance fields
.field public final a:Ll/kq70;

.field public final b:Ll/l610;

.field public final c:Ll/ljm;

.field public d:Ll/kjm;

.field public e:Ll/mjm;

.field public f:Ll/y2j;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/gjm;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z


# direct methods
.method public constructor <init>(Ll/l610;Ll/kq70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ijm;->b:Ll/l610;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ijm;->a:Ll/kq70;

    .line 7
    .line 8
    new-instance p1, Ll/ljm;

    .line 9
    .line 10
    sget-object p2, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->DRAWEE:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Ll/ljm;-><init>(Lcom/facebook/fresco/ui/common/ImageRenderingInfra;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/ijm;->c:Ll/ljm;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Ll/ljm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Ll/ljm;->H(Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ijm;->h:Z

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageLoadStatus;->SUCCESS:Lcom/facebook/fresco/ui/common/ImageLoadStatus;

    .line 20
    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ijm;->d()V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p1}, Ll/ljm;->S()Ll/fjm;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/gjm;

    .line 47
    .line 48
    invoke-interface {v0, p1, p2}, Ll/gjm;->b(Ll/fjm;Lcom/facebook/fresco/ui/common/ImageLoadStatus;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    :goto_1
    return-void
.end method

.method public b(Ll/ljm;Lcom/facebook/fresco/ui/common/VisibilityState;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ijm;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/ljm;->S()Ll/fjm;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/gjm;

    .line 37
    .line 38
    invoke-interface {v0, p1, p2}, Ll/gjm;->a(Ll/fjm;Lcom/facebook/fresco/ui/common/VisibilityState;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    return-void
.end method

.method public c(Ll/gjm;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ijm;->a:Ll/kq70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/c7;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/mde;->b()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ll/mde;->b()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/ijm;->c:Ll/ljm;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-virtual {v1, v2}, Ll/ljm;->N(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/ijm;->c:Ll/ljm;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ljm;->M(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijm;->g:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ijm;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/ijm;->g(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ijm;->c:Ll/ljm;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ljm;->w()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ijm;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ijm;->h()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ijm;->e:Ll/mjm;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ijm;->a:Ll/kq70;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/c7;->k(Ll/u36;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/ijm;->f:Ll/y2j;

    .line 18
    .line 19
    if-eqz p1, :cond_3

    .line 20
    .line 21
    iget-object p0, p0, Ll/ijm;->a:Ll/kq70;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/kq70;->h0(Ll/j2d0;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object p1, p0, Ll/ijm;->e:Ll/mjm;

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/ijm;->a:Ll/kq70;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/c7;->R(Ll/u36;)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p1, p0, Ll/ijm;->f:Ll/y2j;

    .line 37
    .line 38
    if-eqz p1, :cond_3

    .line 39
    .line 40
    iget-object p0, p0, Ll/ijm;->a:Ll/kq70;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/kq70;->x0(Ll/j2d0;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    return-void
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ijm;->e:Ll/mjm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/mjm;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ijm;->b:Ll/l610;

    .line 8
    .line 9
    iget-object v2, p0, Ll/ijm;->c:Ll/ljm;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, p0}, Ll/mjm;-><init>(Ll/l610;Ll/ljm;Ll/jjm;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/ijm;->e:Ll/mjm;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/ijm;->d:Ll/kjm;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ll/kjm;

    .line 21
    .line 22
    iget-object v1, p0, Ll/ijm;->b:Ll/l610;

    .line 23
    .line 24
    iget-object v2, p0, Ll/ijm;->c:Ll/ljm;

    .line 25
    .line 26
    invoke-direct {v0, v1, v2}, Ll/kjm;-><init>(Ll/l610;Ll/ljm;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/ijm;->d:Ll/kjm;

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/ijm;->f:Ll/y2j;

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    new-instance v0, Ll/y2j;

    .line 36
    .line 37
    iget-object v1, p0, Ll/ijm;->d:Ll/kjm;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    new-array v2, v2, [Ll/j2d0;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    aput-object v1, v2, v3

    .line 44
    .line 45
    invoke-direct {v0, v2}, Ll/y2j;-><init>([Ll/j2d0;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/ijm;->f:Ll/y2j;

    .line 49
    .line 50
    :cond_2
    return-void
.end method
