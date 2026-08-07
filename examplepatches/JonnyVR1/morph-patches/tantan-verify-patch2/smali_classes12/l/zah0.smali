.class public Ll/zah0;
.super Ll/bkm;
.source "SourceFile"


# instance fields
.field o:Ll/lce;

.field private p:[F

.field q:I

.field r:I

.field s:Landroid/graphics/SurfaceTexture;

.field t:Ll/crf0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bkm;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lce;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/lce;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Ll/zah0;->q:I

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/zah0;->o:Ll/lce;

    .line 17
    .line 18
    rsub-int v0, v0, 0x168

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/lce;->O(I)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Ll/zah0;->t:Ll/crf0;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/crf0;->b()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Ll/zah0;->t:Ll/crf0;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/crf0;->a()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v0, v1, v2}, Ll/xej;->z(II)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/bkm;->o(Ll/hfj;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bkm;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hfj;->f()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/zah0;->o:Ll/lce;

    .line 13
    .line 14
    :cond_0
    iput-object v1, p0, Ll/zah0;->p:[F

    .line 15
    .line 16
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Ll/zah0;->r:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/lce;->P(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/zah0;->p:[F

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/16 v0, 0x10

    .line 15
    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    iput-object v0, p0, Ll/zah0;->p:[F

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/zah0;->s:Landroid/graphics/SurfaceTexture;

    .line 21
    .line 22
    iget-object v1, p0, Ll/zah0;->p:[F

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/zah0;->o:Ll/lce;

    .line 28
    .line 29
    iget-object v1, p0, Ll/zah0;->p:[F

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/lce;->Q([F)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-super {p0}, Ll/bkm;->j()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public n(Ll/crf0;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/bkm;->n(Ll/crf0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zah0;->t:Ll/crf0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/zah0;->o:Ll/lce;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, v0, p1}, Ll/xej;->z(II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zah0;->q:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/zah0;->o:Ll/lce;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    rsub-int p1, p1, 0x168

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/lce;->O(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public u(Landroid/graphics/SurfaceTexture;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zah0;->s:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    iput p2, p0, Ll/zah0;->r:I

    .line 4
    .line 5
    return-void
.end method
