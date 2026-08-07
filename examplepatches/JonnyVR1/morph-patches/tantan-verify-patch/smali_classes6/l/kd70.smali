.class public Ll/kd70;
.super Ll/v670;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v670;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public E1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ld70;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/ld70;->L(Z)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0}, Ll/v670;->E1()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public L1(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ld70;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ld70;->Q()V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Ll/v670;->L1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e1()V
    .locals 2

    .line 1
    const-string v0, "original_moments"

    .line 2
    .line 3
    iget-object v1, p0, Ll/v670;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/hv00;

    .line 12
    .line 13
    iget-object v1, p0, Ll/v670;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/hv00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/v670;->b:Ll/n570;

    .line 21
    .line 22
    :cond_0
    invoke-super {p0}, Ll/v670;->e1()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
