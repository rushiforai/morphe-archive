.class public Lcom/p1/mobile/putong/feed/api/b;
.super Ll/dog;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/api/b$a;
    }
.end annotation


# instance fields
.field public final H:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public I:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public J:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public K:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/SparseArray<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public L:Z

.field public M:Lcom/p1/mobile/putong/feed/api/b$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dog;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/b;->H:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/b;->I:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/b;->J:Lrx/subjects/b;

    .line 21
    .line 22
    new-instance v0, Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/b;->K:Lrx/subjects/a;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/api/b;->L:Z

    .line 35
    .line 36
    new-instance v0, Lcom/p1/mobile/putong/feed/api/b$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/api/b$a;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-static {}, Ll/mrb0;->c()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic A1(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->l3(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 10
    .line 11
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/wzh0;->delete(J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic B0(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;J)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/api/b;->G3(Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/b;->Q3(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic B2(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/jw9;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/jw9;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget p0, Ll/dog;->D:I

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/kw9;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/kw9;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic C0(Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/data/VoiceLiveGame;)Lcom/p1/mobile/putong/data/VoiceLiveGame;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic C2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, p2}, Ll/dog;->B(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic D1()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "limit=20"

    .line 8
    .line 9
    invoke-static {v1}, Ll/dog;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic D2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->r3(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E0(Ljava/lang/String;ILcom/p1/mobile/putong/data/DbLinks;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/ev9;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/ev9;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 17
    .line 18
    iget-object p1, p1, Ll/vj5;->c:Ll/wzh0;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 24
    .line 25
    iget-object p1, p1, Ll/qzg;->d:Ll/kh00;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ll/kh00;->G(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->n6(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic E1(Ljava/lang/String;JLl/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic E2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/mrb0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/feed/api/b;ZLcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->K3(ZLcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F1(Lcom/p1/mobile/putong/feed/api/b;ZLjava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->L3(ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->D3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic G1(ZLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 18
    .line 19
    new-instance p1, Ll/cy9;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/cy9;-><init>()V

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, 0x258

    .line 25
    .line 26
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic G2()V
    .locals 0

    .line 1
    invoke-static {}, Ll/mrb0;->I()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/data/VoiceRoomInfo;)Lcom/p1/mobile/putong/data/VoiceRoomInfo;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic H1(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic H2(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    iput-object v1, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 26
    .line 27
    iput p0, v1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 28
    .line 29
    iget-object p0, v1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 32
    .line 33
    new-instance v2, Ll/yu9;

    .line 34
    .line 35
    invoke-direct {v2}, Ll/yu9;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v2, Ll/zu9;

    .line 43
    .line 44
    invoke-direct {v2, p1}, Ll/zu9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const/4 v2, 0x1

    .line 52
    new-array v2, v2, [Ljava/util/List;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    aput-object v0, v2, v3

    .line 56
    .line 57
    invoke-static {p0, v2}, Ll/jyb;->e(Ljava/util/List;[Ljava/util/List;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 64
    .line 65
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/feed/api/b;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->M3(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I1(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

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
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/i1y;

    .line 18
    .line 19
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object v2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-direct {v0, v1, v2, p0}, Ll/i1y;-><init>(Ljava/util/List;ZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/sv9;

    .line 31
    .line 32
    invoke-direct {v1, p2}, Ll/sv9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lrx/c;->last()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/uv9;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/uv9;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/vv9;

    .line 53
    .line 54
    invoke-direct {v0, p1, p2}, Ll/vv9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v0, Ll/wv9;

    .line 62
    .line 63
    invoke-direct {v0, p1, p2}, Ll/wv9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_0
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public static synthetic I2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->q3(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->s3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J1(J)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dw9;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dw9;-><init>(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic J2(Lcom/p1/mobile/putong/data/Room;)Lcom/p1/mobile/putong/data/Room;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/DbLinks;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->A3(Lcom/p1/mobile/putong/data/DbLinks;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K1(I)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/mrb0;->V(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K2(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->w3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->o3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L1(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L2(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->I3(Ll/y20;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M0(Lcom/p1/mobile/putong/data/Live;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M1(ZLjava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 10
    .line 11
    const-string v1, "{\"read\": true}"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, "&method=patch"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget-object p0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/x1d0$a;->d()Ll/x1d0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    :goto_0
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static synthetic M2(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/b;->Q3(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "moments_sent"

    .line 5
    .line 6
    invoke-static {v2, v1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/pf60;

    .line 10
    .line 11
    const/4 v2, 0x4

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/k110;->d(Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 40
    .line 41
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 42
    .line 43
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v1, Ll/iy9;

    .line 59
    .line 60
    invoke-direct {v1, v0, p0, p2}, Ll/iy9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p2, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 64
    .line 65
    .line 66
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 67
    .line 68
    return-object p0
.end method

.method public static synthetic N1(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->x3(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic N2(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->r4(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O1(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->C3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->n3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P1(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/ny9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ny9;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget p0, Ll/dog;->D:I

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/oy9;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/oy9;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/py9;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Ll/py9;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/feed/data/VoiceLive;)Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic Q1(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->z3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static Q3(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    double-to-int p0, v0

    .line 7
    return p0
.end method

.method public static synthetic R1(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1}, Ll/dog;->w(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/feed/api/b;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->J3(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic S1(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/rx9;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/rx9;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    sget-object v1, Ll/uqb0;->k0:Ll/vj5;

    .line 30
    .line 31
    iget-object v1, v1, Ll/vj5;->d:Ll/ejk0;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 76
    .line 77
    return-object p0
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/data/LiveUserMask;)Lcom/p1/mobile/putong/data/LiveUserMask;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic T1(J)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/wzh0;->delete(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/data/Live;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic U1(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/dog;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->d()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic V0(ZLcom/p1/mobile/putong/feed/data/MomentActivity;)Lrx/c;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    if-nez p0, :cond_2

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :cond_1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Ll/dog;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/bx9;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Ll/bx9;-><init>(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/ti20;

    .line 33
    .line 34
    invoke-direct {p1, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/cx9;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/cx9;-><init>(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_2
    if-eqz p0, :cond_3

    .line 56
    .line 57
    invoke-static {}, Ll/dog;->c()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance p1, Ll/dx9;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/dx9;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance p0, Ll/ti20;

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance p1, Ll/ex9;

    .line 80
    .line 81
    invoke-direct {p1}, Ll/ex9;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_3
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 90
    .line 91
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method

.method public static synthetic V1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/k110;->d(Ll/pf60;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "moment"

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p2, p0, p0, v0}, Ll/mrb0;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/tx9;

    .line 25
    .line 26
    invoke-direct {v0, p2, p1}, Ll/tx9;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->u3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W1(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->B3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/data/VoiceRoomInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->F3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/jx9;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/jx9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    sget v2, Ll/dog;->E:I

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/kx9;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/kx9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic Y1(Z)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->c:Ll/wzh0;

    .line 4
    .line 5
    const-string v1, "moment_activities"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 17
    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 21
    .line 22
    :cond_0
    sget-object v1, Ll/uqb0;->k0:Ll/vj5;

    .line 23
    .line 24
    iget-object v1, v1, Ll/vj5;->c:Ll/wzh0;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    if-eqz p0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 32
    .line 33
    iget-object p0, p0, Ll/qzg;->d:Ll/kh00;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/kh00;->I()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 40
    .line 41
    iget-object p0, p0, Ll/qzg;->d:Ll/kh00;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/wzh0;->deleteAll()V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 47
    .line 48
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->SETTINGS_MUTED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->SETTINGS_VISIBILITY:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 57
    .line 58
    const-string v2, "everyone"

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 73
    .line 74
    .line 75
    :goto_0
    new-instance p0, Ll/nu9;

    .line 76
    .line 77
    invoke-direct {p0}, Ll/nu9;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic Z0(Lcom/p1/mobile/putong/feed/api/b;Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->N3(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 4

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic a1(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/dog;->z:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/dog;->x(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic a2(Ll/qcj;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/wy9;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wy9;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "moment_activities"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iput-object p0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    sget-object p0, Ll/uqb0;->k0:Ll/vj5;

    .line 17
    .line 18
    iget-object p0, p0, Ll/vj5;->c:Ll/wzh0;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 31
    .line 32
    iget-object v1, v1, Ll/qzg;->f:Ll/wzh0;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 38
    .line 39
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/wzh0;->insert(Lcom/tantanapp/common/data/DbObject;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic d1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->t3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e1()Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/qw9;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/qw9;-><init>()V

    .line 6
    .line 7
    .line 8
    sget v2, Ll/dog;->D:I

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/rw9;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/rw9;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    return-object v0
.end method

.method public static synthetic e2(ILjava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-le v0, p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0, p0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    return-object p1
.end method

.method public static synthetic f1(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic f2(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/util/List;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/uw9;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uw9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 23
    .line 24
    iget-object v1, v1, Ll/qzg;->c:Ll/cr00;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 27
    .line 28
    new-instance v2, Ll/vy9;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/vy9;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v1, p1, p0, v2}, Ll/cr00;->P(Ljava/lang/String;Ljava/util/List;Z)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 42
    .line 43
    iget-object p0, p0, Ll/qzg;->e:Ll/wzh0;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic h1()Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->c:Ll/wzh0;

    .line 4
    .line 5
    const-string v1, "moment_activities"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 20
    .line 21
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    new-instance v1, Ll/ti20;

    .line 28
    .line 29
    new-instance v2, Ll/ay9;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Ll/ay9;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget v0, Ll/dog;->D:I

    .line 35
    .line 36
    invoke-direct {v1, v2, v0}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/by9;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/by9;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    return-object v0

    .line 57
    :cond_1
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 58
    .line 59
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    return-object v0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->O3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i1(Ljava/lang/String;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 8
    .line 9
    const-string v2, "{\"read\": true}"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "&method=patch"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j1(Lcom/p1/mobile/putong/data/Envelope;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/dog;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

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

.method public static synthetic j2(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_a

    .line 8
    .line 9
    invoke-static {}, Ll/mrb0;->o()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x0

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-wide v4, v0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 32
    .line 33
    invoke-static {v4, v5}, Ll/dog;->s0(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {}, Ll/dog;->r0()D

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    :goto_0
    iput-wide v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    const-string v0, ""

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_8

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_9

    .line 105
    .line 106
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 111
    .line 112
    invoke-static {v2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->a0(Lcom/p1/mobile/putong/data/Media;)V

    .line 113
    .line 114
    .line 115
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 116
    .line 117
    const-string v5, "raw"

    .line 118
    .line 119
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    if-eqz v4, :cond_2

    .line 124
    .line 125
    instance-of v4, v2, Lcom/p1/mobile/putong/data/Picture;

    .line 126
    .line 127
    if-eqz v4, :cond_4

    .line 128
    .line 129
    move-object v4, v2

    .line 130
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 131
    .line 132
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 133
    .line 134
    if-eqz v5, :cond_3

    .line 135
    .line 136
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 137
    .line 138
    if-nez v5, :cond_2

    .line 139
    .line 140
    :cond_3
    new-instance v5, Ll/sim;

    .line 141
    .line 142
    iget-object v6, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v6}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    invoke-direct {v5, v6}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    new-instance v6, Lcom/p1/mobile/putong/data/Dimension;

    .line 152
    .line 153
    iget-object v7, v5, Ll/sim;->d:[I

    .line 154
    .line 155
    invoke-direct {v6, v7}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 156
    .line 157
    .line 158
    iput-object v6, v4, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 159
    .line 160
    iget-object v4, v5, Ll/sim;->c:Ljava/lang/String;

    .line 161
    .line 162
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_4
    instance-of v4, v2, Lcom/p1/mobile/putong/data/Video;

    .line 166
    .line 167
    if-eqz v4, :cond_2

    .line 168
    .line 169
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 170
    .line 171
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 172
    .line 173
    if-eqz v4, :cond_5

    .line 174
    .line 175
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 176
    .line 177
    if-eqz v4, :cond_5

    .line 178
    .line 179
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 180
    .line 181
    if-eqz v5, :cond_5

    .line 182
    .line 183
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v5, :cond_5

    .line 186
    .line 187
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 188
    .line 189
    if-nez v4, :cond_2

    .line 190
    .line 191
    :cond_5
    new-instance v4, Ll/wel0;

    .line 192
    .line 193
    new-instance v5, Ll/vel0;

    .line 194
    .line 195
    iget-object v6, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v6}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    invoke-direct {v5, v6}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {v4, v5, v3, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 205
    .line 206
    .line 207
    const-string v5, "video/mp4"

    .line 208
    .line 209
    iput-object v5, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 210
    .line 211
    new-instance v5, Lcom/p1/mobile/putong/data/Dimension;

    .line 212
    .line 213
    invoke-virtual {v4}, Ll/wel0;->m()[I

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    invoke-direct {v5, v6}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 218
    .line 219
    .line 220
    iput-object v5, v2, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 221
    .line 222
    iget-wide v5, v4, Ll/wel0;->b:J

    .line 223
    .line 224
    long-to-float v5, v5

    .line 225
    iput v5, v2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 226
    .line 227
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 228
    .line 229
    if-eqz v5, :cond_6

    .line 230
    .line 231
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 232
    .line 233
    if-nez v5, :cond_7

    .line 234
    .line 235
    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 236
    .line 237
    .line 238
    move-result-wide v5

    .line 239
    iput-wide v5, v2, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 240
    .line 241
    new-instance v5, Lcom/p1/mobile/putong/data/Picture;

    .line 242
    .line 243
    invoke-direct {v5}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 244
    .line 245
    .line 246
    iput-object v5, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 247
    .line 248
    :try_start_0
    invoke-virtual {v4, v3}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    invoke-static {v6}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 257
    .line 258
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 259
    .line 260
    new-instance v6, Lcom/p1/mobile/putong/data/Dimension;

    .line 261
    .line 262
    invoke-virtual {v4}, Ll/wel0;->k()[I

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    invoke-direct {v6, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 267
    .line 268
    .line 269
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 270
    .line 271
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 272
    .line 273
    const-string v5, "image/jpeg"

    .line 274
    .line 275
    iput-object v5, v4, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 276
    .line 277
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 278
    .line 279
    iget-object v5, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v4, v5}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    :cond_7
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 285
    .line 286
    invoke-static {}, Ll/ecj;->I()Ljava/io/File;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v5

    .line 294
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result v4

    .line 298
    if-eqz v4, :cond_2

    .line 299
    .line 300
    :try_start_1
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 307
    .line 308
    sget-object v6, Ll/ecj;->d:Ljava/lang/String;

    .line 309
    .line 310
    iget-object v7, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 311
    .line 312
    invoke-static {v4, v5, v6, v7, v3}, Ll/ecj;->N(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    aget-object v5, v4, v3

    .line 317
    .line 318
    iput-object v5, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    aget-object v4, v4, v1

    .line 325
    .line 326
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 327
    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :catch_0
    move-exception v2

    .line 331
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    goto/16 :goto_1

    .line 335
    .line 336
    :catch_1
    move-exception p0

    .line 337
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 338
    .line 339
    .line 340
    new-instance v0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;

    .line 341
    .line 342
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 351
    .line 352
    .line 353
    throw v0

    .line 354
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    .line 355
    .line 356
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 357
    .line 358
    .line 359
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 360
    .line 361
    :cond_9
    new-instance v0, Ll/pf60;

    .line 362
    .line 363
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 368
    .line 369
    .line 370
    invoke-static {v0}, Ll/k110;->d(Ll/pf60;)V

    .line 371
    .line 372
    .line 373
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    new-instance v1, Ll/hx9;

    .line 378
    .line 379
    invoke-direct {v1, p0}, Ll/hx9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 380
    .line 381
    .line 382
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 383
    .line 384
    .line 385
    return-object p0

    .line 386
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 391
    .line 392
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    check-cast v0, Ljava/lang/Integer;

    .line 397
    .line 398
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 403
    .line 404
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    new-instance v1, Ll/ix9;

    .line 409
    .line 410
    invoke-direct {v1, p0}, Ll/ix9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 414
    .line 415
    .line 416
    return-object p0
.end method

.method public static synthetic k1(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->p3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;Landroid/util/SparseArray;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->v3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;Landroid/util/SparseArray;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->k3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/dog;->y()Ljava/lang/String;

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
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic m2(Ljava/util/Map;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/OnVoiceCall;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;->user:Lcom/p1/mobile/putong/feed/data/Reference;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Reference;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/OnVoiceCall;->user:Lcom/p1/mobile/putong/feed/data/Reference;

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Reference;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 24
    .line 25
    invoke-virtual {p1, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic n1(Lcom/p1/mobile/putong/data/VoiceLiveGame;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic o1(Lcom/p1/mobile/putong/feed/api/b;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->j3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o2(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/ly9;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ly9;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/my9;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/my9;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lrx/c;->dematerialize()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic p1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, p2}, Ll/dog;->C(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic p2(Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/hw9;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/hw9;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v2, Ll/dog;->D:I

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/iw9;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/iw9;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic q1(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->y3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    instance-of v2, v2, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 31
    .line 32
    const-string v3, "preprocessed"

    .line 33
    .line 34
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    :try_start_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 59
    .line 60
    sget-object v4, Ll/ecj;->d:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-static {v2, v3, v4, p0, v5}, Ll/ecj;->N(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    aget-object v3, p0, v1

    .line 76
    .line 77
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    aget-object p0, p0, v5

    .line 90
    .line 91
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :catch_0
    move-exception p0

    .line 95
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    :goto_0
    new-instance p0, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 101
    .line 102
    .line 103
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance p1, Ll/gx9;

    .line 110
    .line 111
    invoke-direct {p1, v0}, Ll/gx9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ll/l9c;->B(Ll/x20;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static synthetic r1(Lcom/p1/mobile/putong/feed/data/VoiceLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic s1(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->E3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/data/Room;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Room;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iput-object p0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 24
    .line 25
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 31
    .line 32
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Cb(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic t1(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ux9;

    .line 6
    .line 7
    invoke-direct {v1, p1, p0}, Ll/ux9;-><init>(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, p1, v1, p0, v2}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 16
    .line 17
    return-object p0
.end method

.method public static synthetic t2(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic u0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of p1, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/pu9;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/pu9;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/l9c;->B(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic u1(Lcom/p1/mobile/putong/data/LiveUserMask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u2(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/b;->Q3(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/k110;->d(Ll/pf60;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/yx9;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/yx9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/l9c;->B(Ll/x20;)V

    .line 35
    .line 36
    .line 37
    return-object p0
.end method

.method public static synthetic v1(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "moment_activities"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    sget-object v1, Ll/uqb0;->k0:Ll/vj5;

    .line 17
    .line 18
    iget-object v1, v1, Ll/vj5;->c:Ll/wzh0;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 21
    .line 22
    .line 23
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 32
    .line 33
    iget-object v0, v0, Ll/qzg;->d:Ll/kh00;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 36
    .line 37
    new-instance v1, Ll/gy9;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/gy9;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Ll/kh00;->H(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/api/b;->H3(Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w1(Ljava/lang/String;Ljava/lang/String;Z)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1}, Ll/dog;->D(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    const-string p2, ""

    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/x1d0$a;->m(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/x1d0$a;->d()Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic w2(Lcom/p1/mobile/putong/data/DbLinks;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/dog;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 10
    .line 11
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/wzh0;->query(J)Lcom/tantanapp/common/data/DbObject;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 26
    .line 27
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic x1(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0}, Ll/dog;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic x2(Lcom/p1/mobile/putong/data/DbLinks;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Ll/dog;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic y0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->delete(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->n6(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic y1(ZLcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/uy9;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/uy9;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic y2(Ljava/util/List;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)Ljava/util/List;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    sget-object v1, Ll/ecj;->d:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/ecj;->G(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-object p2
.end method

.method public static synthetic z0(Ljava/lang/String;Lrx/Notification;)Lrx/Notification;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lrx/Notification;->e()Ljava/lang/Throwable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v0, v0, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-object p1

    .line 23
    :cond_1
    :goto_0
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 24
    .line 25
    iget-object p1, p1, Ll/vj5;->c:Ll/wzh0;

    .line 26
    .line 27
    const-string v0, "moment_activities"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/DbLinks;

    .line 34
    .line 35
    invoke-static {p0}, Ll/mrb0;->T(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 40
    .line 41
    sub-int/2addr v1, v0

    .line 42
    const/4 v2, 0x0

    .line 43
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->extra:I

    .line 48
    .line 49
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/mu9;

    .line 54
    .line 55
    invoke-direct {v2, p0, v0, p1}, Ll/mu9;-><init>(Ljava/lang/String;ILcom/p1/mobile/putong/data/DbLinks;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/l9c;->B(Ll/x20;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 62
    .line 63
    invoke-static {p0}, Lrx/Notification;->c(Ljava/lang/Object;)Lrx/Notification;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public static synthetic z1(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/dog;->z:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/dog;->x(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic z2(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/b;->Q3(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final synthetic A3(Lcom/p1/mobile/putong/data/DbLinks;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/yy9;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/yy9;-><init>(Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 6
    .line 7
    .line 8
    sget p1, Ll/dog;->D:I

    .line 9
    .line 10
    sget v2, Ll/dog;->E:I

    .line 11
    .line 12
    or-int/2addr p1, v2

    .line 13
    invoke-direct {v0, v1, p1}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/zy9;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/zy9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic B3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->p4(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 34
    .line 35
    iget-object p1, p1, Ll/qzg;->e:Ll/wzh0;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic C3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/sx9;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1, p2}, Ll/sx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {v0, p2, v1, p0, p1}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 39
    .line 40
    return-object p0
.end method

.method public final synthetic D3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/aw9;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/aw9;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget p1, Ll/dog;->D:I

    .line 9
    .line 10
    invoke-direct {v0, v1, p1}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ll/bw9;

    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Ll/bw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic E3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->o4()Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 16
    .line 17
    iget-object p1, p1, Ll/vj5;->c:Ll/wzh0;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic F3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/su9;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/su9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v0, p1, v1, p0, v2}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 39
    .line 40
    return-object p0
.end method

.method public final synthetic G3(Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;J)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/qy9;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/qy9;-><init>(Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 6
    .line 7
    .line 8
    sget p1, Ll/dog;->D:I

    .line 9
    .line 10
    sget v2, Ll/dog;->E:I

    .line 11
    .line 12
    or-int/2addr p1, v2

    .line 13
    invoke-direct {v0, v1, p1}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/ry9;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/ry9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/ty9;

    .line 34
    .line 35
    invoke-direct {p1, p2, p3, p4}, Ll/ty9;-><init>(Ljava/lang/String;J)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public final synthetic H3(Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/feed/helper/exception/MomentPostFailedExcepion;->reportMomentPostFailed(Ljava/lang/Throwable;Z)V

    .line 3
    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    const-string v0, "unknow"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    const-string v1, "error"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_post_moment_error"

    .line 25
    .line 26
    const-string v2, "post_error_moments"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/pf60;

    .line 32
    .line 33
    const/4 v1, 0x5

    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/k110;->d(Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    const-string v0, ""

    .line 52
    .line 53
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b;->H:Lrx/subjects/b;

    .line 57
    .line 58
    invoke-virtual {p0, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance p0, Ll/vw9;

    .line 62
    .line 63
    invoke-direct {p0, p3}, Ll/vw9;-><init>(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 70
    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    check-cast p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 74
    .line 75
    iget p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 76
    .line 77
    const p1, 0x9c69

    .line 78
    .line 79
    .line 80
    if-ne p0, p1, :cond_2

    .line 81
    .line 82
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance p1, Ll/ww9;

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ll/ww9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/l9c;->B(Ll/x20;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    new-instance p1, Ll/xw9;

    .line 100
    .line 101
    invoke-direct {p1, p2}, Ll/xw9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/l9c;->B(Ll/x20;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final synthetic I3(Ll/y20;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/qv9;

    .line 2
    .line 3
    invoke-direct {v0, p3, p1, p2}, Ll/qv9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "postTheMoment"

    .line 7
    .line 8
    const/4 p2, -0x1

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic J3(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 4
    .line 5
    iget-object v0, v0, Ll/qzg;->c:Ll/cr00;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/lu9;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/lu9;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2}, Ll/cr00;->N(Ljava/util/List;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->o4()Lcom/p1/mobile/putong/data/DbLinks;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 56
    .line 57
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    :goto_0
    new-instance p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 72
    .line 73
    const-string p1, "moments"

    .line 74
    .line 75
    iput-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    :cond_3
    :goto_1
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 78
    .line 79
    iget-object p1, p1, Ll/vj5;->c:Ll/wzh0;

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic K3(ZLcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/j4h;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/api/b;->u4(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/xy9;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2}, Ll/xy9;-><init>(Lcom/p1/mobile/putong/feed/api/b;ZLcom/p1/mobile/putong/data/Envelope;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {v0, p2, v1, p0, p1}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 25
    .line 26
    return-object p0
.end method

.method public final synthetic L3(ZLjava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-lez p2, :cond_0

    .line 11
    .line 12
    const-string p2, "&"

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    :cond_0
    const-string p2, "query=preload"

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Ll/dog;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v0, Ll/ti20;

    .line 31
    .line 32
    new-instance v1, Ll/dy9;

    .line 33
    .line 34
    invoke-direct {v1, p2}, Ll/dy9;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget p2, Ll/dog;->D:I

    .line 38
    .line 39
    sget v2, Ll/dog;->E:I

    .line 40
    .line 41
    or-int/2addr p2, v2

    .line 42
    invoke-direct {v0, v1, p2}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/ey9;

    .line 46
    .line 47
    invoke-direct {p2, p0, p1}, Ll/ey9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final synthetic M3(Z)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/sw9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/sw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/tw9;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/tw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic N3(Z)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->o4()Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const-string p0, "limit=20"

    .line 18
    .line 19
    return-object p0
.end method

.method public O2()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mrb0;->E()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/uqb0;->k0:Ll/vj5;

    .line 6
    .line 7
    iget-object v1, v1, Ll/vj5;->c:Ll/wzh0;

    .line 8
    .line 9
    const-string v2, "moment_activities"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/zw9;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/zw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/Envelope;->addAll(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p2, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->r4(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public P2(Ll/vg60;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/api/b;->T2(ZLl/vg60;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public P3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "/moments/latest"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ku9;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/ku9;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public Q2()Lrx/c;
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
    new-instance v0, Ll/nw9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nw9;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "activity/poll"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public R2(Ll/vg60;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/api/b;->T2(ZLl/vg60;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public R3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/moments/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/likes/me"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/mv9;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2, p3}, Ll/mv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    const/4 p1, -0x1

    .line 26
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public S2()Lrx/c;
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
    new-instance v0, Ll/ov9;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ov9;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "activity/poll"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public S3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "moments/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/likes/next"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/qx9;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/qx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public T2(ZLl/vg60;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p2}, Ll/jyb;->F(Ljava/util/List;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 8
    .line 9
    invoke-static {}, Ll/mrb0;->d()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/cw9;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Ll/cw9;-><init>(ZLcom/p1/mobile/putong/feed/data/MomentActivity;)V

    .line 15
    .line 16
    .line 17
    const-string p1, "activity_patch"

    .line 18
    .line 19
    const/4 p2, -0x1

    .line 20
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public T3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const-string p0, ""

    .line 18
    .line 19
    return-object p0
.end method

.method public U2(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public U3()Lcom/p1/mobile/putong/data/DbLinks;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vj5;->c:Ll/wzh0;

    .line 4
    .line 5
    const-string v0, "moments"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    return-object p0
.end method

.method public V2(Lcom/p1/mobile/putong/feed/data/VoiceLive;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public V3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->e:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    return-object p0
.end method

.method public W2(Ljava/lang/String;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/mrb0;->b(Ljava/lang/String;I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-lez p2, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/fw9;

    .line 8
    .line 9
    invoke-direct {v1, p2}, Ll/fw9;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 17
    .line 18
    iget-object p2, p2, Ll/qzg;->e:Ll/wzh0;

    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/gw9;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/gw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p1, p2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public W3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/yw9;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/yw9;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public X2(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ll/iv9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p3, p2}, Ll/iv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p2, v0, v1}, Ll/mrb0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    return-object p0
.end method

.method public Y2(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->queryCache(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    return-object p0
.end method

.method public Y3()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j4h;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "moments"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/mrb0;->G()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v2, Ll/uqb0;->k0:Ll/vj5;

    .line 14
    .line 15
    iget-object v2, v2, Ll/vj5;->c:Ll/wzh0;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/api/b;->K:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Ll/lw9;

    .line 32
    .line 33
    invoke-direct {v3, p0}, Ll/lw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    invoke-static {}, Ll/mrb0;->G()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v2, Ll/uqb0;->k0:Ll/vj5;

    .line 46
    .line 47
    iget-object v2, v2, Ll/vj5;->c:Ll/wzh0;

    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/mw9;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/mw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public Z2(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "moments/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/comments/next"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/xx9;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2}, Ll/xx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public Z3(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/mrb0;->H(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 6
    .line 7
    iget-object v1, v1, Ll/qzg;->e:Ll/wzh0;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/ow9;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1}, Ll/ow9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public a3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/api/b;->Y2(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public a4()Lrx/c;
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->U3()Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Ll/nx9;

    .line 22
    .line 23
    invoke-direct {v1, p0, v0}, Ll/nx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "moments/next"

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {p0, v0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->just()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public b3(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "moment_comment"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iput-object p0, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-static {p1, p2, p0}, Ll/mrb0;->D(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public b4(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->V3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Links;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    sget-object v2, Ll/dog;->z:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/dog;->x(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, "/moments/next"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ll/lv9;

    .line 61
    .line 62
    invoke-direct {v2, p0, v0, p1}, Ll/lv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    invoke-virtual {p0, v1, p1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->just()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public c3(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/mrb0;->h(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 6
    .line 7
    iget-object v1, v1, Ll/qzg;->f:Ll/wzh0;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, p1, v2}, Ll/wzh0;->uiGet(Ljava/lang/String;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v1, Ll/rv9;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/rv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p1, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public c4(Ljava/lang/String;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->U3()Lcom/p1/mobile/putong/data/DbLinks;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, v2, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ll/vx9;

    .line 26
    .line 27
    move-object v1, p0

    .line 28
    move-object v3, p1

    .line 29
    invoke-direct/range {v0 .. v5}, Ll/vx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;J)V

    .line 30
    .line 31
    .line 32
    const-string p0, "moments/next"

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {v1, p0, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_0
    move-object v1, p0

    .line 41
    invoke-virtual {v1}, Lcom/tantanapp/common/network/RunnerProxy;->just()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public d3(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    .line 50
    invoke-interface {v1, v0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->i8(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_0

    .line 69
    .line 70
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    new-instance p1, Ll/mx9;

    .line 75
    .line 76
    invoke-direct {p1}, Ll/mx9;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-object p0
.end method

.method public final d4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Room;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Room;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/av9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/av9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/bv9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/bv9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public e3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_1

    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/helper/MomentUserNullException;

    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string p5, "Moment id: "

    .line 9
    .line 10
    invoke-direct {p2, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p5

    .line 17
    if-eqz p5, :cond_0

    .line 18
    .line 19
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p0, "from:"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, "\nActStackInfo:"

    .line 33
    .line 34
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/helper/exception/FeedException;->getActStackInfo()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p0, "\n Trace: "

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    new-instance p0, Ljava/lang/Exception;

    .line 50
    .line 51
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/helper/exception/FeedException;->getTrace(Ljava/lang/Exception;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/helper/MomentUserNullException;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0x64

    .line 69
    .line 70
    invoke-static {p1, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_2

    .line 85
    .line 86
    iget-object p0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    :cond_2
    move-object v3, p0

    .line 89
    const/4 v7, 0x0

    .line 90
    move-object v1, p1

    .line 91
    move-object v4, p3

    .line 92
    move-object v5, p4

    .line 93
    move-object v6, p5

    .line 94
    move v8, p6

    .line 95
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ij(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final e4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/cv9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/cv9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/dv9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/dv9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    invoke-static {p4}, Ll/ksg;->C(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v4, p4

    .line 10
    move v6, p5

    .line 11
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/api/b;->e3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/jv9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/jv9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/kv9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/kv9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public g3(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fx9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/fx9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "delete"

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final g4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VoiceLiveGame;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/VoiceLiveGame;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/fv9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/fv9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/hv9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/hv9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public h3(J)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/gv9;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/gv9;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final h4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VoiceRoomInfo;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/VoiceRoomInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/tu9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/tu9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/uu9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/uu9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public i3(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mrb0;->t(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final i4(Ljava/util/List;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/wu9;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/wu9;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/xu9;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/xu9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, p0, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic j3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public j4(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/api/b;->k4(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final synthetic k3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k4(Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/pf60;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-direct {v1, v3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/k110;->d(Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/putong/feed/data/MomentSettings;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v3, "matches"

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iput-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 34
    .line 35
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 36
    .line 37
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 44
    .line 45
    new-instance v1, Ll/tv9;

    .line 46
    .line 47
    invoke-direct {v1, p1}, Ll/tv9;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/ew9;

    .line 51
    .line 52
    invoke-direct {v2, v0, p1}, Ll/ew9;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 53
    .line 54
    .line 55
    new-instance v3, Ll/pw9;

    .line 56
    .line 57
    invoke-direct {v3, p0, p2, p1}, Ll/pw9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 58
    .line 59
    .line 60
    new-instance v4, Ll/ax9;

    .line 61
    .line 62
    invoke-direct {v4, p0, p2, v3}, Ll/ax9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ll/y20;Ll/y20;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    check-cast p2, Lrx/c;

    .line 70
    .line 71
    new-instance v1, Ll/lx9;

    .line 72
    .line 73
    invoke-direct {v1, v0}, Ll/lx9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    new-instance v1, Ll/wx9;

    .line 81
    .line 82
    invoke-direct {v1, v2}, Ll/wx9;-><init>(Ll/qcj;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    new-instance v1, Ll/hy9;

    .line 90
    .line 91
    invoke-direct {v1, v0}, Ll/hy9;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 99
    .line 100
    new-instance v1, Ll/sy9;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/sy9;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v2, "moment"

    .line 106
    .line 107
    invoke-static {v2, p1, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p2, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1, v3}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    new-instance p2, Ll/dz9;

    .line 128
    .line 129
    invoke-direct {p2, v0}, Ll/dz9;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    new-instance p2, Ll/vu9;

    .line 137
    .line 138
    invoke-direct {p2, v4}, Ll/vu9;-><init>(Ll/qcj;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0
.end method

.method public final synthetic l3(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->n4(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/orb0;->L(Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 23
    .line 24
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 48
    .line 49
    iget-object p1, p1, Ll/qzg;->c:Ll/cr00;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ll/wzh0;->updateBy_id(Lcom/tantanapp/common/data/DbObject;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public l4(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "/moments/previous"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pv9;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/pv9;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->n4(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    iget p1, p2, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 20
    .line 21
    iget-object p1, p1, Ll/qzg;->f:Ll/wzh0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public m4(Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/api/b;->L:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p1, v0

    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 12
    :goto_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/api/b;->L:Z

    .line 13
    .line 14
    new-instance v1, Ll/nv9;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Ll/nv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Z)V

    .line 17
    .line 18
    .line 19
    const-string p1, "moments/previous"

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic n3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/qu9;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/qu9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    return-object p0
.end method

.method public n4(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->f:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic o3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->a3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/ti20;

    .line 12
    .line 13
    new-instance v2, Ll/jy9;

    .line 14
    .line 15
    invoke-direct {v2, p1, p2, v0}, Ll/jy9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget p1, Ll/dog;->D:I

    .line 19
    .line 20
    invoke-direct {v1, v2, p1}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/ky9;

    .line 24
    .line 25
    invoke-direct {p1, p0, p2}, Ll/ky9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public o4()Lcom/p1/mobile/putong/data/DbLinks;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vj5;->c:Ll/wzh0;

    .line 4
    .line 5
    const-string v0, "moments"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic p3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p4(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DbLinks;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->e:Ll/wzh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic q3(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->q4(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 18
    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    iput v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    if-nez p1, :cond_1

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 47
    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    iput v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v0, v1}, Ll/jyb;->c(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 69
    .line 70
    :cond_1
    :goto_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 71
    .line 72
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Cb(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 86
    .line 87
    iget-object p1, p1, Ll/qzg;->c:Ll/cr00;

    .line 88
    .line 89
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method

.method public q4(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzg;->c:Ll/cr00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic r3(Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/zx9;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Ll/zx9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p3, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-object p3
.end method

.method public final r4(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Ll/ti20;

    .line 15
    .line 16
    new-instance v1, Ll/ox9;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/ox9;-><init>(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/px9;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/px9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic s3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/xv9;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/xv9;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ti20;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/yv9;

    .line 12
    .line 13
    invoke-direct {v0, p0, p2, p3}, Ll/yv9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p0, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p2, Ll/zv9;

    .line 29
    .line 30
    invoke-direct {p2, p3, p1}, Ll/zv9;-><init>(ZLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public s4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "moment/refresh/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/fy9;

    .line 16
    .line 17
    invoke-direct {v1, p1, p2}, Ll/fy9;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, v0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic t3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->q4(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v1, Ll/ou9;

    .line 18
    .line 19
    invoke-direct {v1, p2, p0}, Ll/ou9;-><init>(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2, v1}, Ll/l9c;->v(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-lez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public t4(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Report;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/mrb0;->O(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic u3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/api/b;->T3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ti20;

    .line 6
    .line 7
    new-instance v2, Ll/az9;

    .line 8
    .line 9
    invoke-direct {v2, p1, p2, v0}, Ll/az9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v2}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/bz9;

    .line 16
    .line 17
    invoke-direct {p1, p0, p2}, Ll/bz9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final u4(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 14

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/api/b;->e4(Ljava/util/List;)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/api/b;->d4(Ljava/util/List;)Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/api/b;->i4(Ljava/util/List;)Ljava/util/Map;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 59
    .line 60
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 61
    .line 62
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/feed/api/b;->f4(Ljava/util/List;)Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    check-cast v5, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 71
    .line 72
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 73
    .line 74
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/feed/api/b;->h4(Ljava/util/List;)Ljava/util/Map;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    check-cast v6, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 83
    .line 84
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 85
    .line 86
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/feed/api/b;->g4(Ljava/util/List;)Ljava/util/Map;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 97
    .line 98
    new-instance v0, Landroid/util/SparseArray;

    .line 99
    .line 100
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    const/4 v8, 0x0

    .line 108
    :goto_0
    if-ge v8, v7, :cond_5

    .line 109
    .line 110
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    check-cast v9, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 115
    .line 116
    const-string v10, "live"

    .line 117
    .line 118
    iget-object v11, v9, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v10

    .line 124
    if-eqz v10, :cond_2

    .line 125
    .line 126
    iget-object v9, v9, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 127
    .line 128
    invoke-interface {v1, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v9

    .line 132
    check-cast v9, Lcom/p1/mobile/putong/data/Live;

    .line 133
    .line 134
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    if-eqz v10, :cond_4

    .line 139
    .line 140
    invoke-virtual {p0, v9}, Lcom/p1/mobile/putong/feed/api/b;->U2(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 141
    .line 142
    .line 143
    move-result-object v10

    .line 144
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 145
    .line 146
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 147
    .line 148
    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v9

    .line 152
    check-cast v9, Lcom/p1/mobile/putong/data/Room;

    .line 153
    .line 154
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v11

    .line 158
    if-eqz v11, :cond_1

    .line 159
    .line 160
    iget-object v11, v9, Lcom/p1/mobile/putong/data/Room;->title:Ljava/lang/String;

    .line 161
    .line 162
    iput-object v11, v10, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 163
    .line 164
    iput-object v9, v10, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 165
    .line 166
    const/4 v9, 0x1

    .line 167
    iput-boolean v9, v10, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 168
    .line 169
    iput-boolean v9, v10, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 170
    .line 171
    invoke-static {}, Ll/pzi0;->o()J

    .line 172
    .line 173
    .line 174
    move-result-wide v11

    .line 175
    long-to-double v11, v11

    .line 176
    iput-wide v11, v10, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 177
    .line 178
    :cond_1
    invoke-virtual {v0, v8, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_2
    const-string v10, "voiceLive"

    .line 183
    .line 184
    iget-object v11, v9, Lcom/p1/mobile/putong/feed/data/RawFeed;->type:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v10

    .line 190
    if-eqz v10, :cond_4

    .line 191
    .line 192
    iget-object v9, v9, Lcom/p1/mobile/putong/feed/data/RawFeed;->id:Ljava/lang/String;

    .line 193
    .line 194
    invoke-interface {v3, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    check-cast v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 199
    .line 200
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v10

    .line 204
    if-eqz v10, :cond_4

    .line 205
    .line 206
    invoke-virtual {p0, v9}, Lcom/p1/mobile/putong/feed/api/b;->V2(Lcom/p1/mobile/putong/feed/data/VoiceLive;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 207
    .line 208
    .line 209
    move-result-object v10

    .line 210
    new-instance v11, Ljava/util/HashMap;

    .line 211
    .line 212
    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 213
    .line 214
    .line 215
    iget-object v12, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 216
    .line 217
    iget-object v12, v12, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->onVoiceCalls:Ljava/util/List;

    .line 218
    .line 219
    new-instance v13, Ll/cz9;

    .line 220
    .line 221
    invoke-direct {v13, v4, v11}, Ll/cz9;-><init>(Ljava/util/Map;Ljava/util/HashMap;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v12, v13}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 225
    .line 226
    .line 227
    iput-object v11, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->masksMap:Ljava/util/Map;

    .line 228
    .line 229
    iget-object v11, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 230
    .line 231
    iget-object v11, v11, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 232
    .line 233
    invoke-interface {v5, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v11

    .line 237
    check-cast v11, Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 238
    .line 239
    invoke-static {v11}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v12

    .line 243
    if-eqz v12, :cond_3

    .line 244
    .line 245
    iput-object v11, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 246
    .line 247
    :cond_3
    iget-object v11, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 248
    .line 249
    invoke-interface {v6, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v11

    .line 253
    check-cast v11, Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 254
    .line 255
    iput-object v11, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceLiveGame:Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 256
    .line 257
    invoke-virtual {v0, v8, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 258
    .line 259
    .line 260
    :cond_4
    :goto_1
    add-int/lit8 v8, v8, 0x1

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/api/b;->K:Lrx/subjects/a;

    .line 265
    .line 266
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public final synthetic v3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;Landroid/util/SparseArray;)Ll/vg60;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    :cond_0
    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ll/hvf0;

    .line 14
    .line 15
    invoke-direct {v0, p1, p3}, Ll/hvf0;-><init>(Ljava/util/List;Landroid/util/SparseArray;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic w3(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->m4(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic x3(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->l4(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0, p2, p3}, Ll/dog;->q0(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)Ll/vg60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic y3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->o4()Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 16
    .line 17
    iget-object p1, p1, Ll/vj5;->c:Ll/wzh0;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic z3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/ru9;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/ru9;-><init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v0, p1, v1, p0, v2}, Ll/l9c;->w(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZ)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 39
    .line 40
    return-object p0
.end method
