.class public Ll/o7a;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/byd0;

.field public S:Ll/wyd0;

.field public T:Ll/wyd0;

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;>;"
        }
    .end annotation
.end field

.field public V:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public W:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationArticles;",
            ">;>;"
        }
    .end annotation
.end field

.field public X:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a3(Ll/o7a;Ll/ovb0;)Ll/ovb0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o7a;->r3(Ll/ovb0;)Ll/ovb0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ll/o7a;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7a;->s3()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/o7a;Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o7a;->t3(Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;)Ll/ovb0;
    .locals 0

    .line 1
    new-instance p4, Ll/ovb0;

    .line 2
    .line 3
    invoke-direct {p4, p0, p1, p2, p3}, Ll/ovb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object p4
.end method

.method public static synthetic e3(Ll/o7a;Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o7a;->w3(Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/o7a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7a;->u3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h3(Ll/o7a;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7a;->v3()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ll/o7a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7a;->x3()Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p0, v2}, Ll/o7a;->n3(Z)Ll/wyd0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/hxd0;->obs()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v2, Ll/h7a;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/h7a;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1, p0, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public B3()Lcom/p1/mobile/putong/data/IntlOperationArticles;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, v0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {p0, v3}, Ll/o7a;->n3(Z)Ll/wyd0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/CharSequence;

    .line 43
    .line 44
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_1

    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_1
    return-object v1
.end method

.method public C3()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0, v0}, Ll/o7a;->o3(Z)Ll/byd0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/o7a;->G3()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public D3()Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ovb0<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 4
    .line 5
    iget-object v2, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 6
    .line 7
    iget-object v3, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-virtual {p0, v4}, Ll/o7a;->p3(Z)Ll/wyd0;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-virtual {v4}, Ll/hxd0;->obs()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    new-instance v5, Ll/e7a;

    .line 19
    .line 20
    invoke-direct {v5}, Ll/e7a;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static/range {v0 .. v5}, Ll/psd0;->u(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/f7a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/f7a;-><init>(Ll/o7a;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public E3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/g7a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g7a;-><init>(Ll/o7a;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "intl_operation_articles"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final F3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/i7a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/i7a;-><init>(Ll/o7a;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "intl_operation_banner"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, v1}, Ll/o7a;->p3(Z)Ll/wyd0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public j3()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/o7a;->o3(Z)Ll/byd0;

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/o7a;->p3(Z)Ll/wyd0;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/o7a;->n3(Z)Ll/wyd0;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 12
    .line 13
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/o7a;->F3()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o7a;->F3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/o7a;->E3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l3()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/IntlOperationArticles;->clone()Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, v2, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-interface {v1, v0, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 46
    .line 47
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/IntlOperationArticles;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v2, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 51
    .line 52
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/UrlParentData;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v3, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFCM1hOM041QlJCMjJHWkpQUEVJS1pJUzRQUlpUNjA3IiwidyI6NzE4LCJoIjoyMDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5NDA2OTA4ODE3MjMzODU2OTI4fQ"

    .line 56
    .line 57
    iput-object v3, v2, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 58
    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v4, "title:"

    .line 62
    .line 63
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    iput-object v3, v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v2, v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/o7a;->q3()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iput-object v2, v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    :goto_0
    iget-object v0, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 107
    .line 108
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Ljava/lang/Integer;

    .line 113
    .line 114
    iget-object p0, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/lit8 v0, v0, 0x1

    .line 121
    .line 122
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public m3()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x0

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/IntlOperationBanner;->clone()Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v1, v4, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 46
    .line 47
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/IntlOperationBanner;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v3, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 51
    .line 52
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/UrlParentData;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFCM1hOM041QlJCMjJHWkpQUEVJS1pJUzRQUlpUNjA3IiwidyI6NzE4LCJoIjoyMDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5NDA2OTA4ODE3MjMzODU2OTI4fQ"

    .line 56
    .line 57
    iput-object v5, v3, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v3, v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->icon:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 60
    .line 61
    new-instance v3, Lcom/p1/mobile/putong/data/UrlParentData;

    .line 62
    .line 63
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/UrlParentData;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v5, v3, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v3, v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/o7a;->q3()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iput-object v3, v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, v2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {v1, v4, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :goto_0
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 95
    .line 96
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ljava/lang/Integer;

    .line 101
    .line 102
    iget-object p0, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/lit8 v0, v0, 0x1

    .line 109
    .line 110
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final n3(Z)Ll/wyd0;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/o7a;->T:Ll/wyd0;

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    :cond_0
    new-instance p1, Ll/wyd0;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "last_feed_clicked_articleid_"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, ""

    .line 32
    .line 33
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/o7a;->T:Ll/wyd0;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/o7a;->T:Ll/wyd0;

    .line 39
    .line 40
    return-object p0
.end method

.method public final o3(Z)Ll/byd0;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/o7a;->R:Ll/byd0;

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    :cond_0
    new-instance p1, Ll/byd0;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "last_request_timestamp_"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0x0

    .line 32
    .line 33
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/o7a;->R:Ll/byd0;

    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Ll/o7a;->R:Ll/byd0;

    .line 43
    .line 44
    return-object p0
.end method

.method public final p3(Z)Ll/wyd0;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/o7a;->S:Ll/wyd0;

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    :cond_0
    new-instance p1, Ll/wyd0;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "last_shown_dynamic_articleid_"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, ""

    .line 32
    .line 33
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/o7a;->S:Ll/wyd0;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/o7a;->S:Ll/wyd0;

    .line 39
    .line 40
    return-object p0
.end method

.method public final q3()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/qv5;->B:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, "/intl-operation/banners/1?lang=zh-CN"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic r3(Ll/ovb0;)Ll/ovb0;
    .locals 8

    .line 1
    iget-object v0, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    iget-object v2, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Ljava/lang/Integer;

    .line 12
    .line 13
    iget-object p1, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    add-int/2addr v3, v4

    .line 26
    const/4 v4, 0x1

    .line 27
    const/4 v5, 0x0

    .line 28
    if-lez v3, :cond_0

    .line 29
    .line 30
    move v3, v4

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v3, v5

    .line 33
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    add-int/2addr v6, v7

    .line 42
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-lez v2, :cond_1

    .line 47
    .line 48
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    invoke-static {v0}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    const/4 v0, 0x0

    .line 66
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    .line 72
    invoke-static {v1}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-lez p1, :cond_2

    .line 83
    .line 84
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0, v5}, Ll/o7a;->p3(Z)Ll/wyd0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Ljava/lang/CharSequence;

    .line 99
    .line 100
    iget-object p1, v1, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_2

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    move v4, v5

    .line 110
    :goto_2
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    new-instance p0, Ll/ovb0;

    .line 114
    .line 115
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-direct {p0, p1, v1, v0, v2}, Ll/ovb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    return-object p0
.end method

.method public final synthetic s3()Ll/x1d0;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2}, Ll/o7a;->o3(Z)Ll/byd0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/a;->l0(Ljava/lang/String;J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic t3(Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7a;->W:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->data:Lcom/p1/mobile/putong/data/IntlOperationData;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IntlOperationData;->intlArticles:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/o7a;->X:Lrx/subjects/a;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->counters:Lcom/p1/mobile/putong/data/IntlOperationCounters;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationCounters;->intlArticles:Lcom/p1/mobile/putong/data/IntlOperationCounterCount;

    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/data/IntlOperationCounterCount;->unread:I

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic u3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/m7a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m7a;-><init>(Ll/o7a;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/k7a;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/k7a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/n7a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/n7a;-><init>(Ll/o7a;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic v3()Ll/x1d0;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2}, Ll/o7a;->o3(Z)Ll/byd0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/a;->m0(Ljava/lang/String;J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic w3(Lcom/p1/mobile/putong/data/IntlOperationEnvelope;)Ll/uxj0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->data:Lcom/p1/mobile/putong/data/IntlOperationData;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IntlOperationData;->intlBannerActivities:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/o7a;->V:Lrx/subjects/a;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->counters:Lcom/p1/mobile/putong/data/IntlOperationCounters;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationCounters;->intlBannerActivities:Lcom/p1/mobile/putong/data/IntlOperationCounterCount;

    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/data/IntlOperationCounterCount;->unread:I

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 26
    .line 27
    return-object p0
.end method

.method public final synthetic x3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/j7a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j7a;-><init>(Ll/o7a;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/IntlOperationEnvelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/k7a;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/k7a;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/l7a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/l7a;-><init>(Ll/o7a;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public y3(Landroid/content/Context;ILcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-string v1, ""

    .line 5
    .line 6
    if-eq p2, v0, :cond_1

    .line 7
    .line 8
    const/4 p3, 0x2

    .line 9
    if-eq p2, p3, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 p2, 0x0

    .line 13
    invoke-virtual {p0, p2}, Ll/o7a;->n3(Z)Ll/wyd0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p2, p4, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p4, Lcom/p1/mobile/putong/data/IntlOperationArticles;->jumpUrl:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1, v1, p0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p3, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, v1, p0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {p0}, Ll/o7a;->C3()V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->hs(Landroid/content/Context;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public z3()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlOperationBanner;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/o7a;->U:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/util/List;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 19
    .line 20
    return-object p0
.end method
