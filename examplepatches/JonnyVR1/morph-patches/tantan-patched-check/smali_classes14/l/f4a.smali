.class public Ll/f4a;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public final R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation
.end field

.field public final S:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation
.end field

.field public final T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final U:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public final V:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public W:Ll/byd0;

.field public final X:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/f4a;->S:Lrx/subjects/a;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/f4a;->T:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/f4a;->U:Lrx/subjects/b;

    .line 32
    .line 33
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/f4a;->V:Lrx/subjects/b;

    .line 38
    .line 39
    new-instance p1, Ll/byd0;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v1, "show_near_by_red_point_time_"

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-wide/16 v1, 0x0

    .line 64
    .line 65
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/f4a;->W:Ll/byd0;

    .line 73
    .line 74
    new-instance p1, Ljava/util/HashSet;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ll/f4a;->X:Ljava/util/HashSet;

    .line 80
    .line 81
    return-void
.end method

.method public static synthetic a3(Ll/f4a;ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f4a;->x3(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ll/f4a;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f4a;->z3(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c3(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    new-instance v0, Ll/v3a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/v3a;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e3()Ll/x1d0;
    .locals 2

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
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->a1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic g3(Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic i3(Ll/f4a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f4a;->w3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ljava/util/ArrayList;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance p0, Ll/u3a;

    .line 14
    .line 15
    invoke-direct {p0, p2}, Ll/u3a;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 v0, -0x1

    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    invoke-interface {p1, p0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public static synthetic k3(Ll/f4a;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f4a;->y3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Ll/f4a;Ljava/lang/Object;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f4a;->C3(Ljava/lang/Object;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n3(Ll/f4a;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f4a;->A3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Ll/f4a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f4a;->B3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Ll/x1d0;
    .locals 1

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
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    :goto_0
    invoke-static {p0, p1, p2, p3}, Ll/f4a;->v3(ILjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->Z0(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static v3(ILjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    const-string p2, "limit="

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p0, "&refresh=true"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_2

    .line 35
    .line 36
    const-string p0, "&type="

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method


# virtual methods
.method public final synthetic A3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 4
    .line 5
    iget-object p0, p0, Ll/f4a;->T:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 15
    .line 16
    return-object p0
.end method

.method public final synthetic B3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/c4a;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/c4a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/d4a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/d4a;-><init>(Ll/f4a;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic C3(Ljava/lang/Object;)Ll/vg60;
    .locals 0

    .line 1
    iget-object p1, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/vg60;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public D3(Lcom/p1/mobile/putong/data/Links;IZ)Lrx/c;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/Links;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Links;",
            "IZ)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/f4a;->E3(Lcom/p1/mobile/putong/data/Links;IZLjava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E3(Lcom/p1/mobile/putong/data/Links;IZLjava/lang/String;)Lrx/c;
    .locals 7
    .param p1    # Lcom/p1/mobile/putong/data/Links;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Links;",
            "IZ",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/p3a;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v4, p1

    .line 7
    move v3, p2

    .line 8
    move v5, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/p3a;-><init>(Ll/f4a;ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p0, "core_nearby_request"

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public F3()Lrx/c;
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
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/a4a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/a4a;-><init>(Ll/f4a;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "core_nearby_count_request"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public G3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4a;->U:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public H3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4a;->T:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public I3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f4a;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public J3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public K3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 22
    .line 23
    iget-object v2, p0, Ll/f4a;->U:Lrx/subjects/b;

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lrx/c;->merge(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/b4a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/b4a;-><init>(Ll/f4a;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_0
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public L3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4a;->S:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public M3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f4a;->V:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public N3()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/f4a;->W:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->n()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public q3()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Ll/f4a;->W:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public r3(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f4a;->S:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/f4a;->S:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/vg60;

    .line 20
    .line 21
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public s3(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/vg60;

    .line 20
    .line 21
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public final t3(Ljava/lang/String;)Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/subjects/a<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "online"

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/f4a;->S:Lrx/subjects/a;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/f4a;->R:Lrx/subjects/a;

    .line 13
    .line 14
    return-object p0
.end method

.method public final u3(Ljava/lang/String;)Lrx/subjects/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "online"

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/f4a;->V:Lrx/subjects/b;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/f4a;->U:Lrx/subjects/b;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic w3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p3, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 7
    .line 8
    iget v2, v1, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 9
    .line 10
    iput v2, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    const-class v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 17
    .line 18
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 25
    .line 26
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 27
    .line 28
    invoke-virtual {p3, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    check-cast p3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 33
    .line 34
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 35
    .line 36
    new-instance v2, Ll/e4a;

    .line 37
    .line 38
    invoke-direct {v2, p3}, Ll/e4a;-><init>(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/f4a;->t3(Ljava/lang/String;)Lrx/subjects/a;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    if-nez p3, :cond_0

    .line 53
    .line 54
    new-instance p2, Ll/vg60;

    .line 55
    .line 56
    invoke-direct {p2, v1, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    invoke-virtual {p0, p1}, Ll/f4a;->t3(Ljava/lang/String;)Lrx/subjects/a;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    check-cast p3, Ll/vg60;

    .line 69
    .line 70
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 71
    .line 72
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_1

    .line 77
    .line 78
    new-instance p2, Ll/q3a;

    .line 79
    .line 80
    invoke-direct {p2}, Ll/q3a;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {p3, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    new-instance v2, Ll/r3a;

    .line 88
    .line 89
    invoke-direct {v2, p2, p3}, Ll/r3a;-><init>(Ljava/util/ArrayList;Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 97
    .line 98
    .line 99
    new-instance p2, Ll/s3a;

    .line 100
    .line 101
    invoke-direct {p2, p3}, Ll/s3a;-><init>(Ljava/util/List;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-eqz p2, :cond_2

    .line 112
    .line 113
    invoke-static {v1}, Ll/jyb;->E(Ljava/util/List;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    new-instance v1, Ll/t3a;

    .line 118
    .line 119
    invoke-direct {v1}, Ll/t3a;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    new-instance p2, Ll/vg60;

    .line 126
    .line 127
    invoke-direct {p2, p3, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 128
    .line 129
    .line 130
    :goto_1
    invoke-virtual {p0, p1}, Ll/f4a;->t3(Ljava/lang/String;)Lrx/subjects/a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 138
    .line 139
    return-object p0
.end method

.method public final synthetic x3(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/w3a;

    .line 4
    .line 5
    invoke-direct {v1, p1, p2, p3, p4}, Ll/w3a;-><init>(ILcom/p1/mobile/putong/data/Links;ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/x3a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/x3a;-><init>(Ll/f4a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p1, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p3, Ll/y3a;

    .line 29
    .line 30
    invoke-direct {p3, p0, p4}, Ll/y3a;-><init>(Ll/f4a;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p3}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p3, Ll/z3a;

    .line 38
    .line 39
    invoke-direct {p3, p0, p4, p2}, Ll/z3a;-><init>(Ll/f4a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic y3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/c;->x3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;Z)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public final synthetic z3(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f4a;->u3(Ljava/lang/String;)Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
