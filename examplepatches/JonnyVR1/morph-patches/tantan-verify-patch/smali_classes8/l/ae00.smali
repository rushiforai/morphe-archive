.class public Ll/ae00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ozl;


# instance fields
.field public a:Ll/l0m;

.field public b:Ll/fam;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/wo50;Ljava/lang/String;ILjava/lang/Exception;)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/wo50;->success(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-interface {p0, p3}, Ll/wo50;->a(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic l(Ll/ae00;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->c:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public A(IZF)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/ae00;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    if-ltz p1, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Ll/ae00;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-ge p1, p2, :cond_0

    .line 22
    .line 23
    iget-object p2, p0, Ll/ae00;->a:Ll/l0m;

    .line 24
    .line 25
    const p3, 0x3f4ccccd    # 0.8f

    .line 26
    .line 27
    .line 28
    invoke-interface {p2, p3}, Ll/m0m;->x(F)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/ae00;->a:Ll/l0m;

    .line 32
    .line 33
    iget-object p0, p0, Ll/ae00;->d:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-interface {p2, p0, p1}, Ll/o0m;->y(Ljava/lang/String;F)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/n0m;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/n0m;->b(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/n0m;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public create()V
    .locals 2

    .line 1
    invoke-static {}, Ll/be00;->a()Ll/l0m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, v1}, Ll/o0m;->N(Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/be00;->b()Ll/fam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/ae00;->b:Ll/fam;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->At()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/ae00;->c:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ae00;->p(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/n0m;->d()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/n0m;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/n0m;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/n0m;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/l0m;->h()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ae00;->j()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/l0m;->i()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/l0m;->j()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final m()Ll/vow;
    .locals 4

    .line 1
    invoke-static {}, Ll/qow;->A()Ll/qow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/qow;->E(I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/crf0;

    .line 10
    .line 11
    const/16 v2, 0x320

    .line 12
    .line 13
    const/16 v3, 0x258

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Ll/crf0;-><init>(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/qow;->F(Ll/crf0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/qow;->R(Ll/crf0;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v1}, Ll/qow;->E(I)V

    .line 26
    .line 27
    .line 28
    const/high16 v2, 0x800000

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Ll/qow;->U(I)V

    .line 31
    .line 32
    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->u2:I

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v3, "1:1"

    .line 46
    .line 47
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ll/qow;->O(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const/4 v1, 0x2

    .line 58
    invoke-virtual {p0, v1}, Ll/qow;->O(I)V

    .line 59
    .line 60
    .line 61
    :goto_0
    invoke-virtual {p0, v0}, Ll/qow;->C(I)V

    .line 62
    .line 63
    .line 64
    const/16 v0, 0x14

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/qow;->V(I)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Ll/vow$b;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/vow$b;-><init>(Ll/qow;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ll/vow$b;->i()Ll/vow;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public n(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/n0m;->n(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ae00;->d:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/l0m;->H(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/l0m;->release()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/l0m;->s()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public w(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/n0m;->w(Landroid/view/SurfaceHolder;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/ae00;->m()Ll/vow;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p1, p0}, Ll/l0m;->R(Landroid/app/Activity;Ll/vow;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public y(Ll/wo50;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->pd()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    const-string p0, "\u6ca1\u6709\u627e\u5230SD\u5361\uff0c\u65e0\u6cd5\u62cd\u7167"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p0, p0, Ll/ae00;->a:Ll/l0m;

    .line 31
    .line 32
    new-instance v1, Ll/zd00;

    .line 33
    .line 34
    invoke-direct {v1, p1, v0}, Ll/zd00;-><init>(Ll/wo50;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-interface {p0, v0, p1, v1}, Ll/n0m;->C(Ljava/lang/String;ZLl/qpw;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public z(Ll/hn50;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ae00;->a:Ll/l0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v1, Ll/ae00$a;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/ae00$a;-><init>(Ll/ae00;Ll/hn50;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/l0m;->P(Ll/lpw;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
