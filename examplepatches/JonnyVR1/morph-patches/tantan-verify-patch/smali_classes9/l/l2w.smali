.class public Ll/l2w;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Ll/oo2;

.field public final e:Ll/aj1;

.field public final f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/oo2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/l2w;->a:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/l2w;->b:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/l2w;->c:Lrx/subjects/a;

    .line 26
    .line 27
    new-instance v0, Ll/aj1;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/aj1;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/l2w;->e:Ll/aj1;

    .line 33
    .line 34
    new-instance v0, Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/l2w;->f:Ljava/util/HashMap;

    .line 40
    .line 41
    iput-object p1, p0, Ll/l2w;->d:Ll/oo2;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Ll/l2w;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l2w;->k(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2w;->f:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l2w;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/aj1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2w;->e:Ll/aj1;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/oo2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2w;->d:Ll/oo2;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l2w;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l2w;->d:Ll/oo2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l2w;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l2w;->f:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/vwt;->S5()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/vwt;->L4()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    const/4 v0, 0x2

    .line 21
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/vwt;->z4()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/lfp;->a()Ll/lfp;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/lfp;->b()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    move-object p1, v0

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 54
    .line 55
    const-string v1, "Message template not exit"

    .line 56
    .line 57
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    new-instance v0, Ll/k2w;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/k2w;-><init>(Ll/l2w;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l2w;->f:Ljava/util/HashMap;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->id:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l(Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/l2w;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-void
.end method
