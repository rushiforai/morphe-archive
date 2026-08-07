.class public Ll/xvx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/ozl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ae00;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ae00;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xvx;->a:Ll/ozl;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(IZF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/ozl;->A(IZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->create()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ll/hn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/ozl;->z(Ll/hn50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    instance-of v0, p0, Ll/ae00;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/ae00;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ae00;->o(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->s()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/ozl;->x(Lcom/p1/mobile/android/app/Act;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ozl;->release()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public m(Landroid/view/SurfaceHolder;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {v0, p2, p3}, Ll/ozl;->n(II)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Ll/xvx;->a:Ll/ozl;

    .line 7
    .line 8
    invoke-interface {p2, p1}, Ll/ozl;->w(Landroid/view/SurfaceHolder;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ozl;->g()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public n(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/ozl;->b(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ozl;->g()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isCameraSdkLoaded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/ozl;->a()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ozl;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ll/wo50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xvx;->a:Ll/ozl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/ozl;->y(Ll/wo50;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
