.class Ll/qt2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ckm$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qt2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/qt2;


# direct methods
.method public constructor <init>(Ll/qt2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    const-string v0, "Invalid parameter, add target failed ! "

    .line 4
    .line 5
    const-string v1, "mediaRender"

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    check-cast p1, [Ljava/lang/Object;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget-object v2, p1, v2

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    aget-object v3, p1, v3

    .line 20
    .line 21
    check-cast v3, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x2

    .line 28
    aget-object p1, p1, v4

    .line 29
    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 43
    .line 44
    invoke-virtual {p0, v2, v3, p1}, Ll/qt2;->c(Ljava/lang/Object;IZ)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public b(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->g()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Landroid/os/Message;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/qt2;->w(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public d(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->s()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qt2;->z(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Landroid/os/Message;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/qt2;->q(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ll/crf0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/qt2;->y(Ll/crf0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m(Landroid/os/Message;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/qt2;->o(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    :goto_0
    const-string p0, "mediaRender"

    .line 15
    .line 16
    const-string p1, "Invalid parameter, remove target failed !"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public n(Landroid/os/Message;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    check-cast p1, [Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    aget-object v0, p1, v0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    aget-object p1, p1, v1

    .line 15
    .line 16
    check-cast p1, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 23
    .line 24
    invoke-virtual {p0, v0, p1}, Ll/qt2;->n(Ljava/lang/Object;I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public o(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ll/kt2;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/qt2;->b(Ll/kt2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Landroid/os/Message;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    check-cast p1, [Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    aget-object v0, p1, v0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    aget-object v1, p1, v1

    .line 15
    .line 16
    check-cast v1, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x2

    .line 23
    aget-object p1, p1, v2

    .line 24
    .line 25
    check-cast p1, Ll/kt2;

    .line 26
    .line 27
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, p1}, Ll/qt2;->v(Ljava/lang/Object;ILl/kt2;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public r(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ll/kt2;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/qt2;->x(Ll/kt2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Landroid/os/Message;)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x12
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qt2;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Landroid/os/Message;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/qt2;->l(Landroid/os/Message;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt2$a;->a:Ll/qt2;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ll/omq0$a;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/qt2;->e(Ll/omq0$a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
