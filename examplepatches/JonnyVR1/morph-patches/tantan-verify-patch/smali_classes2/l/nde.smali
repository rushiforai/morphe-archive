.class public Ll/nde;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xem0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DH::",
        "Ll/mde;",
        ">",
        "Ljava/lang/Object;",
        "Ll/xem0;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Ll/mde;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TDH;"
        }
    .end annotation
.end field

.field public e:Ll/lde;

.field public final f:Lcom/facebook/drawee/components/DraweeEventTracker;


# direct methods
.method public constructor <init>(Ll/mde;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDH;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/nde;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/nde;->b:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/nde;->c:Z

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/nde;->e:Ll/lde;

    .line 14
    .line 15
    invoke-static {}, Lcom/facebook/drawee/components/DraweeEventTracker;->a()Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/nde;->p(Ll/mde;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static c(Ll/mde;Landroid/content/Context;)Ll/nde;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<DH::",
            "Ll/mde;",
            ">(TDH;",
            "Landroid/content/Context;",
            ")",
            "Ll/nde<",
            "TDH;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nde;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nde;-><init>(Ll/mde;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/nde;->m(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nde;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 7
    .line 8
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_ATTACH_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/nde;->a:Z

    .line 15
    .line 16
    iget-object v0, p0, Ll/nde;->e:Ll/lde;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ll/lde;->getHierarchy()Ll/mde;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/nde;->e:Ll/lde;

    .line 27
    .line 28
    invoke-interface {p0}, Ll/lde;->d()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nde;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/nde;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/nde;->a()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/nde;->d()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final d()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nde;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 7
    .line 8
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DETACH_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/nde;->a:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/nde;->i()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/nde;->e:Ll/lde;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/lde;->e()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public e()Ll/lde;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nde;->e:Ll/lde;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/mde;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TDH;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nde;->d:Ll/mde;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/mde;

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nde;->c:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DRAWABLE_SHOW:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_DRAWABLE_HIDE:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 14
    .line 15
    :goto_0
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 16
    .line 17
    .line 18
    iput-boolean p1, p0, Ll/nde;->c:Z

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/nde;->b()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public h()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nde;->d:Ll/mde;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/mde;->b()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nde;->e:Ll/lde;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/lde;->getHierarchy()Ll/mde;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/nde;->d:Ll/mde;

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

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

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 2
    .line 3
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_HOLDER_ATTACH:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/nde;->b:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nde;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 2
    .line 3
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_HOLDER_DETACH:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/nde;->b:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nde;->b()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nde;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/nde;->e:Ll/lde;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/lde;->b(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public m(Landroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nde;->o(Ll/lde;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(Ll/lde;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/nde;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nde;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/nde;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 15
    .line 16
    sget-object v2, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_CLEAR_OLD_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/nde;->e:Ll/lde;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-interface {v1, v2}, Ll/lde;->c(Ll/mde;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iput-object p1, p0, Ll/nde;->e:Ll/lde;

    .line 28
    .line 29
    iget-object v1, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 30
    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    sget-object p1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_SET_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 34
    .line 35
    invoke-virtual {v1, p1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/nde;->e:Ll/lde;

    .line 39
    .line 40
    iget-object v1, p0, Ll/nde;->d:Ll/mde;

    .line 41
    .line 42
    invoke-interface {p1, v1}, Ll/lde;->c(Ll/mde;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    sget-object p1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_CLEAR_CONTROLLER:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    if-eqz v0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/nde;->a()V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public onDraw()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/nde;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/nde;->e:Ll/lde;

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Ll/nde;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-class v1, Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 33
    .line 34
    const-string v2, "%x: Draw requested for a non-attached controller %x. %s"

    .line 35
    .line 36
    invoke-static {v1, v2, v0}, Ll/huf;->w(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Ll/nde;->b:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/nde;->c:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/nde;->b()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public p(Ll/mde;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDH;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 2
    .line 3
    sget-object v1, Lcom/facebook/drawee/components/DraweeEventTracker$Event;->ON_SET_HIERARCHY:Lcom/facebook/drawee/components/DraweeEventTracker$Event;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/components/DraweeEventTracker;->b(Lcom/facebook/drawee/components/DraweeEventTracker$Event;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nde;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v1}, Ll/nde;->q(Ll/xem0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/mde;

    .line 21
    .line 22
    iput-object v1, p0, Ll/nde;->d:Ll/mde;

    .line 23
    .line 24
    invoke-interface {v1}, Ll/mde;->b()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v1, 0x0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 40
    :goto_1
    invoke-virtual {p0, v1}, Ll/nde;->g(Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p0}, Ll/nde;->q(Ll/xem0;)V

    .line 44
    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Ll/nde;->e:Ll/lde;

    .line 49
    .line 50
    invoke-interface {p0, p1}, Ll/lde;->c(Ll/mde;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public final q(Ll/xem0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nde;->h()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ll/wem0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/wem0;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/wem0;->d(Ll/xem0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
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
    const-string v1, "controllerAttached"

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/nde;->a:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "holderAttached"

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/nde;->b:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "drawableVisible"

    .line 22
    .line 23
    iget-boolean v2, p0, Ll/nde;->c:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->c(Ljava/lang/String;Z)Ll/i950$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/nde;->f:Lcom/facebook/drawee/components/DraweeEventTracker;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/facebook/drawee/components/DraweeEventTracker;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "events"

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
