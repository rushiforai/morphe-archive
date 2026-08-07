.class public Ll/s310$a;
.super Ll/pxh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s310;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/s310;


# direct methods
.method public constructor <init>(Ll/s310;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s310$a;->a:Ll/s310;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pxh0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(FLl/pwl;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/pwl;->R1(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pxh0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 17
    .line 18
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/q310;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/q310;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 31
    .line 32
    const-string v0, "onBufferingEnd"

    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pxh0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 17
    .line 18
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/n310;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/n310;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 31
    .line 32
    const-string v0, "onBufferingStart"

    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pxh0;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0}, Ll/s310;->E(Ll/s310;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Ll/s310$a;->a:Ll/s310;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {v1}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 25
    .line 26
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/o310;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/o310;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 39
    .line 40
    const-string v0, "onCompletion"

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const/4 p0, 0x0

    .line 47
    invoke-static {v1, p0}, Ll/s310;->K(Ll/s310;I)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Ll/v2t;->c:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "onPlayError in onCompletion"

    .line 53
    .line 54
    invoke-static {v0}, Ll/xau;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public d(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/s310;->K(Ll/s310;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "onError, what:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p0, p1}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pxh0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 17
    .line 18
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/p310;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/p310;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 31
    .line 32
    const-string v0, "onFirstFrameRendering"

    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pxh0;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 17
    .line 18
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/m310;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/m310;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 31
    .line 32
    const-string v0, "onPrepared"

    .line 33
    .line 34
    invoke-static {p0, v0}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/pxh0;->g(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/s310;->I(Ll/s310;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/s310;->H(Ll/s310;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/s310;->P(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/pxh0;->h(II)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onVideoSizeChanged, videoWidth = "

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, ", videoHeight = "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Ll/s310;->J(Ll/s310;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 32
    .line 33
    invoke-static {v0}, Ll/s310;->G(Ll/s310;)Ll/m410;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p1, p2}, Ll/m410;->z(II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/s310$a;->a:Ll/s310;

    .line 41
    .line 42
    invoke-static {v0}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    if-eqz p2, :cond_0

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    int-to-float p1, p1

    .line 57
    int-to-float p2, p2

    .line 58
    div-float/2addr p1, p2

    .line 59
    iget-object p2, p0, Ll/s310$a;->a:Ll/s310;

    .line 60
    .line 61
    invoke-static {p2}, Ll/s310;->F(Ll/s310;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    new-instance v0, Ll/r310;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Ll/r310;-><init>(F)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    iget-object p0, p0, Ll/s310$a;->a:Ll/s310;

    .line 74
    .line 75
    invoke-static {p0}, Ll/s310;->G(Ll/s310;)Ll/m410;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const/4 p1, 0x1

    .line 80
    invoke-virtual {p0, p1}, Ll/m410;->x(Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
