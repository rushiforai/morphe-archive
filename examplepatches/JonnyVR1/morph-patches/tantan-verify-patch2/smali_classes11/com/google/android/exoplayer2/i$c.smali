.class public final Lcom/google/android/exoplayer2/i$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wjl0;
.implements Lcom/google/android/exoplayer2/audio/c;
.implements Ll/asi0;
.implements Ll/ga00;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Lcom/google/android/exoplayer2/video/spherical/SphericalGLSurfaceView$b;
.implements Lcom/google/android/exoplayer2/b$b;
.implements Lcom/google/android/exoplayer2/AudioBecomingNoisyManager$a;
.implements Lcom/google/android/exoplayer2/StreamVolumeManager$b;
.implements Lcom/google/android/exoplayer2/ExoPlayer$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/i;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/i$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/i$c;-><init>(Lcom/google/android/exoplayer2/i;)V

    return-void
.end method

.method public static synthetic J(Ljava/util/List;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->p(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Lcom/google/android/exoplayer2/metadata/Metadata;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->n(Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/google/android/exoplayer2/h;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->W(Lcom/google/android/exoplayer2/h;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Ll/qyb;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->d(Ll/qyb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(ZLcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->a(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(IZLcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Lcom/google/android/exoplayer2/t$d;->H(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/google/android/exoplayer2/i$c;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->R(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->E(Lcom/google/android/exoplayer2/o;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic Q(Ll/zjl0;Lcom/google/android/exoplayer2/t$d;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lcom/google/android/exoplayer2/t$d;->x(Ll/zjl0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public B(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(IZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/l9f;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Ll/l9f;-><init>(IZ)V

    .line 10
    .line 11
    .line 12
    const/16 p1, 0x1e

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public F(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->X(Lcom/google/android/exoplayer2/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/i;->getPlayWhenReady()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 8
    .line 9
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->Y(ZI)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p0, v0, p1, v1}, Lcom/google/android/exoplayer2/i;->Z(Lcom/google/android/exoplayer2/i;ZII)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->L(Lcom/google/android/exoplayer2/i;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->M(Lcom/google/android/exoplayer2/i;Z)Z

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/p9f;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/p9f;-><init>(Z)V

    .line 24
    .line 25
    .line 26
    const/16 p1, 0x17

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/dk0;->b(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/dk0;->c(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Ll/qyb;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->N(Lcom/google/android/exoplayer2/i;Ll/qyb;)Ll/qyb;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ll/i9f;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/i9f;-><init>(Ll/qyb;)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0x1b

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/dk0;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Ljava/lang/String;JJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, p1

    .line 8
    move-wide v2, p2

    .line 9
    move-wide v4, p4

    .line 10
    invoke-interface/range {v0 .. v5}, Ll/dk0;->f(Ljava/lang/String;JJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g(Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 1
    .param p2    # Ll/nid;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->K(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1, p2}, Ll/dk0;->g(Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public h(Lcom/google/android/exoplayer2/k;Ll/nid;)V
    .locals 1
    .param p2    # Ll/nid;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->h0(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1, p2}, Ll/dk0;->h(Lcom/google/android/exoplayer2/k;Ll/nid;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i(IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Ll/dk0;->i(IJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/dk0;->j(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k(JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Ll/dk0;->k(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l(Ljava/lang/String;JJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v1, p1

    .line 8
    move-wide v2, p2

    .line 9
    move-wide v4, p4

    .line 10
    invoke-interface/range {v0 .. v5}, Ll/dk0;->l(Ljava/lang/String;JJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m(Ll/jid;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->f0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, Ll/dk0;->m(Ll/jid;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public n(Lcom/google/android/exoplayer2/metadata/Metadata;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->O(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/o;->b()Lcom/google/android/exoplayer2/o$b;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer2/o$b;->K(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/o$b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/o$b;->H()Lcom/google/android/exoplayer2/o;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/i;->P(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/o;)Lcom/google/android/exoplayer2/o;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->Q(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/google/android/exoplayer2/i;->R(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/o;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/o;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 41
    .line 42
    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/i;->S(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/o;)Lcom/google/android/exoplayer2/o;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/j9f;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/j9f;-><init>(Lcom/google/android/exoplayer2/i$c;)V

    .line 54
    .line 55
    .line 56
    const/16 v2, 0xe

    .line 57
    .line 58
    invoke-virtual {v0, v2, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/k9f;

    .line 68
    .line 69
    invoke-direct {v1, p1}, Ll/k9f;-><init>(Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 70
    .line 71
    .line 72
    const/16 p1, 0x1c

    .line 73
    .line 74
    invoke-virtual {v0, p1, v1}, Ll/bqr;->h(ILl/bqr$a;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 78
    .line 79
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/bqr;->f()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public o(Ll/jid;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ll/dk0;->o(Ll/jid;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/i;->h0(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 17
    .line 18
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/i;->f0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->W(Lcom/google/android/exoplayer2/i;Landroid/graphics/SurfaceTexture;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0, p2, p3}, Lcom/google/android/exoplayer2/i;->V(Lcom/google/android/exoplayer2/i;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/i;->U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1, p1}, Lcom/google/android/exoplayer2/i;->V(Lcom/google/android/exoplayer2/i;II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0, p2, p3}, Lcom/google/android/exoplayer2/i;->V(Lcom/google/android/exoplayer2/i;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public p(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/myb;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/h9f;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/h9f;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    const/16 p1, 0x1b

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Ll/dk0;->q(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/dk0;->r(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, 0x3

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p0, v2, v0, v1}, Lcom/google/android/exoplayer2/i;->Z(Lcom/google/android/exoplayer2/i;ZII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0, p3, p4}, Lcom/google/android/exoplayer2/i;->V(Lcom/google/android/exoplayer2/i;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->T(Lcom/google/android/exoplayer2/i;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 10
    .line 11
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/exoplayer2/i;->T(Lcom/google/android/exoplayer2/i;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/i;->U(Lcom/google/android/exoplayer2/i;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, p1, p1}, Lcom/google/android/exoplayer2/i;->V(Lcom/google/android/exoplayer2/i;II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t(Ll/jid;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->l0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, Ll/dk0;->t(Ll/jid;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->e0(Lcom/google/android/exoplayer2/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Ll/jid;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ll/dk0;->v(Ll/jid;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/i;->K(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/k;)Lcom/google/android/exoplayer2/k;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 17
    .line 18
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/i;->l0(Lcom/google/android/exoplayer2/i;Ll/jid;)Ll/jid;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public w(Ljava/lang/Object;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1, p2, p3}, Ll/dk0;->w(Ljava/lang/Object;J)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 11
    .line 12
    invoke-static {p2}, Lcom/google/android/exoplayer2/i;->k0(Lcom/google/android/exoplayer2/i;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    if-ne p2, p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/n9f;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/n9f;-><init>()V

    .line 27
    .line 28
    .line 29
    const/16 p2, 0x1a

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public x(Ll/zjl0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->i0(Lcom/google/android/exoplayer2/i;Ll/zjl0;)Ll/zjl0;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v0, Ll/o9f;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/o9f;-><init>(Ll/zjl0;)V

    .line 15
    .line 16
    .line 17
    const/16 p1, 0x19

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public y(IJJ)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->g0(Lcom/google/android/exoplayer2/i;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move v1, p1

    .line 8
    move-wide v2, p2

    .line 9
    move-wide v4, p4

    .line 10
    invoke-interface/range {v0 .. v5}, Ll/dk0;->y(IJJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public z(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/exoplayer2/i;->a0(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/google/android/exoplayer2/i;->b0(Lcom/google/android/exoplayer2/StreamVolumeManager;)Lcom/google/android/exoplayer2/h;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/exoplayer2/i;->c0(Lcom/google/android/exoplayer2/i;)Lcom/google/android/exoplayer2/h;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/h;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 24
    .line 25
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/i;->d0(Lcom/google/android/exoplayer2/i;Lcom/google/android/exoplayer2/h;)Lcom/google/android/exoplayer2/h;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/google/android/exoplayer2/i$c;->a:Lcom/google/android/exoplayer2/i;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/google/android/exoplayer2/i;->j0(Lcom/google/android/exoplayer2/i;)Ll/bqr;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/m9f;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ll/m9f;-><init>(Lcom/google/android/exoplayer2/h;)V

    .line 37
    .line 38
    .line 39
    const/16 p1, 0x1d

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Ll/bqr;->k(ILl/bqr$a;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
