.class public Lcom/p1/mobile/putong/core/newui/main/a;
.super Ll/k930;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/main/a$v;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k930<",
        "Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Ll/byd0;

.field public C:Ll/jxd0;

.field public D:Z

.field public E:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public F:Ll/kcg0;

.field public G:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public H:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ljava/lang/Runnable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public s:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation
.end field

.field public t:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public u:Lcom/p1/mobile/putong/app/PutongFrag;

.field public v:I

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/k930;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->t:Lrx/subjects/a;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->w:Z

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->z:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->A:Z

    .line 26
    .line 27
    new-instance p1, Ll/byd0;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "message_tips_text_update_time_"

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-wide/16 v1, 0x0

    .line 52
    .line 53
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->B:Ll/byd0;

    .line 61
    .line 62
    new-instance p1, Ll/jxd0;

    .line 63
    .line 64
    const-string v0, "static_hdr_info_reported"

    .line 65
    .line 66
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->C:Ll/jxd0;

    .line 72
    .line 73
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->E:Lrx/subjects/a;

    .line 78
    .line 79
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 86
    .line 87
    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/a;->k8(Lcom/p1/mobile/putong/newui/main/base/TabName;Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    return-void
.end method

.method public static synthetic A3(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->e8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic A4(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$a;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$a;->m(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic A5(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S7()V

    return-void
.end method

.method public static synthetic B2(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic B3(Lcom/p1/mobile/putong/data/OMSLauncherInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DeeplinkReport;->success:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/ok50;->g(Ljava/lang/String;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/DeeplinkReport;->failed:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/ok50;->g(Ljava/lang/String;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic B4(Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-double v0, v0

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic B5()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/oe30;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/oe30;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private B6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/xg30;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/xg30;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/yg30;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/yg30;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/zg30;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/zg30;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-static {}, Ll/gra;->e()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m0:Lrx/subjects/a;

    .line 57
    .line 58
    invoke-static {}, Ll/pzi0;->o()J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public static synthetic C2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->q8(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic C3(Ll/vg60;)V
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
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Ff(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C5()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/ue30;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/ue30;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic D2()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/a;->p(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->ke()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic D3(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S8()V

    return-void
.end method

.method public static synthetic D4(Lcom/p1/mobile/putong/core/newui/main/a;Ll/bkj0;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->s6(Ll/bkj0;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D5(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->initCameraSdk(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic E1(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/c;)Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic E2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->E8(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V

    return-void
.end method

.method public static synthetic E3(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sd8;->w3()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/sd8;->y3()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic E4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic E5(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic F1(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Q8(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic F2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/n46;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic F3(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q5()Lrx/c;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->P5()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic F4()Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic F5(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->s8(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic G4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/data/IntlTribeBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->z8(Lcom/p1/mobile/putong/core/data/IntlTribeBubble;)V

    return-void
.end method

.method public static synthetic G5(Lcom/p1/mobile/putong/data/User;)Ll/pf60;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getUserInfoForMarryStatus()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

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
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic H1(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Y7(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic H2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H3(Lcom/p1/mobile/putong/core/data/GreetingSummary;)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->k5()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmpg-double v0, v0, v2

    .line 16
    .line 17
    if-gtz v0, :cond_1

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 23
    .line 24
    const-string v1, "fake_conversation_greeting"

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/j;->F5(Lcom/p1/mobile/putong/core/data/GreetingSummary;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic H4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H5(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->U8(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic I1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, Ll/abe0;->g:Ljava/lang/String;

    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->m9:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic I2(Lcom/p1/mobile/putong/core/newui/main/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->a9(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic I3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

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

.method public static synthetic I4(Ljava/util/List;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->H5()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->t1:Lrx/subjects/a;

    .line 9
    .line 10
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic I5(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->M8(Ll/pf60;)V

    return-void
.end method

.method private I6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/jd30;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/jd30;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/kd30;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/kd30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static synthetic J1(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->T7(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic J2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->P7(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->m8(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic J4(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/n46;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic J5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->v8(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic K2(Lcom/p1/mobile/putong/core/data/InsertConversationsList;)Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/pd30;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/pd30;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic K3()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->M6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static synthetic K4(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->w2:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic K5()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method public static synthetic L1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic L4(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const-string p0, "swipe"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "message"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const-string p0, "me"

    .line 16
    .line 17
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/yd9;->l3(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic L5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->O8(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->r8(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic M5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N1()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->L6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static synthetic N2(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->R8()V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->I8(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic N5(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->N8(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->y8(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P1(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->o8(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic P2(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public static synthetic P3(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jan;->N3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic P4(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic P5(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic Q1(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->x8(Ll/pf60;)V

    return-void
.end method

.method public static synthetic Q2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->C8(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Q3(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic Q4(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic Q5(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R1(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic R2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->F8(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic R5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S1(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    sget-boolean p0, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->K8(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/prp0;->i()Ll/prp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/prp0;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic S4(Ll/pf60;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Ll/dkb;->b8(Z)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public static synthetic S5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T1(Ljava/util/List;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/m;->S3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic T2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/core/newui/main/a;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->V7(Ll/ovb0;)V

    return-void
.end method

.method public static synthetic T4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 4
    .line 5
    iget-object p0, p0, Ll/n87;->S:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic T5(Lcom/p1/mobile/putong/data/VerificationNetworkData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VerificationNetworkData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VerificationNetworkData;->data:Lcom/p1/mobile/putong/data/VerificationData;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private synthetic T8(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p1, 0x0

    .line 6
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->x:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic U1(Lcom/p1/mobile/putong/core/newui/main/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->P8(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Y8(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/putong/core/newui/main/a;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->h8(Lrx/Notification;)V

    return-void
.end method

.method public static synthetic U4(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->d9(Ll/pf60;)V

    return-void
.end method

.method public static synthetic U5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ln40;->f()Ll/ln40;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ln40;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic V1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V2(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->G1:Ll/cob;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cob;->h3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic V3(Ljava/util/List;)Ll/uxj0;
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ed30;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ed30;-><init>(Ljava/util/List;)V

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

.method public static synthetic V4(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static bridge synthetic V5(Lcom/p1/mobile/putong/core/newui/main/a;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->F:Ll/kcg0;

    return-object p0
.end method

.method public static synthetic W1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/newui/main/a;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/a;->b9(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)V

    return-void
.end method

.method public static synthetic W5(Lcom/p1/mobile/putong/core/newui/main/a;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private W6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/t;->k3()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic X1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X2()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 4
    .line 5
    const/16 v1, 0x9

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/p4a;->i3(I)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Z8(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->t8(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic X5(Lcom/p1/mobile/putong/core/newui/main/a;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const-string v1, "fake_conversation_profile_featured"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ef(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic Y2(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Y3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->W8(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Z1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/jpd0;->e()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->u8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic Z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/qam;->h()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/jan;->N3()Lrx/c;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->o()Ll/vxd0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;->hierarchy:Lcom/p1/mobile/putong/core/data/UserLiveGradeData;

    .line 8
    .line 9
    iget v2, v2, Lcom/p1/mobile/putong/core/data/UserLiveGradeData;->grade:I

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->j()Ll/vxd0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserLiveHierarchy;->anchorHierarchy:Lcom/p1/mobile/putong/core/data/UserLiveGradeData;

    .line 23
    .line 24
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserLiveGradeData;->grade:I

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->f9(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->d8(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->X7(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->X8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic b5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/data/IntlTribeBubble;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->seeCount:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->tribeCount:I

    .line 8
    .line 9
    if-lez v1, :cond_1

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->seeTribeCount:I

    .line 14
    .line 15
    if-ne v1, p0, :cond_1

    .line 16
    .line 17
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/m;->z3()Lrx/subjects/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/m;->z3()Lrx/subjects/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic c4(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_1

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/qa9;->A3()Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/joa;->f4()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->userId:Ljava/lang/String;

    .line 38
    .line 39
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->timestamp:J

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3}, Ll/qa9;->C3(Ljava/lang/String;J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/qap$a;->o()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, ""

    .line 58
    .line 59
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rp(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/qa9;->q3()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/pzi0;->o()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    invoke-virtual {p0, v0, v1}, Ll/qap$a;->t(J)V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method

.method public static synthetic c5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->U7(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic d2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d3(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/prp0;->i()Ll/prp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/prp0;->o()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/prp0;->i()Ll/prp0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/prp0;->q()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->A8(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic d5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->D8(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic e4(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "audit"

    .line 6
    .line 7
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const-string v1, "auditing"

    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "pending"

    .line 22
    .line 23
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    const-string v1, "denied"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Ljava/lang/CharSequence;

    .line 58
    .line 59
    const-string v0, "marryMode"

    .line 60
    .line 61
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 72
    .line 73
    const-string v0, "loveMode"

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    iget-object p0, p0, Ll/dkb;->F1:Lrx/subjects/b;

    .line 83
    .line 84
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public static synthetic e5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f2(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->R7()V

    return-void
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/core/newui/main/a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Z7(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f4(Lcom/p1/mobile/putong/core/data/RegionRule;)V
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 15
    .line 16
    const-string v3, "GDPR"

    .line 17
    .line 18
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/RegionRuleTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/RegionRuleTag;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 29
    .line 30
    const-string v3, "CCPA"

    .line 31
    .line 32
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/RegionRuleTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/RegionRuleTag;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    :cond_1
    move v0, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    move v0, v1

    .line 45
    :goto_0
    invoke-static {v0}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->z(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->tags:Ljava/util/List;

    .line 57
    .line 58
    const-string v3, "BS"

    .line 59
    .line 60
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/RegionRuleTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/RegionRuleTag;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    move v1, v2

    .line 71
    :cond_3
    invoke-static {v1}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->y(Z)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Ll/hbs;->a()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->liveRegionTag:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 93
    .line 94
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->rk(Lcom/p1/mobile/putong/data/LiveRegionTag;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    :try_start_0
    const-string v0, "live_region"

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/RegionRule;->liveRegionTag:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {v0, p0}, Ll/uqb0;->X0(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :catch_0
    move-exception p0

    .line 110
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/dkb;->ca()Lrx/c;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static synthetic f5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->J8(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/m;->R3(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/VerificationNetworkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->w8(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V

    return-void
.end method

.method public static synthetic g5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Uf()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->g8(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic h3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h4(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic h5(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->a8(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic i3(Ljava/lang/Double;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Pg(D)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic i4(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v0, v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Ll/hcm;->E(Z)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ll/hcm;->F(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic i5(Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->limitedTrialSee:Lcom/p1/mobile/putong/core/data/LimitedTrialSee;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LimitedTrialSee;->actorId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 57
    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 59
    .line 60
    iget-object v1, v1, Ll/il8;->m:Ll/mm6;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-void
.end method

.method public static synthetic j2(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/g6v;->f()Ll/g6v;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/g6v;->n(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic j4(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->e9(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/data/RiskSelfData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->B8(Lcom/p1/mobile/putong/core/data/RiskSelfData;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->b8(Ll/pf60;)V

    return-void
.end method

.method public static synthetic k4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic k5(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l3(Lrx/c;)Lrx/c;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/m;->S3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->S6()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/zd30;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/zd30;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic l4(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

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
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long v0, v0, v2

    .line 20
    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    invoke-virtual {v0, v1, v2}, Ll/l99;->A3(J)Lrx/c;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 45
    .line 46
    const-string v1, ""

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    invoke-virtual {v0, v1, v2, v3}, Ll/l99;->y3(Ljava/lang/String;J)Lrx/c;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/android/billingclient/api/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->f8(Lcom/android/billingclient/api/a;)V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;Ll/f7s;Ll/uxj0;)Ll/ovb0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m4(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->m()Z

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

.method public static synthetic m5()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sd8;->m3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/core/data/GreetingSummary;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    const-string v1, "fake_conversation_anonymous_greeting"

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/j;->F5(Lcom/p1/mobile/putong/core/data/GreetingSummary;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic n4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o2(Ll/vg60;)Ljava/lang/Double;
    .locals 2

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
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 32
    .line 33
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static synthetic o3(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 17
    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/api/m;->R3(Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->userID:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    iget v0, v0, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->unReadCount:I

    .line 39
    .line 40
    if-gtz v0, :cond_1

    .line 41
    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 45
    .line 46
    if-gtz p0, :cond_2

    .line 47
    .line 48
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/m;->R3(Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/api/m;->R3(Z)V

    .line 62
    .line 63
    .line 64
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->A2()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic o4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->j8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p2(Ll/mge$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "conversation"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/BannerLoc;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BannerLoc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/mge;->k(Lcom/p1/mobile/putong/data/BannerLoc;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic p3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p5(Ll/no7$a;)V
    .locals 7

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
    iget-object v0, p0, Ll/no7$a;->d:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object v0, p0, Ll/no7$a;->d:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 22
    .line 23
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 24
    .line 25
    iget v5, p0, Ll/no7$a;->a:I

    .line 26
    .line 27
    iget v6, p0, Ll/no7$a;->b:I

    .line 28
    .line 29
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/g;->Qg(Ljava/lang/String;DII)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    long-to-double v2, v2

    .line 50
    const/4 v4, 0x0

    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Qg(Ljava/lang/String;DII)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/core/data/InsertConversationUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationUser;->clicked:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 6
    .line 7
    double-to-long v2, v2

    .line 8
    invoke-static {}, Ll/gra;->j3()I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    invoke-static {v0, v1, v2, v3, v4}, Ll/tzi0;->h(JJI)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 v0, 0x3

    .line 33
    if-ge p0, v0, :cond_1

    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/core/newui/main/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->T8(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic r2(Ljava/util/List;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->s1:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "convListPre \u9884\u52a0\u8f7d\u5b8c\u6210 "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/ue6;->C(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic r3(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->c8(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;)V

    return-void
.end method

.method public static synthetic r4(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->J6:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic r5(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 4
    .line 5
    iget-object p0, p0, Ll/n87;->R:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/core/newui/main/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Q7(Ll/pf60;)V

    return-void
.end method

.method public static synthetic s3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s4(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->i8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->k6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t3(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->V8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic t4(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->G8(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic t5(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/prp0;->i()Ll/prp0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/prp0;->o()Z

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

.method public static synthetic u2(Lcom/p1/mobile/putong/core/data/InsertConversationsList;)Ljava/lang/Boolean;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InsertConversationsList;->users:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic u3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u4(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->p8(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic u5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v2()Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic v3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic v4(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->B7()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic v5(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->c9(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic w2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic w3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w4(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/hcm;->z()Z

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

.method public static synthetic w5(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->H8()V

    return-void
.end method

.method public static synthetic x2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x4(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->F0:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic x5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method private x7()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/yc30;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/yc30;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/zc30;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/zc30;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->l8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    return-void
.end method

.method public static synthetic y3(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F5(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic y4(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->n8(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic z2(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->L8()V

    return-void
.end method

.method public static synthetic z3(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->W7(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z5(Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    sget-object v3, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 12
    .line 13
    if-ne v2, v3, :cond_0

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v2, v2, Ll/dkb;->m0:Ll/byd0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    cmp-long v0, v2, v0

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    iget-object v0, v0, Ll/dkb;->j0:Ll/byd0;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-object v0, v0, Ll/dkb;->m0:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 56
    .line 57
    iget-object v0, v0, Ll/dkb;->k0:Ll/xyd0;

    .line 58
    .line 59
    new-instance v1, Ljava/util/HashSet;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    iget-object v0, v0, Ll/dkb;->l0:Ll/byd0;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    iget-object v0, v0, Ll/dkb;->n0:Ll/byd0;

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    iget-object v0, v0, Ll/dkb;->o0:Ll/xyd0;

    .line 90
    .line 91
    new-instance v1, Ljava/util/HashSet;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 102
    .line 103
    iget-object v0, v0, Ll/dkb;->p0:Ll/byd0;

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 111
    .line 112
    iget-object v0, v0, Ll/dkb;->q0:Ll/xyd0;

    .line 113
    .line 114
    new-instance v1, Ljava/util/HashSet;

    .line 115
    .line 116
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 125
    .line 126
    iget-object v0, v0, Ll/dkb;->r0:Ll/byd0;

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 134
    .line 135
    iget-object p0, p0, Ll/dkb;->s0:Ll/xyd0;

    .line 136
    .line 137
    new-instance v0, Ljava/util/HashSet;

    .line 138
    .line 139
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 149
    .line 150
    iget-object p0, p0, Ll/dkb;->m0:Ll/byd0;

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, Ljava/lang/Long;

    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    cmp-long p0, v2, v0

    .line 163
    .line 164
    if-nez p0, :cond_1

    .line 165
    .line 166
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 169
    .line 170
    iget-object p0, p0, Ll/dkb;->m0:Ll/byd0;

    .line 171
    .line 172
    invoke-static {}, Ll/pzi0;->o()J

    .line 173
    .line 174
    .line 175
    move-result-wide v0

    .line 176
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    :cond_1
    return-void
.end method


# virtual methods
.method public final A6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 10
    .line 11
    iget-object p0, p0, Ll/n87;->S:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 28
    .line 29
    iget-object p0, p0, Ll/n87;->S:Ll/jxd0;

    .line 30
    .line 31
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 39
    .line 40
    iget-object p0, p0, Ll/n87;->R:Ll/jxd0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 57
    .line 58
    const-string v0, "-10025"

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v0, Ll/ae30;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/ae30;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/be30;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/be30;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 85
    .line 86
    iget-object p0, p0, Ll/n87;->S:Ll/jxd0;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/n87;->c3()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v0, Ll/ce30;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/ce30;-><init>()V

    .line 111
    .line 112
    .line 113
    new-instance v1, Ll/de30;

    .line 114
    .line 115
    invoke-direct {v1}, Ll/de30;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 128
    .line 129
    iget-object p0, p0, Ll/n87;->R:Ll/jxd0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    check-cast p0, Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_3

    .line 142
    .line 143
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D2:Ll/n87;

    .line 146
    .line 147
    iget-object p0, p0, Ll/n87;->R:Ll/jxd0;

    .line 148
    .line 149
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    :cond_3
    return-void
.end method

.method public final A7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/wtd0;->j()Ll/jxd0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/le30;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/le30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/wtd0;->g()Ll/jxd0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/me30;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/me30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/ne30;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/ne30;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public final synthetic A8(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E9()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->w9(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public A9()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->A:Z

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->o2()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/gra;->p2()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 21
    .line 22
    sget-object v4, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;->edit_profile:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 23
    .line 24
    invoke-virtual {v1, v3, v4, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->M(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;Z)V

    .line 25
    .line 26
    .line 27
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/main/a;->A:Z

    .line 28
    .line 29
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E9()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast v4, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 48
    .line 49
    invoke-virtual {v4, v3, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/gra;->o2()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    invoke-static {}, Ll/gra;->p2()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_2

    .line 65
    .line 66
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 69
    .line 70
    sget-object v4, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->ICON:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 71
    .line 72
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_2

    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->z:Z

    .line 79
    .line 80
    iget-object v4, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    check-cast v4, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;->edit_profile:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 87
    .line 88
    invoke-virtual {v4, v3, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->r0(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    check-cast v4, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 93
    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;->edit_profile:Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;

    .line 95
    .line 96
    invoke-virtual {v4, v3, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->M(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel$IconDotType;Z)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->z:Z

    .line 100
    .line 101
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->A:Z

    .line 102
    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    const-string p0, "e_mytab_incomplete"

    .line 108
    .line 109
    const-string v0, "p_suggest_users_home_view"

    .line 110
    .line 111
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    return-void
.end method

.method public final B7()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/esf0;->z()Lrx/subjects/b;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ha30;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ha30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 21
    .line 22
    .line 23
    new-instance v3, Ll/ja30;

    .line 24
    .line 25
    invoke-direct {v3}, Ll/ja30;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/ka30;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/ka30;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/la30;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/la30;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/ma30;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/ma30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Ll/na30;

    .line 63
    .line 64
    invoke-direct {p0}, Ll/na30;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic B8(Lcom/p1/mobile/putong/core/data/RiskSelfData;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v3

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v0, v2

    .line 23
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/RiskSelfData;->popUpText:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_2
    move v2, v3

    .line 39
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isMainPage(Lcom/p1/mobile/android/app/Act;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    invoke-static {}, Ll/qyp;->i()Ll/qyp;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/RiskSelfData;->type:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/RiskSelfData;->popUpText:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, p0, v1, v2}, Ll/qyp;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/yd9;->q3(Lcom/p1/mobile/putong/core/data/RiskSelfData;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public B9(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    move v2, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v0

    .line 8
    :goto_0
    invoke-virtual {p0, p1, v2, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->V9(Lcom/p1/mobile/putong/newui/main/base/TabName;ZZ)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    if-ne v1, p1, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    if-lez p2, :cond_1

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 22
    .line 23
    invoke-virtual {v1, p1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 32
    .line 33
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E9()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 44
    .line 45
    .line 46
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 49
    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->v0(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final C6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object p0, p0, Ll/dkb;->w2:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Ll/fe30;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/fe30;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v1, Ll/ge30;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/ge30;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final C7()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ll/za30;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/za30;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v2, Ll/ab30;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/ab30;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A7()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->P6()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->o6()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->m6()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->u7()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->i6()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->a6()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->C6()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->n7()V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/bb30;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/bb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/uqb0;->r0(Ljava/lang/Runnable;Z)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->D6()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->w7()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->v7()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A6()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic C8(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->r:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final C9()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->H4()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final D6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/s75;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 10
    .line 11
    iget-object v0, v0, Ll/no7;->U:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/ie30;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/ie30;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/je30;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/je30;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/s75;->o()V

    .line 53
    .line 54
    .line 55
    :cond_0
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/s75;->p()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 65
    .line 66
    iget-object p0, p0, Ll/no7;->X:Ll/jxd0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/no7;->D3()V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 90
    .line 91
    iget-object p0, p0, Ll/no7;->X:Ll/jxd0;

    .line 92
    .line 93
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    :cond_2
    return-void
.end method

.method public final D7()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/wf30;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/wf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic D8(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->V()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/cix;->a()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p1, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Buzz:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->L(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/ke30;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/ke30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0, v1, v2}, Ll/sbw;->v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a$c;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final D9()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x0

    .line 18
    if-lez p0, :cond_1

    .line 19
    .line 20
    sget p0, Ll/uqb0;->t:I

    .line 21
    .line 22
    const v1, 0x387138

    .line 23
    .line 24
    .line 25
    if-lt p0, v1, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->n0:Ll/vxd0;

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :cond_0
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_1
    return v0
.end method

.method public final E6()V
    .locals 7

    .line 1
    new-instance v0, Ll/xe30;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xe30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->fa()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/jf30;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/jf30;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/nf30;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/nf30;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/pf30;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/pf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-interface {v0}, Ll/hbs;->c()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->bl()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_0
    move-object v4, v0

    .line 93
    goto :goto_1

    .line 94
    :cond_0
    new-instance v0, Ll/f7s;

    .line 95
    .line 96
    invoke-direct {v0}, Ll/f7s;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    goto :goto_0

    .line 104
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 113
    .line 114
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Qe()Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-static {}, Ll/mge;->o()Ll/mge;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v0, v0, Ll/mge;->a:Lrx/subjects/a;

    .line 123
    .line 124
    new-instance v3, Ll/qf30;

    .line 125
    .line 126
    invoke-direct {v3}, Ll/qf30;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 138
    .line 139
    new-instance v6, Ll/rf30;

    .line 140
    .line 141
    invoke-direct {v6}, Ll/rf30;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-static/range {v1 .. v6}, Ll/psd0;->u(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Ll/sf30;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Ll/sf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 155
    .line 156
    .line 157
    new-instance v2, Ll/tf30;

    .line 158
    .line 159
    invoke-direct {v2}, Ll/tf30;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 167
    .line 168
    .line 169
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 170
    .line 171
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 172
    .line 173
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-interface {v0}, Ll/qam;->d()Lrx/subjects/a;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    new-instance v1, Ll/uf30;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/uf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 188
    .line 189
    .line 190
    new-instance v2, Ll/vf30;

    .line 191
    .line 192
    invoke-direct {v2}, Ll/vf30;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 200
    .line 201
    .line 202
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 203
    .line 204
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 205
    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->r2:Lrx/subjects/a;

    .line 207
    .line 208
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    new-instance v1, Ll/ye30;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/ye30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 219
    .line 220
    .line 221
    new-instance v2, Ll/ze30;

    .line 222
    .line 223
    invoke-direct {v2}, Ll/ze30;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 231
    .line 232
    .line 233
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 234
    .line 235
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 236
    .line 237
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-interface {v0}, Ll/c8m0;->d()Lrx/subjects/a;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    new-instance v1, Ll/af30;

    .line 262
    .line 263
    invoke-direct {v1, p0}, Ll/af30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 264
    .line 265
    .line 266
    new-instance v2, Ll/bf30;

    .line 267
    .line 268
    invoke-direct {v2}, Ll/bf30;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 276
    .line 277
    .line 278
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 281
    .line 282
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->h9()Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    new-instance v1, Ll/cf30;

    .line 291
    .line 292
    invoke-direct {v1, p0}, Ll/cf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 293
    .line 294
    .line 295
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 300
    .line 301
    .line 302
    invoke-static {}, Ll/r8n;->f()Ll/r8n;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    iget-object v0, v0, Ll/r8n;->b:Lrx/subjects/a;

    .line 307
    .line 308
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    new-instance v1, Ll/ef30;

    .line 317
    .line 318
    invoke-direct {v1}, Ll/ef30;-><init>()V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    new-instance v1, Ll/ff30;

    .line 326
    .line 327
    invoke-direct {v1}, Ll/ff30;-><init>()V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 343
    .line 344
    .line 345
    move-result-object v1

    .line 346
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    new-instance v1, Ll/gf30;

    .line 351
    .line 352
    invoke-direct {v1, p0}, Ll/gf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 353
    .line 354
    .line 355
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    new-instance v1, Ll/hf30;

    .line 367
    .line 368
    invoke-direct {v1}, Ll/hf30;-><init>()V

    .line 369
    .line 370
    .line 371
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    const/4 v1, 0x1

    .line 376
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    new-instance v1, Ll/if30;

    .line 381
    .line 382
    invoke-direct {v1}, Ll/if30;-><init>()V

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    new-instance v1, Ll/kf30;

    .line 390
    .line 391
    invoke-direct {v1}, Ll/kf30;-><init>()V

    .line 392
    .line 393
    .line 394
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 395
    .line 396
    .line 397
    move-result-object v1

    .line 398
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 399
    .line 400
    .line 401
    invoke-static {}, Ll/gra;->D2()Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-eqz v0, :cond_1

    .line 406
    .line 407
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 408
    .line 409
    .line 410
    move-result-object p0

    .line 411
    new-instance v0, Ll/lf30;

    .line 412
    .line 413
    invoke-direct {v0}, Ll/lf30;-><init>()V

    .line 414
    .line 415
    .line 416
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    new-instance v0, Ll/mf30;

    .line 421
    .line 422
    invoke-direct {v0}, Ll/mf30;-><init>()V

    .line 423
    .line 424
    .line 425
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 430
    .line 431
    .line 432
    :cond_1
    return-void
.end method

.method public final E7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->sa()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->df()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/pe30;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/pe30;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/ve30;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/ve30;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v1, Ll/we30;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/we30;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final synthetic E8(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    const-string v1, "intl.text.lovebuzz.show.notify"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    sget-object v0, Ll/i8w;->INSTANCE:Ll/i8w;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p0, v1, p2, p1}, Ll/i8w;->e(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Ll/pf60;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public E9()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->L9()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->K9()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->I9()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->G9()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->H9()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->D9()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->J9()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->C9()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->F9()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public final F6()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->k2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/ig30;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/ig30;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->h1:Ll/byd0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/Long;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    const-wide/16 v2, 0x1

    .line 33
    .line 34
    cmp-long p0, v0, v2

    .line 35
    .line 36
    if-gez p0, :cond_1

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    invoke-static {v2, v3, v0, v1}, Ll/yab;->C(JJ)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {}, Ll/gra;->z0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {}, Ll/gra;->A0()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    const/4 v3, 0x1

    .line 60
    invoke-virtual {v2, p0, v0, v1, v3}, Lcom/p1/mobile/putong/core/api/g;->vp(ZIIZ)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final F7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/xf30;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/xf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/yf30;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/yf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v0, v0, Ll/dkb;->g4:Lrx/subjects/b;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/ag30;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/ag30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object v0, v0, Ll/dkb;->E1:Lrx/subjects/b;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/bg30;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/bg30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 85
    .line 86
    iget-object v0, v0, Ll/dkb;->F1:Lrx/subjects/b;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/cg30;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/cg30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/dg30;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/dg30;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance v0, Ll/eg30;

    .line 130
    .line 131
    invoke-direct {v0}, Ll/eg30;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public final synthetic F8(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    const/4 p2, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p2, 0x0

    .line 26
    :goto_0
    const-string v0, "textBuzz"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;->q(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;->y()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    if-nez v0, :cond_2

    .line 41
    .line 42
    sget-object p2, Ll/haw;->Companion:Ll/haw$a;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/haw$a;->a()Ll/haw;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p2}, Ll/haw;->z0()Lrx/subjects/a;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Ll/pf60;

    .line 57
    .line 58
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ljava/lang/CharSequence;

    .line 67
    .line 68
    const-string v1, "intl.text.lovebuzz.show.notify"

    .line 69
    .line 70
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    sget-object v0, Ll/i8w;->INSTANCE:Ll/i8w;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const/4 v1, 0x0

    .line 83
    invoke-virtual {v0, p0, v1, p2, p1}, Ll/i8w;->e(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Ll/pf60;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public final F9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->g0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/d79;->h0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->A5()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public final G6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/sd8;->u3()Ll/jxd0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/sd8;->y3()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ll/gg30;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/gg30;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/sd8;->u3()Ll/jxd0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/sd8;->u3()Ll/jxd0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    new-instance p0, Ll/hg30;

    .line 84
    .line 85
    invoke-direct {p0}, Ll/hg30;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method

.method public G7(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic G8(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final G9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->i0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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

.method public final H6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ji30;->i()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/qh30;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/qh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final H7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->l()Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/CollapsibleConversationConfig;->enabled:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->F:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    const-wide/16 v0, 0x5dc

    .line 23
    .line 24
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 25
    .line 26
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$o;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$o;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->ef()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/oa30;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/oa30;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$p;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$p;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    :goto_0
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$q;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$q;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$r;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$r;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Ll/pa30;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/pa30;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->F:Ll/kcg0;

    .line 119
    .line 120
    :cond_1
    return-void
.end method

.method public final synthetic H8()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->F()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final H9()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/spl0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/f4a;->I3()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-lez p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/f4a;->q3()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    return v0
.end method

.method public I7(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic I8(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->K()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->z()V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->r:Ljava/lang/Runnable;

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/h79;->i3()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->N()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public I9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->T()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/wtd0;->g()Ll/jxd0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    xor-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final J6()V
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/o810;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/a8d0;->D0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/ai30;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/ai30;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/bi30;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/bi30;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/n930;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/n930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public J7()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    :cond_0
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final synthetic J8(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->U9(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->X9(Z)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public final J9()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lc9;->t3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final K6()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->mp(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public K7()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    check-cast p0, Ll/cvl;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/cvl;->T()Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->getTag()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "home"

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final synthetic K8(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/p040;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/p040;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p0, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final K9()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final L6()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->R1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/m6i;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$g;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$g;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/p1/mobile/putong/core/newui/main/a$h;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/main/a$h;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$i;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$i;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final L7()V
    .locals 27

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/ok50;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_0
    sget-object v0, Ll/jm5;->e:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_b

    .line 26
    .line 27
    :cond_0
    sget-object v0, Ll/jm5;->e:Ll/jxd0;

    .line 28
    .line 29
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ll/k930;->c1()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v3, "ad_launcher_key"

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    :try_start_1
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3, v2}, Landroid/content/Intent;->replaceExtras(Landroid/os/Bundle;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 60
    .line 61
    .line 62
    :catch_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    move-object v0, v2

    .line 66
    :goto_0
    if-nez v0, :cond_1

    .line 67
    .line 68
    goto/16 :goto_b

    .line 69
    .line 70
    :cond_1
    invoke-virtual {v1}, Ll/k930;->c1()Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const-string v4, "ad_launcher_touch_key"

    .line 75
    .line 76
    const-wide/high16 v5, -0x4010000000000000L    # -1.0

    .line 77
    .line 78
    invoke-virtual {v3, v4, v5, v6}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    .line 79
    .line 80
    .line 81
    move-result-wide v3

    .line 82
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 83
    .line 84
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_11

    .line 89
    .line 90
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 91
    .line 92
    invoke-static {v5}, Lcom/p1/mobile/putong/ui/LauncherView;->a(Lcom/p1/mobile/putong/data/ADInfo;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_11

    .line 97
    .line 98
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 99
    .line 100
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 101
    .line 102
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 103
    .line 104
    const-string v6, "wechatMiniProgram"

    .line 105
    .line 106
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 111
    .line 112
    const-string v7, "webview"

    .line 113
    .line 114
    const-string v8, "if_jump_success"

    .line 115
    .line 116
    const-string v10, "deeplink"

    .line 117
    .line 118
    const-string v11, "ad_id"

    .line 119
    .line 120
    const-string v12, ""

    .line 121
    .line 122
    if-eqz v5, :cond_3

    .line 123
    .line 124
    iget-object v5, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 125
    .line 126
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    if-nez v5, :cond_2

    .line 133
    .line 134
    sget-object v5, Ll/c70;->INSTANCE:Ll/c70;

    .line 135
    .line 136
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 137
    .line 138
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 139
    .line 140
    iget-object v13, v6, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v5, v13, v6}, Ll/c70;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    goto :goto_1

    .line 149
    :cond_2
    const/4 v5, 0x0

    .line 150
    :goto_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-static {v8, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {v11, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object v6

    .line 164
    const-string v13, "dsp_id"

    .line 165
    .line 166
    iget-object v14, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->dspId:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v13, v14}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object v13

    .line 172
    iget-object v14, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 173
    .line 174
    iget-object v14, v14, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 175
    .line 176
    iget-object v14, v14, Lcom/p1/mobile/putong/data/OMSADLink;->path:Ljava/lang/String;

    .line 177
    .line 178
    const-string v15, "mini_program_path"

    .line 179
    .line 180
    invoke-static {v15, v14}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object v14

    .line 184
    iget-object v15, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 185
    .line 186
    iget-object v15, v15, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 187
    .line 188
    iget-object v15, v15, Lcom/p1/mobile/putong/data/OMSADLink;->originalId:Ljava/lang/String;

    .line 189
    .line 190
    const-string v2, "mini_program_originalid"

    .line 191
    .line 192
    invoke-static {v2, v15}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    filled-new-array {v5, v6, v13, v14, v2}, [Ll/pf60;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const-string v5, "e_oms_open_mini_program_event"

    .line 201
    .line 202
    invoke-static {v5, v12, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 203
    .line 204
    .line 205
    goto :goto_2

    .line 206
    :cond_3
    iget-object v2, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 207
    .line 208
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 209
    .line 210
    const-string v5, "tantanDeepLink"

    .line 211
    .line 212
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    if-eqz v2, :cond_6

    .line 217
    .line 218
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 219
    .line 220
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 221
    .line 222
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-nez v2, :cond_6

    .line 229
    .line 230
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 231
    .line 232
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 233
    .line 234
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 235
    .line 236
    const-string v5, "tantan"

    .line 237
    .line 238
    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-eqz v2, :cond_6

    .line 243
    .line 244
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 245
    .line 246
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 247
    .line 248
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 249
    .line 250
    const-string v5, "tantan://"

    .line 251
    .line 252
    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v6

    .line 256
    if-eqz v6, :cond_4

    .line 257
    .line 258
    const-string v6, "tantanapp://"

    .line 259
    .line 260
    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    :cond_4
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/main/a;->M7(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    :goto_2
    move-object/from16 v16, v10

    .line 268
    .line 269
    const/4 v2, 0x0

    .line 270
    :cond_5
    const/4 v5, 0x0

    .line 271
    :goto_3
    const/4 v6, 0x0

    .line 272
    const/4 v14, 0x0

    .line 273
    goto/16 :goto_5

    .line 274
    .line 275
    :cond_6
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 276
    .line 277
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 278
    .line 279
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 280
    .line 281
    invoke-static {v2, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 286
    .line 287
    const-string v6, "android.intent.action.VIEW"

    .line 288
    .line 289
    if-eqz v2, :cond_8

    .line 290
    .line 291
    iget-object v2, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 292
    .line 293
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 294
    .line 295
    invoke-static {v2}, Ll/dk50;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    new-instance v5, Landroid/content/Intent;

    .line 304
    .line 305
    invoke-direct {v5, v6, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 306
    .line 307
    .line 308
    const/high16 v2, 0x10000000

    .line 309
    .line 310
    invoke-virtual {v5, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    const/high16 v6, 0x10000

    .line 322
    .line 323
    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 328
    .line 329
    .line 330
    move-result v6

    .line 331
    iget-object v13, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 332
    .line 333
    const/4 v14, 0x1

    .line 334
    if-lez v6, :cond_7

    .line 335
    .line 336
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 337
    .line 338
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 339
    .line 340
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 341
    .line 342
    iget-object v6, v6, Lcom/p1/mobile/putong/data/DeeplinkReport;->appInstall:Ljava/util/List;

    .line 343
    .line 344
    invoke-static {v13, v6}, Ll/ok50;->g(Ljava/lang/String;Ljava/util/List;)V

    .line 345
    .line 346
    .line 347
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 348
    .line 349
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 350
    .line 351
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 352
    .line 353
    iget-object v6, v6, Lcom/p1/mobile/putong/data/DeeplinkReport;->appInstall:Ljava/util/List;

    .line 354
    .line 355
    const-string v13, "appInstall"

    .line 356
    .line 357
    invoke-static {v0, v13, v6}, Ll/ok50;->h(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Ljava/util/List;)V

    .line 358
    .line 359
    .line 360
    sget-object v6, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 361
    .line 362
    new-instance v13, Ll/xb30;

    .line 363
    .line 364
    invoke-direct {v13, v0}, Ll/xb30;-><init>(Lcom/p1/mobile/putong/data/OMSLauncherInfo;)V

    .line 365
    .line 366
    .line 367
    move-object/from16 v16, v10

    .line 368
    .line 369
    const-wide/16 v9, 0x1388

    .line 370
    .line 371
    invoke-static {v6, v13, v9, v10}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 372
    .line 373
    .line 374
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 375
    .line 376
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 377
    .line 378
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 379
    .line 380
    iget-object v9, v6, Lcom/p1/mobile/putong/data/DeeplinkReport;->success:Ljava/util/List;

    .line 381
    .line 382
    iget-object v6, v6, Lcom/p1/mobile/putong/data/DeeplinkReport;->failed:Ljava/util/List;

    .line 383
    .line 384
    invoke-static {v0, v9, v6}, Ll/ok50;->f(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/util/List;Ljava/util/List;)V

    .line 385
    .line 386
    .line 387
    move v6, v14

    .line 388
    goto/16 :goto_5

    .line 389
    .line 390
    :cond_7
    move-object/from16 v16, v10

    .line 391
    .line 392
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 393
    .line 394
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 395
    .line 396
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 397
    .line 398
    iget-object v5, v5, Lcom/p1/mobile/putong/data/DeeplinkReport;->appNoInstall:Ljava/util/List;

    .line 399
    .line 400
    invoke-static {v13, v5}, Ll/ok50;->g(Ljava/lang/String;Ljava/util/List;)V

    .line 401
    .line 402
    .line 403
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 404
    .line 405
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 406
    .line 407
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->deeplinkReport:Lcom/p1/mobile/putong/data/DeeplinkReport;

    .line 408
    .line 409
    iget-object v5, v5, Lcom/p1/mobile/putong/data/DeeplinkReport;->appNoInstall:Ljava/util/List;

    .line 410
    .line 411
    const-string v6, "appNoInstall"

    .line 412
    .line 413
    invoke-static {v0, v6, v5}, Ll/ok50;->h(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Ljava/util/List;)V

    .line 414
    .line 415
    .line 416
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 417
    .line 418
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 419
    .line 420
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->fallbackLink:Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 421
    .line 422
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    move-result v5

    .line 426
    if-eqz v5, :cond_5

    .line 427
    .line 428
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 429
    .line 430
    .line 431
    move-result-object v5

    .line 432
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 433
    .line 434
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 435
    .line 436
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->fallbackLink:Lcom/p1/mobile/putong/data/OMSFallbackLink;

    .line 437
    .line 438
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSFallbackLink;->url:Ljava/lang/String;

    .line 439
    .line 440
    invoke-static {v6}, Ll/dk50;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v6

    .line 444
    invoke-static {v5, v6, v14}, Lcom/p1/mobile/putong/ui/LauncherView;->b(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 445
    .line 446
    .line 447
    move-result-object v5

    .line 448
    goto/16 :goto_3

    .line 449
    .line 450
    :cond_8
    move-object/from16 v16, v10

    .line 451
    .line 452
    iget-object v2, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 453
    .line 454
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 455
    .line 456
    const-string v5, "browser"

    .line 457
    .line 458
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 459
    .line 460
    .line 461
    move-result v2

    .line 462
    if-eqz v2, :cond_9

    .line 463
    .line 464
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 465
    .line 466
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 467
    .line 468
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 469
    .line 470
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    if-nez v2, :cond_9

    .line 475
    .line 476
    new-instance v5, Landroid/content/Intent;

    .line 477
    .line 478
    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    const-string v2, "android.intent.category.BROWSABLE"

    .line 482
    .line 483
    invoke-virtual {v5, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 484
    .line 485
    .line 486
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 487
    .line 488
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 489
    .line 490
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 491
    .line 492
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 493
    .line 494
    .line 495
    move-result-object v2

    .line 496
    invoke-virtual {v5, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 497
    .line 498
    .line 499
    :goto_4
    const/4 v2, 0x0

    .line 500
    goto/16 :goto_3

    .line 501
    .line 502
    :cond_9
    invoke-virtual {v1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 503
    .line 504
    .line 505
    move-result-object v2

    .line 506
    iget-object v5, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 507
    .line 508
    iget-object v5, v5, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 509
    .line 510
    iget-object v5, v5, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 511
    .line 512
    invoke-static {v5}, Ll/dk50;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v5

    .line 516
    iget-object v6, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 517
    .line 518
    iget-object v6, v6, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 519
    .line 520
    iget-object v6, v6, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 521
    .line 522
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 523
    .line 524
    .line 525
    move-result v6

    .line 526
    invoke-static {v2, v5, v6}, Lcom/p1/mobile/putong/ui/LauncherView;->b(Landroid/app/Activity;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 527
    .line 528
    .line 529
    move-result-object v5

    .line 530
    goto :goto_4

    .line 531
    :goto_5
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result v9

    .line 535
    const-string v10, "if_app_installed"

    .line 536
    .line 537
    const-string v13, "jump_types"

    .line 538
    .line 539
    const-string v15, "jump_action"

    .line 540
    .line 541
    move/from16 v18, v6

    .line 542
    .line 543
    const-string v6, "jump_url"

    .line 544
    .line 545
    move-object/from16 v19, v7

    .line 546
    .line 547
    const-string v7, "e_start_page_jump_result"

    .line 548
    .line 549
    if-eqz v9, :cond_f

    .line 550
    .line 551
    :try_start_2
    iget-object v9, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->clickMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_3

    .line 552
    .line 553
    move/from16 v20, v14

    .line 554
    .line 555
    :try_start_3
    iget-object v14, v9, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 556
    .line 557
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->viewMercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 558
    .line 559
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 560
    .line 561
    iget-object v9, v9, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 562
    .line 563
    invoke-static {v14, v1, v9, v3, v4}, Ll/d;->b(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;D)V

    .line 564
    .line 565
    .line 566
    invoke-virtual/range {p0 .. p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 571
    .line 572
    .line 573
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 574
    .line 575
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 576
    .line 577
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ADInfo;->trackingURLs:Lcom/p1/mobile/putong/data/OMSADTrackingInfo;

    .line 578
    .line 579
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSADTrackingInfo;->clickURLs:Ljava/util/List;

    .line 580
    .line 581
    invoke-static {v1, v3}, Ll/ok50;->g(Ljava/lang/String;Ljava/util/List;)V

    .line 582
    .line 583
    .line 584
    const-string v1, "click"

    .line 585
    .line 586
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 587
    .line 588
    iget-object v3, v3, Lcom/p1/mobile/putong/data/ADInfo;->trackingURLs:Lcom/p1/mobile/putong/data/OMSADTrackingInfo;

    .line 589
    .line 590
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSADTrackingInfo;->clickURLs:Ljava/util/List;

    .line 591
    .line 592
    invoke-static {v0, v1, v3}, Ll/ok50;->h(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/lang/String;Ljava/util/List;)V

    .line 593
    .line 594
    .line 595
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 596
    .line 597
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 598
    .line 599
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;
    :try_end_3
    .catch Landroid/content/ActivityNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    .line 600
    .line 601
    move-object/from16 v3, v16

    .line 602
    .line 603
    :try_start_4
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 604
    .line 605
    .line 606
    move-result v1

    .line 607
    if-eqz v1, :cond_b

    .line 608
    .line 609
    invoke-static/range {v20 .. v20}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    invoke-static {v8, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 614
    .line 615
    .line 616
    move-result-object v21

    .line 617
    if-eqz v20, :cond_a

    .line 618
    .line 619
    move-object v1, v3

    .line 620
    goto :goto_6

    .line 621
    :cond_a
    move-object/from16 v1, v19

    .line 622
    .line 623
    :goto_6
    invoke-static {v13, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 624
    .line 625
    .line 626
    move-result-object v22

    .line 627
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 628
    .line 629
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 630
    .line 631
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 632
    .line 633
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 634
    .line 635
    .line 636
    move-result-object v23

    .line 637
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 638
    .line 639
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 640
    .line 641
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 642
    .line 643
    invoke-static {v15, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 644
    .line 645
    .line 646
    move-result-object v24

    .line 647
    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 648
    .line 649
    .line 650
    move-result-object v1

    .line 651
    invoke-static {v10, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 652
    .line 653
    .line 654
    move-result-object v25

    .line 655
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 656
    .line 657
    invoke-static {v11, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 658
    .line 659
    .line 660
    move-result-object v26

    .line 661
    filled-new-array/range {v21 .. v26}, [Ll/pf60;

    .line 662
    .line 663
    .line 664
    move-result-object v1

    .line 665
    invoke-static {v7, v12, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 666
    .line 667
    .line 668
    goto/16 :goto_b

    .line 669
    .line 670
    :cond_b
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 671
    .line 672
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 673
    .line 674
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 675
    .line 676
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 677
    .line 678
    .line 679
    move-result-object v1

    .line 680
    iget-object v4, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 681
    .line 682
    iget-object v4, v4, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 683
    .line 684
    iget-object v4, v4, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 685
    .line 686
    invoke-static {v15, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 687
    .line 688
    .line 689
    move-result-object v4

    .line 690
    iget-object v9, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 691
    .line 692
    invoke-static {v11, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 693
    .line 694
    .line 695
    move-result-object v9

    .line 696
    filled-new-array {v1, v4, v9}, [Ll/pf60;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    invoke-static {v7, v12, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    :try_end_4
    .catch Landroid/content/ActivityNotFoundException; {:try_start_4 .. :try_end_4} :catch_4

    .line 701
    .line 702
    .line 703
    goto/16 :goto_b

    .line 704
    .line 705
    :catch_2
    :goto_7
    move-object/from16 v3, v16

    .line 706
    .line 707
    goto :goto_8

    .line 708
    :catch_3
    move/from16 v20, v14

    .line 709
    .line 710
    goto :goto_7

    .line 711
    :catch_4
    :goto_8
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 712
    .line 713
    .line 714
    move-result v1

    .line 715
    const-string v4, "Intent: "

    .line 716
    .line 717
    if-nez v1, :cond_c

    .line 718
    .line 719
    new-instance v1, Landroid/content/ActivityNotFoundException;

    .line 720
    .line 721
    new-instance v9, Ljava/lang/StringBuilder;

    .line 722
    .line 723
    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 724
    .line 725
    .line 726
    invoke-virtual {v5}, Landroid/content/Intent;->toString()Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v4

    .line 730
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 731
    .line 732
    .line 733
    const-string v4, " ResolveList: "

    .line 734
    .line 735
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    .line 737
    .line 738
    const/4 v4, 0x0

    .line 739
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 740
    .line 741
    .line 742
    move-result-object v2

    .line 743
    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 744
    .line 745
    invoke-virtual {v2}, Landroid/content/pm/ResolveInfo;->toString()Ljava/lang/String;

    .line 746
    .line 747
    .line 748
    move-result-object v2

    .line 749
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 750
    .line 751
    .line 752
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 753
    .line 754
    .line 755
    move-result-object v2

    .line 756
    invoke-direct {v1, v2}, Landroid/content/ActivityNotFoundException;-><init>(Ljava/lang/String;)V

    .line 757
    .line 758
    .line 759
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 760
    .line 761
    .line 762
    goto :goto_9

    .line 763
    :cond_c
    new-instance v1, Landroid/content/ActivityNotFoundException;

    .line 764
    .line 765
    new-instance v2, Ljava/lang/StringBuilder;

    .line 766
    .line 767
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 768
    .line 769
    .line 770
    invoke-virtual {v5}, Landroid/content/Intent;->toString()Ljava/lang/String;

    .line 771
    .line 772
    .line 773
    move-result-object v4

    .line 774
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 775
    .line 776
    .line 777
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 778
    .line 779
    .line 780
    move-result-object v2

    .line 781
    invoke-direct {v1, v2}, Landroid/content/ActivityNotFoundException;-><init>(Ljava/lang/String;)V

    .line 782
    .line 783
    .line 784
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 785
    .line 786
    .line 787
    :goto_9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 788
    .line 789
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 790
    .line 791
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 792
    .line 793
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 794
    .line 795
    .line 796
    move-result v1

    .line 797
    if-eqz v1, :cond_e

    .line 798
    .line 799
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 800
    .line 801
    invoke-static {v8, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 802
    .line 803
    .line 804
    move-result-object v21

    .line 805
    if-eqz v20, :cond_d

    .line 806
    .line 807
    goto :goto_a

    .line 808
    :cond_d
    move-object/from16 v3, v19

    .line 809
    .line 810
    :goto_a
    invoke-static {v13, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 811
    .line 812
    .line 813
    move-result-object v22

    .line 814
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 815
    .line 816
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 817
    .line 818
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 819
    .line 820
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 821
    .line 822
    .line 823
    move-result-object v23

    .line 824
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 825
    .line 826
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 827
    .line 828
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 829
    .line 830
    invoke-static {v15, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 831
    .line 832
    .line 833
    move-result-object v24

    .line 834
    invoke-static/range {v18 .. v18}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 835
    .line 836
    .line 837
    move-result-object v1

    .line 838
    invoke-static {v10, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 839
    .line 840
    .line 841
    move-result-object v25

    .line 842
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 843
    .line 844
    invoke-static {v11, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 845
    .line 846
    .line 847
    move-result-object v26

    .line 848
    filled-new-array/range {v21 .. v26}, [Ll/pf60;

    .line 849
    .line 850
    .line 851
    move-result-object v0

    .line 852
    invoke-static {v7, v12, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 853
    .line 854
    .line 855
    goto/16 :goto_b

    .line 856
    .line 857
    :cond_e
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 858
    .line 859
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 860
    .line 861
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 862
    .line 863
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 864
    .line 865
    .line 866
    move-result-object v1

    .line 867
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 868
    .line 869
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 870
    .line 871
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 872
    .line 873
    invoke-static {v15, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 874
    .line 875
    .line 876
    move-result-object v2

    .line 877
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 878
    .line 879
    invoke-static {v11, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 880
    .line 881
    .line 882
    move-result-object v0

    .line 883
    filled-new-array {v1, v2, v0}, [Ll/pf60;

    .line 884
    .line 885
    .line 886
    move-result-object v0

    .line 887
    invoke-static {v7, v12, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 888
    .line 889
    .line 890
    goto :goto_b

    .line 891
    :cond_f
    move-object/from16 v3, v16

    .line 892
    .line 893
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 894
    .line 895
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 896
    .line 897
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 898
    .line 899
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 900
    .line 901
    .line 902
    move-result v1

    .line 903
    if-eqz v1, :cond_10

    .line 904
    .line 905
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 906
    .line 907
    invoke-static {v8, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 908
    .line 909
    .line 910
    move-result-object v16

    .line 911
    const/4 v2, 0x0

    .line 912
    invoke-static {v13, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 913
    .line 914
    .line 915
    move-result-object v17

    .line 916
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 917
    .line 918
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 919
    .line 920
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 921
    .line 922
    invoke-static {v6, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 923
    .line 924
    .line 925
    move-result-object v18

    .line 926
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 927
    .line 928
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 929
    .line 930
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 931
    .line 932
    invoke-static {v15, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 933
    .line 934
    .line 935
    move-result-object v19

    .line 936
    invoke-static {v10, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 937
    .line 938
    .line 939
    move-result-object v20

    .line 940
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 941
    .line 942
    invoke-static {v11, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 943
    .line 944
    .line 945
    move-result-object v21

    .line 946
    filled-new-array/range {v16 .. v21}, [Ll/pf60;

    .line 947
    .line 948
    .line 949
    move-result-object v0

    .line 950
    invoke-static {v7, v12, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 951
    .line 952
    .line 953
    goto :goto_b

    .line 954
    :cond_10
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 955
    .line 956
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 957
    .line 958
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSADLink;->url:Ljava/lang/String;

    .line 959
    .line 960
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 961
    .line 962
    .line 963
    move-result-object v1

    .line 964
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->ad:Lcom/p1/mobile/putong/data/ADInfo;

    .line 965
    .line 966
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ADInfo;->link:Lcom/p1/mobile/putong/data/OMSADLink;

    .line 967
    .line 968
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSADLink;->action:Lcom/p1/mobile/putong/data/LinkAction;

    .line 969
    .line 970
    invoke-static {v15, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 971
    .line 972
    .line 973
    move-result-object v2

    .line 974
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->id:Ljava/lang/String;

    .line 975
    .line 976
    invoke-static {v11, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 977
    .line 978
    .line 979
    move-result-object v0

    .line 980
    filled-new-array {v1, v2, v0}, [Ll/pf60;

    .line 981
    .line 982
    .line 983
    move-result-object v0

    .line 984
    invoke-static {v7, v12, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 985
    .line 986
    .line 987
    goto :goto_b

    .line 988
    :cond_11
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 989
    .line 990
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 991
    .line 992
    .line 993
    move-result v1

    .line 994
    if-nez v1, :cond_12

    .line 995
    .line 996
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLauncherInfo;->href:Ljava/lang/String;

    .line 997
    .line 998
    move-object/from16 v1, p0

    .line 999
    .line 1000
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->M7(Ljava/lang/String;)V

    .line 1001
    .line 1002
    .line 1003
    :cond_12
    :goto_b
    return-void
.end method

.method public final synthetic L8()V
    .locals 1

    .line 1
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/q83;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public L9()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/d79;->T()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/wtd0;->j()Ll/jxd0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    xor-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final M6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ac30;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ac30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->L7()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ll/lc30;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/lc30;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final M7(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "tantan"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, ""

    .line 36
    .line 37
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    sget-object p1, Ll/abe0;->g:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    sget-object p1, Ll/abe0;->g:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sget-object p1, Ll/abe0;->g:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    const/4 p0, 0x0

    .line 75
    sput-object p0, Ll/abe0;->g:Ljava/lang/String;

    .line 76
    .line 77
    return-void
.end method

.method public final synthetic M8(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/q83;->j()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/wd30;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/wd30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/q83;->b()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public M9(Ljava/lang/CharSequence;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/lang/String;DLl/x20;)V
    .locals 8

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 5
    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    move-object v4, p4

    .line 10
    move-wide v5, p5

    .line 11
    move-object v7, p7

    .line 12
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->y0(Ljava/lang/CharSequence;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Figure;Ljava/lang/String;DLl/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final N6()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->a1:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object p0, p0, Ll/dkb;->a1:Ll/jxd0;

    .line 24
    .line 25
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final N7()V
    .locals 4

    .line 1
    sget-object v0, Ll/abe0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    sget-object v0, Ll/abe0;->g:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "tantan"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    sget-object v0, Ll/abe0;->g:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "https://subscribe.tantanapp.com"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/abe0;->g:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v2, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    sget-object v0, Ll/abe0;->g:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "url"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    if-eqz v2, :cond_1

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const-string v1, ""

    .line 72
    .line 73
    :goto_0
    const-string v2, "openExternalURL"

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v2, "true"

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_2

    .line 90
    .line 91
    const/4 p0, 0x0

    .line 92
    sput-object p0, Ll/abe0;->g:Ljava/lang/String;

    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C1:Ll/fb9;

    .line 98
    .line 99
    invoke-virtual {v2}, Ll/fb9;->c3()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    new-instance v3, Ll/aa30;

    .line 116
    .line 117
    invoke-direct {v3, p0, v0, v1}, Ll/aa30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;ZLjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    new-instance p0, Ll/ba30;

    .line 121
    .line 122
    invoke-direct {p0}, Ll/ba30;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    :cond_3
    :goto_1
    return-void
.end method

.method public final synthetic N8(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E9()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->w9(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N9()V
    .locals 8

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/hlh0;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, ""

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->c:Ll/u17;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/u17;->z()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    move-object v3, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v3, v1

    .line 31
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_2

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 46
    .line 47
    move-object v4, v0

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object v4, v1

    .line 50
    :goto_1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/esf0;->i()Lcom/p1/mobile/putong/data/SliderData;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    const-string v6, ""

    .line 63
    .line 64
    const/4 v7, 0x0

    .line 65
    invoke-virtual/range {v2 .. v7}, Ll/esf0;->m(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SliderData;Ljava/lang/String;Z)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 76
    .line 77
    const/4 v3, 0x1

    .line 78
    invoke-static {v2, v1, v0, v3, v3}, Lcom/p1/mobile/putong/ui/webview/WebViewDialogAct;->n2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "hideNavigationBar"

    .line 83
    .line 84
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    const-string v1, "skipLoading"

    .line 88
    .line 89
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_2
    return-void
.end method

.method public final O6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/bbm;->h()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/cd30;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/cd30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/dd30;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/dd30;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final O7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->f4:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object v0, v0, Ll/dkb;->f4:Ll/jxd0;

    .line 30
    .line 31
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Ll/k930;->f:Z

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_1

    .line 85
    .line 86
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 89
    .line 90
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/data/Purpose;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_1
    const/4 v0, 0x0

    .line 121
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 124
    .line 125
    iget-object v1, v1, Ll/dkb;->Z3:Ll/wyd0;

    .line 126
    .line 127
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Ljava/lang/CharSequence;

    .line 132
    .line 133
    const-string v2, "marryMode"

    .line 134
    .line 135
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    const-string v1, "marriage"

    .line 143
    .line 144
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v1, "mode_switching"

    .line 155
    .line 156
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 165
    .line 166
    .line 167
    :cond_3
    :goto_1
    return-void
.end method

.method public final synthetic O8(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E9()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->w9(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final O9()V
    .locals 4

    .line 1
    sget-object v0, Ll/c4f0;->e:Ll/c4f0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/c4f0$a;->a(Landroid/content/Context;)Ll/c4f0$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/c4f0$b;->a()Ll/c4f0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$l;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$l;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 16
    .line 17
    .line 18
    const-wide/32 v2, -0x80000000

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2, v3, v1}, Ll/c4f0;->c(JLl/dyl;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final P6()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-static {}, Ll/d79;->T()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 38
    .line 39
    const-string v0, "svip"

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 66
    .line 67
    const-string v0, "vip"

    .line 68
    .line 69
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 79
    .line 80
    const-string v0, "seeWhoLikedMe"

    .line 81
    .line 82
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N4(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method public final synthetic P7(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Z9(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic P8(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/esf0;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->N9()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public P9(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    iget-object v0, v0, Ll/dkb;->F4:Ll/jxd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Ll/dkb;->b8(Z)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 81
    .line 82
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 83
    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string v0, "mode_switching"

    .line 91
    .line 92
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 107
    .line 108
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 109
    .line 110
    if-eqz p1, :cond_2

    .line 111
    .line 112
    const-string v1, "marryMode"

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    const-string v1, "loveMode"

    .line 116
    .line 117
    :goto_0
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 123
    .line 124
    iget-object v0, v0, Ll/dkb;->F1:Lrx/subjects/b;

    .line 125
    .line 126
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object p0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 136
    .line 137
    invoke-virtual {v0, p0, p1}, Ll/x19;->L(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final Q6()V
    .locals 3

    .line 1
    invoke-static {}, Ll/d79;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->I2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/kb30;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/kb30;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/lb30;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/lb30;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/mb30;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/mb30;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/nb30;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/nb30;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Ll/ob30;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/ob30;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v0, Ll/qb30;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/qb30;-><init>()V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/rb30;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/rb30;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic Q7(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/otm;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0, v0}, Ll/otm;->D(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/otm;->o()Ll/otm;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p1, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/otm;->E(Ljava/lang/Integer;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic Q8(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/esf0;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/esf0;->g()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/esf0;->n()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/esf0;->x()Lrx/subjects/b;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->N9()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->N9()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final Q9()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    instance-of v0, p0, Ll/cvl;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p0, Ll/cvl;

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ll/cvl;->I2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, v0}, Ll/cvl;->n2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j2:Lrx/subjects/b;

    .line 39
    .line 40
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public final R6()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/api/e;->F0:Ll/jxd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/api/e;->F0:Ll/jxd0;

    .line 22
    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/e;->F0:Ll/jxd0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->If()V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/api/g;->T2:Ll/jxd0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Gf()V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public final synthetic R7()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R8()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->y6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R9()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    instance-of v0, p0, Ll/cvl;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p0, Ll/cvl;

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MARRY_MODE:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 27
    .line 28
    invoke-interface {p0, v0}, Ll/cvl;->I2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, v0}, Ll/cvl;->n2(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public final S6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->R8()V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e;->U8()Lrx/c;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic S7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/n70;->g()Ll/n70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/te30;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/te30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/n70;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic S8()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->C7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S9()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final T6()V
    .locals 3

    .line 1
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/x19;->G(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/d09;->j()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/d09;->l()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/d09;->k()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/x19;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 48
    .line 49
    new-instance v2, Ll/wb30;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/wb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic T7(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T9()Lcom/p1/mobile/putong/newui/main/base/TabName;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    return-object p0
.end method

.method public final U6()V
    .locals 6

    .line 1
    invoke-static {}, Ll/gra;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->H2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gra;->s1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/a0g;->L()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    :cond_1
    return-void

    .line 26
    :cond_2
    invoke-static {}, Ll/gra;->G2()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-nez v0, :cond_4

    .line 32
    .line 33
    invoke-static {}, Ll/gra;->H2()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_3
    const/4 v0, 0x0

    .line 41
    goto :goto_1

    .line 42
    :cond_4
    :goto_0
    move v0, v1

    .line 43
    :goto_1
    invoke-static {}, Ll/gra;->s1()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v0, :cond_5

    .line 48
    .line 49
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    invoke-virtual {v3}, Ll/dkb;->t7()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    new-instance v4, Lcom/p1/mobile/putong/core/newui/main/a$u;

    .line 58
    .line 59
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/core/newui/main/a$u;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    new-instance v4, Lcom/p1/mobile/putong/core/newui/main/a$t;

    .line 67
    .line 68
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/core/newui/main/a$t;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    new-instance v4, Lcom/p1/mobile/putong/core/newui/main/a$a;

    .line 80
    .line 81
    invoke-direct {v4, p0, v2}, Lcom/p1/mobile/putong/core/newui/main/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;Z)V

    .line 82
    .line 83
    .line 84
    new-instance v5, Lcom/p1/mobile/putong/core/newui/main/a$b;

    .line 85
    .line 86
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/core/newui/main/a$b;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v4, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    :cond_5
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    new-instance v4, Ll/ld30;

    .line 101
    .line 102
    invoke-direct {v4}, Ll/ld30;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {p0, v3}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    new-instance v4, Lcom/p1/mobile/putong/core/newui/main/a$c;

    .line 118
    .line 119
    invoke-direct {v4, p0, v2, v0}, Lcom/p1/mobile/putong/core/newui/main/a$c;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;ZZ)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Ll/md30;

    .line 123
    .line 124
    invoke-direct {v0}, Ll/md30;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v4, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v3, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v2, Ll/nd30;

    .line 143
    .line 144
    invoke-direct {v2}, Ll/nd30;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$d;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$d;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 166
    .line 167
    .line 168
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 173
    .line 174
    .line 175
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 178
    .line 179
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    new-instance v1, Ll/od30;

    .line 184
    .line 185
    invoke-direct {v1}, Ll/od30;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$e;

    .line 201
    .line 202
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$e;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 203
    .line 204
    .line 205
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public final synthetic U7(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "fake_risk_audit_default_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->L0(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->aa()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic U8(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->checkSmartLockSave(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final U9(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;->M4()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/hmj0;->b(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->D(Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void

    .line 45
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final V6()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->G2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->H2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gra;->s1()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/a0g;->L()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    :cond_1
    return-void

    .line 26
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-wide/16 v1, 0x5

    .line 35
    .line 36
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/eb30;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/eb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic V7(Ll/ovb0;)V
    .locals 6

    .line 1
    iget-object v0, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    iget-object v1, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v2, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v2, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, v1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 25
    .line 26
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->E7(Lcom/p1/mobile/putong/data/CounterConversations;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-static {v0, v1, v2}, Ll/dsc0;->b(Lcom/p1/mobile/putong/data/Counter;Lcom/p1/mobile/putong/data/ConversationCounter;Ljava/lang/Boolean;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->t2:Lrx/subjects/a;

    .line 39
    .line 40
    new-instance v4, Ll/bkj0;

    .line 41
    .line 42
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    sub-int v3, v0, v3

    .line 47
    .line 48
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ConversationCounter;->conversations:Lcom/p1/mobile/putong/data/CounterConversations;

    .line 53
    .line 54
    iget v1, v1, Lcom/p1/mobile/putong/data/CounterConversations;->unseen:I

    .line 55
    .line 56
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-direct {v4, v5, v3, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v4}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p1, Ll/f7s;

    .line 69
    .line 70
    iget p1, p1, Ll/f7s;->g:I

    .line 71
    .line 72
    add-int/2addr v0, p1

    .line 73
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 74
    .line 75
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 76
    .line 77
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-interface {p1}, Ll/qam;->d()Lrx/subjects/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    add-int/2addr v0, p1

    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p1}, Ll/c8m0;->d()Lrx/subjects/a;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    add-int/2addr v0, p1

    .line 119
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Ll/n46;->n()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_1

    .line 128
    .line 129
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Ll/n46;->k()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    add-int/2addr v0, p1

    .line 138
    :cond_1
    invoke-static {}, Ll/gra;->D2()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    invoke-static {}, Ll/w250;->a()Ll/w250;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v0}, Ll/w250;->e(I)V

    .line 149
    .line 150
    .line 151
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 152
    .line 153
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 154
    .line 155
    iget p1, p1, Lcom/p1/mobile/putong/core/api/g;->s2:I

    .line 156
    .line 157
    sub-int/2addr v0, p1

    .line 158
    const/4 p1, 0x0

    .line 159
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 164
    .line 165
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->r2:Lrx/subjects/a;

    .line 170
    .line 171
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 180
    .line 181
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 182
    .line 183
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 184
    .line 185
    if-gtz v0, :cond_4

    .line 186
    .line 187
    if-eqz v1, :cond_3

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_3
    move v1, p1

    .line 191
    goto :goto_1

    .line 192
    :cond_4
    :goto_0
    const/4 v1, 0x1

    .line 193
    :goto_1
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 197
    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->q2:Lrx/subjects/a;

    .line 201
    .line 202
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public final synthetic V8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->m0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->cp()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/gra;->x3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    iget-object v0, v0, Ll/dkb;->v3:Ll/jxd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    iget-object v0, v0, Ll/dkb;->v3:Ll/jxd0;

    .line 48
    .line 49
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    const-string v0, "\u60a8\u4e0a\u7ebf\u540e\u4f1a\u4e3a\u60a8\u901a\u77e5\u597d\u53cb\uff0c\u5982\u4e0d\u9700\u8981\u53ef\u5230\u9690\u79c1\u901a\u77e5\u91cc\u5173\u95ed\u529f\u80fd"

    .line 55
    .line 56
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 61
    .line 62
    if-ne p1, v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/p1/mobile/android/app/Frag;

    .line 79
    .line 80
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFrag;

    .line 81
    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFrag;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFrag;->O4()V

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->G:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 92
    .line 93
    if-ne v0, v1, :cond_2

    .line 94
    .line 95
    if-eq p1, v1, :cond_2

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->v9()V

    .line 98
    .line 99
    .line 100
    :cond_2
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->G:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 101
    .line 102
    return-void
.end method

.method public final V9(Lcom/p1/mobile/putong/newui/main/base/TabName;ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    if-eqz p2, :cond_4

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    if-ne p1, p2, :cond_4

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 14
    .line 15
    invoke-virtual {v0, p2, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v0, 0x0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    move v2, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v2, v0

    .line 36
    :goto_0
    if-eqz p3, :cond_1

    .line 37
    .line 38
    if-nez p2, :cond_1

    .line 39
    .line 40
    move p2, v1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move p2, v0

    .line 43
    :goto_1
    if-nez p3, :cond_2

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    move v0, v1

    .line 48
    :cond_2
    if-nez v2, :cond_3

    .line 49
    .line 50
    if-nez p2, :cond_3

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    :cond_3
    iget-object p1, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 55
    .line 56
    instance-of p1, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 57
    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ys()Ll/lc3;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 71
    .line 72
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->c6()Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 79
    .line 80
    check-cast p0, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/lc3;->a()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    iget p3, p1, Ll/lc3;->b:I

    .line 87
    .line 88
    iget v0, p1, Ll/lc3;->c:I

    .line 89
    .line 90
    iget p1, p1, Ll/lc3;->d:I

    .line 91
    .line 92
    invoke-static {p0, p2, p3, v0, p1}, Ll/tft;->c(Ljava/lang/String;IIII)V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void
.end method

.method public final synthetic W7(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W8(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final W9(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/a$m;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x5

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/gra;->o2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->A:Z

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    const-string p0, "e_mytab_incomplete"

    .line 28
    .line 29
    const-string p1, "p_suggest_users_home_view"

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public final X6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/og30;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/og30;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/pg30;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/pg30;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ll/qg30;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/qg30;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic X7(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->e2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final X9(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/BuzzComboFrag;->N4()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getTag()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/hmj0;->b(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->D(Z)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->l()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->C(Z)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->v()V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->o()V

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->C(Z)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->w()V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void

    .line 67
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final Y5()V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-static {}, Ll/gra;->e2()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_6

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 43
    .line 44
    if-nez v2, :cond_0

    .line 45
    .line 46
    new-instance p0, Ljava/lang/RuntimeException;

    .line 47
    .line 48
    const-string v0, "core.user.me_().settings.getSettingGroup().marriage == null"

    .line 49
    .line 50
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 88
    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 106
    .line 107
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/MarrySettings;->closeMode:Z

    .line 108
    .line 109
    if-eqz v2, :cond_1

    .line 110
    .line 111
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 114
    .line 115
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 116
    .line 117
    const-string v0, "loveMode"

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 125
    .line 126
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 127
    .line 128
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 133
    .line 134
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 135
    .line 136
    iget-object v2, v2, Ll/dkb;->M4:Ll/vxd0;

    .line 137
    .line 138
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Ljava/lang/Integer;

    .line 143
    .line 144
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-ne v2, v0, :cond_2

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 155
    .line 156
    iget-object v0, v0, Ll/dkb;->M4:Ll/vxd0;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Ljava/lang/Integer;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    const-string v2, "marryMode"

    .line 169
    .line 170
    if-nez v0, :cond_5

    .line 171
    .line 172
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 175
    .line 176
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 177
    .line 178
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/lang/CharSequence;

    .line 183
    .line 184
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_3

    .line 189
    .line 190
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 193
    .line 194
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 195
    .line 196
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 203
    .line 204
    const/4 v3, 0x0

    .line 205
    invoke-virtual {v0, v3}, Ll/dkb;->b8(Z)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-eqz v0, :cond_4

    .line 210
    .line 211
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 212
    .line 213
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 214
    .line 215
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 216
    .line 217
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 221
    .line 222
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 223
    .line 224
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 225
    .line 226
    invoke-virtual {p0, v2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 233
    .line 234
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 243
    .line 244
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 245
    .line 246
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    new-instance v2, Ll/ug30;

    .line 255
    .line 256
    invoke-direct {v2}, Ll/ug30;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    new-instance v0, Ll/wg30;

    .line 268
    .line 269
    invoke-direct {v0}, Ll/wg30;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 281
    .line 282
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 283
    .line 284
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 285
    .line 286
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    check-cast p0, Ljava/lang/Integer;

    .line 291
    .line 292
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    const/4 v0, 0x1

    .line 297
    if-ne p0, v0, :cond_6

    .line 298
    .line 299
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 300
    .line 301
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 302
    .line 303
    iget-object p0, p0, Ll/dkb;->M4:Ll/vxd0;

    .line 304
    .line 305
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 309
    .line 310
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 311
    .line 312
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 313
    .line 314
    invoke-virtual {p0, v2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    :cond_6
    :goto_0
    return-void
.end method

.method public final Y6()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j1:Lcom/p1/mobile/putong/core/api/CoreInnerPush;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreInnerPush;->d()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ra30;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ra30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/sa30;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/sa30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/ua30;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ua30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/va30;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/va30;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic Y7(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y8(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/y5x;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final Y9(Ljava/lang/String;Z)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/a$m;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "click"

    .line 13
    .line 14
    const-string v3, "change"

    .line 15
    .line 16
    const-string v4, "click_change"

    .line 17
    .line 18
    if-eq v0, v1, :cond_f

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    const-string v5, "sub_page_unread"

    .line 22
    .line 23
    const-string v6, "swipe_page"

    .line 24
    .line 25
    const-string v7, "red_dot_normal"

    .line 26
    .line 27
    const-string v8, "red_dot"

    .line 28
    .line 29
    const-string v9, "p_suggest_users_home_view"

    .line 30
    .line 31
    if-eq v0, v1, :cond_b

    .line 32
    .line 33
    const/4 v1, 0x4

    .line 34
    if-eq v0, v1, :cond_4

    .line 35
    .line 36
    const/4 p0, 0x5

    .line 37
    if-eq v0, p0, :cond_2

    .line 38
    .line 39
    const/4 p0, 0x6

    .line 40
    if-eq v0, p0, :cond_1

    .line 41
    .line 42
    const/16 p0, 0x8

    .line 43
    .line 44
    if-eq v0, p0, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    new-array p0, p0, [Ll/sfj0$a;

    .line 49
    .line 50
    const-string p1, "e_intl_tab_meet"

    .line 51
    .line 52
    const-string p2, "p_intl_meet_view"

    .line 53
    .line 54
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/sbw;->i()V

    .line 61
    .line 62
    .line 63
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/nbw;->z()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    if-eqz p2, :cond_3

    .line 70
    .line 71
    move-object v2, v3

    .line 72
    :cond_3
    invoke-static {v4, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p2, "e_navigation"

    .line 81
    .line 82
    invoke-static {p2, p1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    if-eqz p2, :cond_5

    .line 87
    .line 88
    move-object v2, v3

    .line 89
    :cond_5
    invoke-static {v4, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 94
    .line 95
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 98
    .line 99
    sget-object v2, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 100
    .line 101
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_7

    .line 106
    .line 107
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_6

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_6
    const-string v0, "false"

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_7
    :goto_0
    const-string v0, "true"

    .line 122
    .line 123
    :goto_1
    invoke-static {v8, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/main/a;->D:Z

    .line 128
    .line 129
    if-eqz v3, :cond_8

    .line 130
    .line 131
    const-string v3, "refresh"

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_8
    const-string v3, "explore"

    .line 135
    .line 136
    :goto_2
    const-string v4, "tab_state"

    .line 137
    .line 138
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    filled-new-array {p2, v0, v3}, [Ll/sfj0$a;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    const-string v0, "e_explore"

    .line 147
    .line 148
    invoke-static {v0, p1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 152
    .line 153
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 154
    .line 155
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    const-string p2, "e_red_dot_explore"

    .line 160
    .line 161
    if-nez p1, :cond_a

    .line 162
    .line 163
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 164
    .line 165
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 166
    .line 167
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_9

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_9
    invoke-static {}, Ll/i6e;->d()Ljava/util/Map;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-static {p2, v9, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_a
    :goto_3
    const-string p0, "explore_tab"

    .line 183
    .line 184
    invoke-static {v8, v7, p0, v6, v5}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-static {p2, v9, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_b
    if-eqz p2, :cond_c

    .line 193
    .line 194
    move-object v2, v3

    .line 195
    :cond_c
    invoke-static {v4, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    const-string v0, "e_messages"

    .line 204
    .line 205
    invoke-static {v0, p1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 209
    .line 210
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 211
    .line 212
    sget-object p2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 213
    .line 214
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;->Dot:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;

    .line 215
    .line 216
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->W(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    const-string v0, "e_red_dot_message"

    .line 221
    .line 222
    if-nez p1, :cond_e

    .line 223
    .line 224
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 225
    .line 226
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 227
    .line 228
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->X(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-eqz p0, :cond_d

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_d
    invoke-static {}, Ll/i6e;->d()Ljava/util/Map;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {v0, v9, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_e
    :goto_4
    const-string p0, "message_tab"

    .line 244
    .line 245
    invoke-static {v8, v7, p0, v6, v5}, Ll/i6e;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-static {v0, v9, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :cond_f
    if-eqz p2, :cond_10

    .line 254
    .line 255
    move-object v2, v3

    .line 256
    :cond_10
    invoke-static {v4, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    const-string p2, "e_suggest_users_home"

    .line 265
    .line 266
    invoke-static {p2, p1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public Z5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final Z6()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I4()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->q4()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ih30;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ih30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/jh30;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/jh30;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->r4()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/kh30;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/kh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/lh30;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/lh30;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/mh30;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/mh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 85
    .line 86
    .line 87
    new-instance v2, Ll/nh30;

    .line 88
    .line 89
    invoke-direct {v2}, Ll/nh30;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/d79;->g0()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_1

    .line 104
    .line 105
    invoke-static {}, Ll/d79;->h0()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_0

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    return-void

    .line 113
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->z5()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ll/oh30;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/oh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 132
    .line 133
    .line 134
    new-instance p0, Ll/ph30;

    .line 135
    .line 136
    invoke-direct {p0}, Ll/ph30;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final synthetic Z7(Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->I7(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->d7(J)Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic Z8(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 11
    .line 12
    iget-object p1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->I(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->P0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 26
    .line 27
    iget-object p0, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->d(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final Z9(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dcb;->y3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dcb;->z3()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/xc30;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/xc30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/dcb;->p3(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NewMainBaseSub:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "NewMainPresenter initSubscription"

    .line 11
    .line 12
    invoke-static {v1}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0}, Ll/k930;->a0()V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NewMainSub:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->O9()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/uih0;->k1()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->q7()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S6()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->t7()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E6()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->O6()V

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/td30;

    .line 56
    .line 57
    invoke-direct {v0}, Ll/td30;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Ll/df30;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/df30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/of30;

    .line 69
    .line 70
    invoke-direct {v2}, Ll/of30;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0, v2}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->P6()V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ll/zf30;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/zf30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->R6()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->K6()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->H6()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v2, Ll/kg30;

    .line 103
    .line 104
    invoke-direct {v2}, Ll/kg30;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v2, Ll/vg30;

    .line 112
    .line 113
    invoke-direct {v2}, Ll/vg30;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->Q6()V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->x7()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->n6()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->l6()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->g9()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->B7()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-static {v0}, Ll/kx80;->l(Landroid/app/Activity;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->u7()V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->Y6()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->t9()V

    .line 155
    .line 156
    .line 157
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 158
    .line 159
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 160
    .line 161
    invoke-virtual {v0}, Ll/cza;->z3()V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->l7()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->r6()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->h6()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->D7()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->z7()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->f7()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    new-instance v2, Ll/gh30;

    .line 191
    .line 192
    invoke-direct {v2}, Ll/gh30;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const/4 v2, 0x1

    .line 200
    invoke-virtual {v0, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-instance v3, Ll/rh30;

    .line 209
    .line 210
    invoke-direct {v3}, Ll/rh30;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->L6()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->F6()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->e7()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->X6()V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->T6()V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->s7()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->J6()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->u9()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->r7()V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->a7()V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->F7()V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->y7()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->j7()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->z6()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->M6()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->e6()V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->V6()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->E7()V

    .line 272
    .line 273
    .line 274
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    const-string v3, "delay_jobs_after_cold_start"

    .line 279
    .line 280
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v0, :cond_0

    .line 285
    .line 286
    new-instance v0, Ll/ci30;

    .line 287
    .line 288
    invoke-direct {v0, p0}, Ll/ci30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v0, v2}, Ll/uqb0;->r0(Ljava/lang/Runnable;Z)V

    .line 292
    .line 293
    .line 294
    goto :goto_0

    .line 295
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->C7()V

    .line 296
    .line 297
    .line 298
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->Z6()V

    .line 299
    .line 300
    .line 301
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->B6()V

    .line 302
    .line 303
    .line 304
    invoke-static {v1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 305
    .line 306
    .line 307
    invoke-static {}, Ll/yhi0;->b()V

    .line 308
    .line 309
    .line 310
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->i9()V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->k7()V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->G6()V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->m7()V

    .line 320
    .line 321
    .line 322
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->W6()V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->o7()V

    .line 326
    .line 327
    .line 328
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->i7()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->b7()V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->H7()V

    .line 335
    .line 336
    .line 337
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->p7()V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->g7()V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->h7()V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->d7()V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->c7()V

    .line 350
    .line 351
    .line 352
    return-void
.end method

.method public a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->p6(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final a6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/zg6;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->gn()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final a7()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    const-string v1, "indonesia"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 14
    .line 15
    iget-object v0, v0, Ll/h79;->R:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/String;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/h79;->e3()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/xa30;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0}, Ll/xa30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/ya30;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/ya30;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final synthetic a8(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->H:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a9(Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "marryMode"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->R9()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 27
    .line 28
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/a$f;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/main/a$f;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v1, 0xa

    .line 38
    .line 39
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->Q9()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final aa()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/dkb;->k8()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/dkb;->W7()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->a()Lcom/p1/mobile/putong/core/api/e0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e0;->f()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/api/e0;->a()Lcom/p1/mobile/putong/core/api/e0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/e0;->f()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final b6()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$k;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$k;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x3e8

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b7()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->Eh()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/jc30;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/jc30;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/kc30;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/kc30;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/mc30;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/mc30;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/nc30;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/nc30;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/oc30;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/oc30;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance v0, Ll/pc30;

    .line 84
    .line 85
    invoke-direct {v0}, Ll/pc30;-><init>()V

    .line 86
    .line 87
    .line 88
    new-instance v1, Ll/qc30;

    .line 89
    .line 90
    invoke-direct {v1}, Ll/qc30;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public final synthetic b8(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->o0(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b9(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "step"

    .line 7
    .line 8
    const-string v2, "4"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v1, "available"

    .line 14
    .line 15
    const-string v2, "true"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 26
    .line 27
    iget v2, v2, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ""

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v3, "code"

    .line 42
    .line 43
    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    const-string v1, "tracker"

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 52
    .line 53
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 54
    .line 55
    const v1, 0x30d40

    .line 56
    .line 57
    .line 58
    if-ne v0, v1, :cond_1

    .line 59
    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->code:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/a;->p9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;

    .line 79
    .line 80
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginData;->code:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/main/a;->q9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->m9:I

    .line 87
    .line 88
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 89
    .line 90
    .line 91
    :goto_0
    const/4 p0, 0x0

    .line 92
    sput-object p0, Ll/abe0;->g:Ljava/lang/String;

    .line 93
    .line 94
    return-void
.end method

.method public final ba()V
    .locals 4

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    cmp-long p0, v0, v2

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    cmp-long p0, v0, v2

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 56
    .line 57
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public final c6()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dcb;->x3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/qa30;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qa30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final c7()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->l()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/db30;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/db30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/fb30;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/fb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/gb30;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/gb30;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/hb30;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/hb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c0:Ll/ml9;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/ml9;->c3()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/ib30;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/ib30;-><init>()V

    .line 87
    .line 88
    .line 89
    new-instance v2, Lcom/p1/mobile/putong/core/newui/main/a$n;

    .line 90
    .line 91
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/main/a$n;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/jb30;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/jb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final synthetic c8(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;->EXPANDED_PROFILE_STYLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$ExpandedCardStyle;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->J(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic c9(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p0, p1, v0, v1}, Ll/pci;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d6(Landroidx/fragment/app/FragmentManager;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/t4j;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/newui/main/base/TabName;->values()[Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    array-length v1, v0

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    :goto_0
    if-ge v2, v1, :cond_3

    .line 20
    .line 21
    aget-object v4, v0, v2

    .line 22
    .line 23
    if-ne p2, v4, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {p1, v5}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    if-nez v5, :cond_2

    .line 35
    .line 36
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    new-instance v6, Ll/m930;

    .line 45
    .line 46
    invoke-direct {v6, p0}, Ll/m930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, v5, v4, v6}, Ll/t4j;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Lkotlin/jvm/functions/Function1;)V

    .line 50
    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    if-eqz v3, :cond_4

    .line 57
    .line 58
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Ll/t4j;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    :goto_2
    return-void
.end method

.method public final d7()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->J6:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    const-string v1, "local_intl_prompt_message_type"

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->np(Lcom/p1/mobile/putong/core/data/MessageType;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v0, Ll/cb30;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/cb30;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic d8(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/o810;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic d9(Ll/pf60;)V
    .locals 7

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->z:Z

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v0, v0, Ll/dkb;->x6:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {}, Ll/gra;->i3()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    const-wide/16 v3, 0x1

    .line 42
    .line 43
    cmp-long p1, v0, v3

    .line 44
    .line 45
    if-lez p1, :cond_1

    .line 46
    .line 47
    if-lez v2, :cond_1

    .line 48
    .line 49
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    sub-long/2addr v3, v0

    .line 54
    const-wide/32 v0, 0x5265c00

    .line 55
    .line 56
    .line 57
    int-to-long v5, v2

    .line 58
    mul-long/2addr v5, v0

    .line 59
    cmp-long p1, v3, v5

    .line 60
    .line 61
    if-lez p1, :cond_1

    .line 62
    .line 63
    :cond_0
    const/4 p1, 0x0

    .line 64
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->z:Z

    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final e6()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->B2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->K1:Lcom/p1/mobile/putong/core/api/h;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/h;->U:Ll/jxd0;

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final e7()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/sh30;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/sh30;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 50
    .line 51
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/th30;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/th30;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/uh30;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/uh30;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ll/vh30;

    .line 78
    .line 79
    invoke-direct {v0}, Ll/vh30;-><init>()V

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/wh30;

    .line 83
    .line 84
    invoke-direct {v1}, Ll/wh30;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public final synthetic e8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->I0()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->e:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    sget p1, Ll/ji30;->f:I

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->k()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p1, v0

    .line 52
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic e9(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->O7()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->g6()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->b6()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->c6()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->j6()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->f6()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f6()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/k930;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/k930;->g:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->INSTANCE:Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->l()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f7()V
    .locals 3

    .line 1
    sget-object v0, Ll/bep;->INSTANCE:Ll/bep;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bep;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/o930;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/o930;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x2

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/p930;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/p930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/q930;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/q930;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Ll/v3l0;->e()Ll/v3l0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ll/v3l0;->b()Lrx/subjects/b;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/r930;

    .line 75
    .line 76
    invoke-direct {v1}, Ll/r930;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/s930;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/s930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 86
    .line 87
    .line 88
    new-instance p0, Ll/t930;

    .line 89
    .line 90
    invoke-direct {p0}, Ll/t930;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final synthetic f8(Lcom/android/billingclient/api/a;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/tvl;->a()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/fd30;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/fd30;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/gd30;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/gd30;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/id30;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/id30;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic f9(Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;->open:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/newui/ttcmigrate/TtcAccountMigrateDisplayAct;->Companion:Lcom/p1/mobile/putong/core/newui/ttcmigrate/TtcAccountMigrateDisplayAct$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/ttcmigrate/TtcAccountMigrateDisplayAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/TtcMigrateDisplayData;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final g6()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/k930;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/k930;->g:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->Z9(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final g7()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->m5()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/l99;->n3()V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/l99;->m3()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/yb30;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/yb30;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/zb30;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/zb30;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/l99;->q3()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/l99;->p3()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/joa;->y3()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v3, Ll/bc30;

    .line 80
    .line 81
    invoke-direct {v3}, Ll/bc30;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/cc30;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/cc30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/dc30;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/dc30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->A3()Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ll/ec30;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/ec30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 132
    .line 133
    .line 134
    new-instance v2, Ll/fc30;

    .line 135
    .line 136
    invoke-direct {v2}, Ll/fc30;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-static {}, Ll/ts9;->e()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_0

    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->y3()Lrx/subjects/a;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    new-instance v0, Ll/gc30;

    .line 165
    .line 166
    invoke-direct {v0}, Ll/gc30;-><init>()V

    .line 167
    .line 168
    .line 169
    new-instance v1, Ll/hc30;

    .line 170
    .line 171
    invoke-direct {v1}, Ll/hc30;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 179
    .line 180
    .line 181
    :cond_0
    return-void
.end method

.method public final synthetic g8(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/x19;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final g9()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->G0:Ll/jxd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->cp()V

    .line 34
    .line 35
    .line 36
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    new-instance v1, Ll/mg30;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/mg30;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->dp(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->S1:Lrx/subjects/a;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/ng30;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/ng30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->jp()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public h1()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/main/a$v;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/k930;->l:Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 7
    .line 8
    return-void
.end method

.method public final h6()V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Ee()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final h7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/t7a;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->n4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/joa;->f4()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/lc9;->s3()Lrx/c;

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/lc9;->u3()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ad30;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ad30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v0, Ll/bd30;

    .line 69
    .line 70
    invoke-direct {v0}, Ll/bd30;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void
.end method

.method public final synthetic h8(Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->U6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h9()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/gp/a;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final i6()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Bf()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final i7()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z99;->o3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->l:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final i9()V
    .locals 3

    .line 1
    invoke-static {}, Ll/e7d0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->o2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/gra;->p2()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ah30;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/ah30;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object v1, v1, Ll/dkb;->w6:Ll/jxd0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/hxd0;->obs()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/utq;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/utq;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/bh30;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/bh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public final j6()V
    .locals 1

    .line 1
    :try_start_0
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/x95;->k(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    return-void
.end method

.method public final j7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/d79;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 11
    .line 12
    iget-object v0, v0, Ll/yd9;->R:Ll/jxd0;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t2:Ll/yd9;

    .line 23
    .line 24
    iget-object v0, v0, Ll/yd9;->R:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/qyp;->i()Ll/qyp;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "test"

    .line 47
    .line 48
    const-string v2, "\u8fd1\u671f\u591a\u6b21\u5411\u4ed6\u4eba\u9aee\u9001\u5ee3\u544a\u4fe1\u606f\uff0c\u5df2\u88ab\u5e73\u98b1\u6a19\u8a18\u7232\u98a8\u96aa\u7528\u6236\u3002\u518d\u6709\u985e\u4f3c\u884c\u7232\uff0c\u60a8\u7684\u5e33\u865f\u5c07\u88ab<span style=\"color: #FE7E1D;\">\u9650\u88fd\u66dd\u5149\u6216\u5c01\u7981</span>"

    .line 49
    .line 50
    invoke-virtual {v0, p0, v1, v2}, Ll/qyp;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/rg30;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/rg30;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/sg30;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/sg30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Ll/tg30;

    .line 82
    .line 83
    invoke-direct {p0}, Ll/tg30;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic j8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)Lrx/c;
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/rd30;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/rd30;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Ll/ud30;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ll/ud30;-><init>(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public j9()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->I4()V

    .line 25
    .line 26
    .line 27
    :cond_0
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const-string p0, "click_change"

    .line 32
    .line 33
    const-string v0, "click"

    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "e_messages"

    .line 44
    .line 45
    const-string v1, "p_messages_view"

    .line 46
    .line 47
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final k6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/a$m;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    :pswitch_0
    goto :goto_0

    .line 13
    :pswitch_1
    const/4 p0, 0x0

    .line 14
    new-array p0, p0, [Ll/sfj0$a;

    .line 15
    .line 16
    const-string p1, "e_intl_navbar_meet_view"

    .line 17
    .line 18
    const-string v0, "p_navigation_view"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFrag;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFrag;-><init>()V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_2
    invoke-static {}, Ll/gra;->Q1()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "bottom_navigation_bar"

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/o2c;->h(Landroid/content/Context;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :pswitch_3
    sget-object p0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/sbw;->k()Lcom/p1/mobile/android/app/Frag;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 54
    .line 55
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;-><init>()V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :pswitch_5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->J(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->buildLiveSquareFrag()Landroidx/fragment/app/Fragment;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 83
    return-object p0

    .line 84
    :pswitch_6
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->v:I

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->B5(I)Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :pswitch_7
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/frag/base/HomeLayoutFrag;->C5()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    nop

    .line 97
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final k7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ep(Z)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Vm()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v0, Ll/rc30;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/rc30;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Lp()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 65
    .line 66
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->qq(D)V

    .line 69
    .line 70
    .line 71
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Ep(Z)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final synthetic k8(Lcom/p1/mobile/putong/newui/main/base/TabName;Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 1

    .line 1
    instance-of v0, p2, Ll/sum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ll/sum;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->q6()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p2, v0, p3, p1, p0}, Ll/sum;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public k9(Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/android/app/Frag;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Ll/x930;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/x930;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v2, Ll/ia30;

    .line 38
    .line 39
    invoke-direct {v2, v0, p1}, Ll/ia30;-><init>(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_0

    .line 58
    .line 59
    return v1

    .line 60
    :cond_0
    const/4 p0, 0x0

    .line 61
    return p0
.end method

.method public final l6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->jn(Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/ic30;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/ic30;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final l7()V
    .locals 4

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ll/sbw;->INSTANCE:Ll/sbw;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/sbw;->h()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/d79;->F()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/ca30;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/ca30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget-object v2, Ll/haw;->Companion:Ll/haw$a;

    .line 43
    .line 44
    invoke-virtual {v2}, Ll/haw$a;->a()Ll/haw;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ll/haw;->z0()Lrx/subjects/a;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/da30;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0}, Ll/da30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 60
    .line 61
    .line 62
    new-instance v3, Ll/ea30;

    .line 63
    .line 64
    invoke-direct {v3}, Ll/ea30;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const/4 v2, 0x1

    .line 91
    invoke-virtual {v1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    new-instance v2, Ll/fa30;

    .line 96
    .line 97
    invoke-direct {v2, p0, v0}, Ll/fa30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/LoveBuzzNotifyUserPop;)V

    .line 98
    .line 99
    .line 100
    new-instance p0, Ll/ga30;

    .line 101
    .line 102
    invoke-direct {p0}, Ll/ga30;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method

.method public final synthetic l8(Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->i:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->i:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v1, Ll/od2;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v1, v2}, Ll/od2;-><init>(Landroid/app/Activity;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/view/ViewGroup;

    .line 44
    .line 45
    sget v3, Ll/kec0;->x7:I

    .line 46
    .line 47
    iget-object v4, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->j:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 48
    .line 49
    sget-object v5, Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;->COUNTDOWN_CONV_CREATE:Lcom/p1/mobile/putong/core/api/CoreInnerPush$InnerPushLayoutType;

    .line 50
    .line 51
    if-ne v4, v5, :cond_1

    .line 52
    .line 53
    sget v3, Ll/kec0;->c2:I

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v4, -0x1

    .line 58
    :goto_0
    const/4 v5, 0x1

    .line 59
    invoke-virtual {v1, v3, v5}, Ll/od2;->s(IZ)Ll/od2;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3, v2}, Ll/od2;->z(Landroid/view/ViewGroup;)Ll/od2;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {}, Ll/bnl0;->F0()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {v2, v3}, Ll/od2;->x(I)Ll/od2;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-wide/16 v5, 0xc8

    .line 76
    .line 77
    invoke-virtual {v2, v5, v6}, Ll/od2;->u(J)Ll/od2;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->k:J

    .line 82
    .line 83
    const-wide/16 v7, 0x0

    .line 84
    .line 85
    cmp-long v3, v5, v7

    .line 86
    .line 87
    if-lez v3, :cond_2

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    const-wide/16 v5, 0xbb8

    .line 91
    .line 92
    :goto_1
    invoke-virtual {v2, v5, v6}, Ll/od2;->q(J)Ll/od2;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    new-instance v3, Lcom/p1/mobile/putong/core/newui/main/a$j;

    .line 97
    .line 98
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/main/a$j;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v3}, Ll/od2;->p(Ll/od2$a;)Ll/od2;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    new-instance v3, Ll/qe30;

    .line 106
    .line 107
    invoke-direct {v3, p0, v0}, Ll/qe30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2, p1, v3}, Ll/od2;->y(Ljava/lang/Object;Ll/od2$b;)V

    .line 111
    .line 112
    .line 113
    if-ltz v4, :cond_3

    .line 114
    .line 115
    invoke-virtual {v1, v4}, Ll/od2;->v(I)Ll/od2;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0, v4}, Ll/od2;->w(I)Ll/od2;

    .line 120
    .line 121
    .line 122
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-eqz p0, :cond_4

    .line 129
    .line 130
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, v1}, Ll/ud2;->s(Ll/od2;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_4
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->g:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p0, v1, p1}, Ll/ud2;->t(Ll/od2;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public l9(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    const-string v0, "saved_fragment_name"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->transform(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iput-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 18
    .line 19
    :cond_0
    const-string v0, "msg_tab_index"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->v:I

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final m6()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->n7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r1:Ll/tx6;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tx6;->c3()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/re30;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/re30;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/se30;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/se30;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final m7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->X2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->h4:Lrx/subjects/b;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/newui/main/a$s;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/main/a$s;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/fg30;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/fg30;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic m8(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->T3()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->y9()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public m9()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q2:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    aput v2, v0, v1

    .line 10
    .line 11
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/main/a;->w:Z

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ah()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->dr()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 32
    .line 33
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->y:Z

    .line 34
    .line 35
    if-nez v0, :cond_4

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dkb;->R:Ll/gyd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 50
    .line 51
    iget-object v3, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 61
    .line 62
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    move v1, v2

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 73
    .line 74
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    const/4 v1, 0x3

    .line 83
    goto :goto_0

    .line 84
    :cond_3
    const/4 v1, 0x2

    .line 85
    :goto_0
    const-string v0, "cold_boot_toaddrtype"

    .line 86
    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    filled-new-array {v0}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v1, "e_apprenew_expose"

    .line 100
    .line 101
    const-string v3, "p_suggest_users_home_view"

    .line 102
    .line 103
    invoke-static {v1, v3, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 104
    .line 105
    .line 106
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/main/a;->y:Z

    .line 107
    .line 108
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/h79;->f3()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_5

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 119
    .line 120
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 121
    .line 122
    iget-object v0, v0, Ll/h79;->R:Ll/wyd0;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ljava/lang/String;

    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 133
    .line 134
    invoke-virtual {v1, v0}, Ll/h79;->d3(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 139
    .line 140
    :cond_5
    iget-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->Z5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public final n6()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->R8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->bf()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ll/pb30;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/pb30;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final n7()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BigEmoji:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object v0, v0, Ll/dkb;->N1:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v0, v0, Ll/dkb;->N1:Ll/jxd0;

    .line 33
    .line 34
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "https://auto.tancdn.com/v1/raw/bd957249-2f80-4f31-adcd-a3eefc6afbad12.svga"

    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->batchDownload(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    sget-object v0, Ll/oze;->i:Ljava/util/Set;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 63
    .line 64
    .line 65
    sget-object v0, Ll/oze;->h:Ljava/util/Map;

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 68
    .line 69
    .line 70
    sget-object v0, Ll/oze;->d:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ll/oze$a;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v3, v1, Ll/oze$a;->b:I

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    sget-object v3, Ll/oze;->i:Ljava/util/Set;

    .line 99
    .line 100
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    sget-object v3, Ll/oze;->h:Ljava/util/Map;

    .line 104
    .line 105
    iget v1, v1, Ll/oze$a;->d:I

    .line 106
    .line 107
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/tye;->b()Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_2

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->new_()Lcom/p1/mobile/putong/core/data/EmojiAnimData;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-instance v0, Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/EmojiAnimData;->emojiAnimCreatedTime:Ljava/util/Map;

    .line 139
    .line 140
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0, p0}, Ll/tye;->j(Lcom/p1/mobile/putong/core/data/EmojiAnimData;)V

    .line 145
    .line 146
    .line 147
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BigEmoji:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 148
    .line 149
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public final synthetic n8(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->T3()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->x6()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public n9(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "saved_fragment_name"

    .line 8
    .line 9
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->c0()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->v:I

    .line 39
    .line 40
    const-string p0, "msg_tab_index"

    .line 41
    .line 42
    invoke-virtual {p1, p0, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final o6()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cd()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fs()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/i;->t3()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/xd30;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/xd30;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/yd30;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/yd30;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final o7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/sd30;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/sd30;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ee30;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ee30;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/dkb;->B7()Lrx/c;

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->I6()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic o8(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o9()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->H4()V

    .line 25
    .line 26
    .line 27
    :cond_0
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    new-array p0, p0, [Ll/sfj0$a;

    .line 33
    .line 34
    const-string v0, "e_message_double_click"

    .line 35
    .line 36
    const-string v1, "p_messages_view"

    .line 37
    .line 38
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public final p6(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v4, "start old: "

    .line 10
    .line 11
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v4, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v4, " -> new: "

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "[FragmentChange]"

    .line 32
    .line 33
    invoke-static {v4, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 37
    .line 38
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-eqz v5, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-interface {v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pe()Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-eqz v5, :cond_0

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :cond_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_1

    .line 61
    .line 62
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 63
    .line 64
    invoke-virtual {v5, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v5, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 82
    .line 83
    const-string v6, "extra_new_main_bundle"

    .line 84
    .line 85
    if-ne v1, v5, :cond_4

    .line 86
    .line 87
    iget-object v7, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast v7, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 90
    .line 91
    iget-object v7, v7, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E:Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;

    .line 92
    .line 93
    invoke-virtual {v7, v5}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->J(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    if-nez v7, :cond_4

    .line 98
    .line 99
    invoke-static {}, Ll/gra;->Q1()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_3

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v7, Landroid/os/Bundle;

    .line 110
    .line 111
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    if-eqz v8, :cond_2

    .line 119
    .line 120
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    if-eqz v8, :cond_2

    .line 129
    .line 130
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, v6}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    invoke-interface {v1, v8, v7}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Z8(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 147
    .line 148
    .line 149
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 150
    .line 151
    :cond_4
    iget-object v7, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 152
    .line 153
    iget-object v8, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    invoke-virtual {v8}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    iget-object v9, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 160
    .line 161
    if-eq v9, v1, :cond_6

    .line 162
    .line 163
    invoke-static {}, Ll/c6w;->g()Z

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    if-eqz v9, :cond_5

    .line 168
    .line 169
    :goto_0
    return-void

    .line 170
    :cond_5
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v8, v3}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    instance-of v9, v3, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$b;

    .line 179
    .line 180
    if-eqz v9, :cond_6

    .line 181
    .line 182
    check-cast v3, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$b;

    .line 183
    .line 184
    invoke-interface {v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService$b;->E0()V

    .line 185
    .line 186
    .line 187
    invoke-static {}, Ll/c6w;->f()V

    .line 188
    .line 189
    .line 190
    :cond_6
    iget-object v3, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 191
    .line 192
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/newui/main/a;->u6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    iput-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 199
    .line 200
    .line 201
    move-result-object v9

    .line 202
    invoke-interface {v9}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M7()Z

    .line 203
    .line 204
    .line 205
    move-result v9

    .line 206
    const/4 v10, 0x1

    .line 207
    if-eqz v9, :cond_7

    .line 208
    .line 209
    iput-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 210
    .line 211
    if-eqz v2, :cond_7

    .line 212
    .line 213
    if-eq v1, v5, :cond_7

    .line 214
    .line 215
    const-string v5, "\u9752\u5c11\u5e74\u6a21\u5f0f\u4e0b\u65e0\u6cd5\u4f7f\u7528"

    .line 216
    .line 217
    invoke-static {v5, v10, v10}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 218
    .line 219
    .line 220
    :cond_7
    sget-object v5, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 221
    .line 222
    if-eqz v5, :cond_8

    .line 223
    .line 224
    invoke-virtual {v5}, Lcom/p1/mobile/putong/location/a;->z()V

    .line 225
    .line 226
    .line 227
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-interface {v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    if-eqz v5, :cond_9

    .line 236
    .line 237
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 238
    .line 239
    invoke-virtual {v1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-nez v5, :cond_9

    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->Y1()V

    .line 246
    .line 247
    .line 248
    :cond_9
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 249
    .line 250
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    invoke-virtual {v8, v5}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    invoke-virtual {v0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 259
    .line 260
    .line 261
    move-result-object v9

    .line 262
    sget-object v11, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 263
    .line 264
    const/4 v12, 0x0

    .line 265
    if-eq v9, v11, :cond_18

    .line 266
    .line 267
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v9

    .line 271
    if-eqz v9, :cond_b

    .line 272
    .line 273
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 274
    .line 275
    .line 276
    move-result-object v9

    .line 277
    invoke-virtual {v9}, Landroidx/lifecycle/Lifecycle;->b()Landroidx/lifecycle/Lifecycle$State;

    .line 278
    .line 279
    .line 280
    move-result-object v9

    .line 281
    sget-object v11, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    .line 282
    .line 283
    if-ne v9, v11, :cond_b

    .line 284
    .line 285
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 286
    .line 287
    .line 288
    move-result v9

    .line 289
    if-nez v9, :cond_b

    .line 290
    .line 291
    invoke-static {}, Ll/t4j;->f()Z

    .line 292
    .line 293
    .line 294
    move-result v9

    .line 295
    if-eqz v9, :cond_a

    .line 296
    .line 297
    iget-boolean v9, v0, Lcom/p1/mobile/putong/core/newui/main/a;->x:Z

    .line 298
    .line 299
    if-eqz v9, :cond_a

    .line 300
    .line 301
    iget-object v9, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 302
    .line 303
    invoke-virtual {v0, v8, v9}, Lcom/p1/mobile/putong/core/newui/main/a;->d6(Landroidx/fragment/app/FragmentManager;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 304
    .line 305
    .line 306
    :cond_a
    move-object/from16 v18, v1

    .line 307
    .line 308
    move v1, v10

    .line 309
    goto/16 :goto_5

    .line 310
    .line 311
    :cond_b
    sget-object v9, Lcom/p1/mobile/putong/core/newui/main/a$m;->a:[I

    .line 312
    .line 313
    iget-object v11, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 314
    .line 315
    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    .line 316
    .line 317
    .line 318
    move-result v11

    .line 319
    aget v9, v9, v11

    .line 320
    .line 321
    const/4 v11, 0x3

    .line 322
    if-eq v9, v11, :cond_c

    .line 323
    .line 324
    goto :goto_1

    .line 325
    :cond_c
    iget-object v9, v0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 326
    .line 327
    instance-of v11, v9, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 328
    .line 329
    if-eqz v11, :cond_d

    .line 330
    .line 331
    check-cast v9, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 332
    .line 333
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->c6()Ll/pf60;

    .line 334
    .line 335
    .line 336
    move-result-object v9

    .line 337
    iget-object v9, v9, Ll/pf60;->a:Ljava/lang/Object;

    .line 338
    .line 339
    check-cast v9, Ljava/lang/String;

    .line 340
    .line 341
    new-array v11, v12, [Ll/sfj0$a;

    .line 342
    .line 343
    const-string v13, "e_live_entertainment_icon"

    .line 344
    .line 345
    invoke-static {v13, v9, v11}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 346
    .line 347
    .line 348
    :cond_d
    :goto_1
    invoke-virtual {v8}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 349
    .line 350
    .line 351
    move-result-object v9

    .line 352
    invoke-static {}, Lcom/p1/mobile/putong/newui/main/base/TabName;->values()[Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 353
    .line 354
    .line 355
    move-result-object v11

    .line 356
    array-length v13, v11

    .line 357
    move v14, v12

    .line 358
    move v15, v14

    .line 359
    :goto_2
    if-ge v14, v13, :cond_16

    .line 360
    .line 361
    aget-object v5, v11, v14

    .line 362
    .line 363
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v10

    .line 367
    invoke-virtual {v8, v10}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 368
    .line 369
    .line 370
    move-result-object v16

    .line 371
    if-nez v16, :cond_12

    .line 372
    .line 373
    invoke-static {}, Ll/t4j;->f()Z

    .line 374
    .line 375
    .line 376
    move-result v17

    .line 377
    if-eqz v17, :cond_10

    .line 378
    .line 379
    iget-boolean v12, v0, Ll/k930;->g:Z

    .line 380
    .line 381
    if-nez v12, :cond_10

    .line 382
    .line 383
    iget-boolean v12, v0, Ll/k930;->f:Z

    .line 384
    .line 385
    if-nez v12, :cond_10

    .line 386
    .line 387
    iget-object v12, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 388
    .line 389
    invoke-virtual {v12, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result v12

    .line 393
    if-eqz v12, :cond_f

    .line 394
    .line 395
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 396
    .line 397
    .line 398
    move-result-object v12

    .line 399
    move-object/from16 v18, v1

    .line 400
    .line 401
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 402
    .line 403
    invoke-virtual {v12, v1}, Ll/t4j;->k(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/newui/main/a;->k6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;

    .line 408
    .line 409
    .line 410
    move-result-object v12

    .line 411
    invoke-static {v12}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v16

    .line 415
    if-eqz v16, :cond_e

    .line 416
    .line 417
    invoke-virtual {v0, v12, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->r9(Landroidx/fragment/app/Fragment;Z)V

    .line 418
    .line 419
    .line 420
    sget v1, Ll/adc0;->A4:I

    .line 421
    .line 422
    invoke-virtual {v9, v1, v12, v10}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 423
    .line 424
    .line 425
    :cond_e
    move-object v1, v12

    .line 426
    goto :goto_3

    .line 427
    :cond_f
    move-object/from16 v18, v1

    .line 428
    .line 429
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 434
    .line 435
    .line 436
    move-result-object v10

    .line 437
    new-instance v12, Ll/m930;

    .line 438
    .line 439
    invoke-direct {v12, v0}, Ll/m930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 440
    .line 441
    .line 442
    invoke-virtual {v1, v10, v5, v12}, Ll/t4j;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Lkotlin/jvm/functions/Function1;)V

    .line 443
    .line 444
    .line 445
    move-object/from16 v1, v16

    .line 446
    .line 447
    const/4 v15, 0x1

    .line 448
    goto :goto_3

    .line 449
    :cond_10
    move-object/from16 v18, v1

    .line 450
    .line 451
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/newui/main/a;->k6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroidx/fragment/app/Fragment;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v12

    .line 459
    if-eqz v12, :cond_13

    .line 460
    .line 461
    iget-object v12, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 462
    .line 463
    invoke-virtual {v12, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 464
    .line 465
    .line 466
    move-result v12

    .line 467
    if-eqz v12, :cond_11

    .line 468
    .line 469
    const/4 v12, 0x0

    .line 470
    invoke-virtual {v0, v1, v12}, Lcom/p1/mobile/putong/core/newui/main/a;->r9(Landroidx/fragment/app/Fragment;Z)V

    .line 471
    .line 472
    .line 473
    :cond_11
    sget v12, Ll/adc0;->A4:I

    .line 474
    .line 475
    invoke-virtual {v9, v12, v1, v10}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 476
    .line 477
    .line 478
    goto :goto_3

    .line 479
    :cond_12
    move-object/from16 v18, v1

    .line 480
    .line 481
    move-object/from16 v1, v16

    .line 482
    .line 483
    :cond_13
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 484
    .line 485
    .line 486
    move-result v10

    .line 487
    if-eqz v10, :cond_15

    .line 488
    .line 489
    iget-object v10, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 490
    .line 491
    invoke-virtual {v10, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result v5

    .line 495
    if-eqz v5, :cond_14

    .line 496
    .line 497
    sget-object v5, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    .line 498
    .line 499
    invoke-virtual {v9, v1, v5}, Landroidx/fragment/app/k;->w(Landroidx/fragment/app/Fragment;Landroidx/lifecycle/Lifecycle$State;)Landroidx/fragment/app/k;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v9, v1}, Landroidx/fragment/app/k;->y(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 503
    .line 504
    .line 505
    goto :goto_4

    .line 506
    :cond_14
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 507
    .line 508
    .line 509
    move-result v5

    .line 510
    if-nez v5, :cond_15

    .line 511
    .line 512
    invoke-virtual {v9, v1}, Landroidx/fragment/app/k;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 513
    .line 514
    .line 515
    :cond_15
    :goto_4
    add-int/lit8 v14, v14, 0x1

    .line 516
    .line 517
    move-object v5, v1

    .line 518
    move-object/from16 v1, v18

    .line 519
    .line 520
    const/4 v10, 0x1

    .line 521
    const/4 v12, 0x0

    .line 522
    goto/16 :goto_2

    .line 523
    .line 524
    :cond_16
    move-object/from16 v18, v1

    .line 525
    .line 526
    invoke-static {}, Ll/t4j;->f()Z

    .line 527
    .line 528
    .line 529
    move-result v1

    .line 530
    if-eqz v1, :cond_17

    .line 531
    .line 532
    if-eqz v15, :cond_17

    .line 533
    .line 534
    invoke-static {}, Ll/t4j;->d()Ll/t4j;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 539
    .line 540
    .line 541
    move-result-object v10

    .line 542
    invoke-virtual {v1, v10}, Ll/t4j;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 543
    .line 544
    .line 545
    :cond_17
    invoke-virtual {v9}, Landroidx/fragment/app/k;->j()I

    .line 546
    .line 547
    .line 548
    invoke-virtual {v8}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 549
    .line 550
    .line 551
    move-result v1

    .line 552
    const/4 v12, 0x1

    .line 553
    goto :goto_5

    .line 554
    :cond_18
    move-object/from16 v18, v1

    .line 555
    .line 556
    const/4 v1, 0x0

    .line 557
    const/4 v12, 0x0

    .line 558
    :goto_5
    if-eqz v1, :cond_3b

    .line 559
    .line 560
    if-eqz v2, :cond_19

    .line 561
    .line 562
    invoke-virtual {v0, v3, v12}, Lcom/p1/mobile/putong/core/newui/main/a;->Y9(Ljava/lang/String;Z)V

    .line 563
    .line 564
    .line 565
    :cond_19
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 566
    .line 567
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 568
    .line 569
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result v1

    .line 573
    iget-object v9, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 574
    .line 575
    if-eqz v1, :cond_1d

    .line 576
    .line 577
    check-cast v9, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 578
    .line 579
    const/4 v1, 0x1

    .line 580
    invoke-virtual {v9, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->u0(Z)V

    .line 581
    .line 582
    .line 583
    if-eqz v2, :cond_1b

    .line 584
    .line 585
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 586
    .line 587
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 588
    .line 589
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O6()Z

    .line 590
    .line 591
    .line 592
    move-result v1

    .line 593
    if-nez v1, :cond_1b

    .line 594
    .line 595
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 596
    .line 597
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 598
    .line 599
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 600
    .line 601
    .line 602
    move-result-object v1

    .line 603
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 604
    .line 605
    .line 606
    move-result v9

    .line 607
    if-eqz v9, :cond_1a

    .line 608
    .line 609
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isNewUserIn24H()Z

    .line 610
    .line 611
    .line 612
    move-result v1

    .line 613
    if-eqz v1, :cond_1a

    .line 614
    .line 615
    invoke-static {}, Ll/rbb0;->q()Z

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-eqz v1, :cond_1a

    .line 620
    .line 621
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 622
    .line 623
    iget-object v9, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 624
    .line 625
    const/4 v13, 0x1

    .line 626
    const-string v14, ""

    .line 627
    .line 628
    const/4 v10, 0x0

    .line 629
    const-wide/16 v11, 0x0

    .line 630
    .line 631
    invoke-virtual/range {v9 .. v14}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 632
    .line 633
    .line 634
    :cond_1a
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 635
    .line 636
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 637
    .line 638
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 639
    .line 640
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object v1

    .line 644
    check-cast v1, Ljava/lang/Long;

    .line 645
    .line 646
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 647
    .line 648
    .line 649
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 650
    .line 651
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 652
    .line 653
    sget-object v9, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->home_tab_msg:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 654
    .line 655
    invoke-virtual {v1, v9}, Lcom/p1/mobile/putong/core/api/CoreLikers;->g7(Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)Lrx/c;

    .line 656
    .line 657
    .line 658
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 659
    .line 660
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 661
    .line 662
    invoke-virtual {v1}, Ll/ela;->A3()Lrx/c;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->ba()V

    .line 666
    .line 667
    .line 668
    :cond_1b
    invoke-static {}, Ll/d09;->m()Z

    .line 669
    .line 670
    .line 671
    move-result v1

    .line 672
    if-nez v1, :cond_1c

    .line 673
    .line 674
    invoke-static {}, Ll/d09;->n()Z

    .line 675
    .line 676
    .line 677
    move-result v1

    .line 678
    if-eqz v1, :cond_1e

    .line 679
    .line 680
    :cond_1c
    invoke-static {}, Ll/of7;->o()Ll/of7;

    .line 681
    .line 682
    .line 683
    move-result-object v1

    .line 684
    invoke-virtual {v1}, Ll/of7;->z()V

    .line 685
    .line 686
    .line 687
    goto :goto_6

    .line 688
    :cond_1d
    check-cast v9, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 689
    .line 690
    const/4 v12, 0x0

    .line 691
    invoke-virtual {v9, v12}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->u0(Z)V

    .line 692
    .line 693
    .line 694
    :cond_1e
    :goto_6
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 695
    .line 696
    invoke-static {v1}, Ll/ji30;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 697
    .line 698
    .line 699
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 700
    .line 701
    sget-object v9, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 702
    .line 703
    invoke-virtual {v1, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 704
    .line 705
    .line 706
    move-result v1

    .line 707
    if-eqz v1, :cond_1f

    .line 708
    .line 709
    invoke-static {}, Ll/p110;->c()Ll/p110;

    .line 710
    .line 711
    .line 712
    move-result-object v1

    .line 713
    const-string v10, "active"

    .line 714
    .line 715
    invoke-virtual {v1, v10}, Ll/p110;->d(Ljava/lang/String;)V

    .line 716
    .line 717
    .line 718
    invoke-static {v9, v2}, Ll/ji30;->m(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 719
    .line 720
    .line 721
    :cond_1f
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 722
    .line 723
    sget-object v10, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 724
    .line 725
    invoke-virtual {v1, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    if-eqz v1, :cond_24

    .line 730
    .line 731
    if-eqz v2, :cond_20

    .line 732
    .line 733
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 734
    .line 735
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 736
    .line 737
    invoke-virtual {v1}, Ll/lqb;->k5()Lrx/c;

    .line 738
    .line 739
    .line 740
    :cond_20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 741
    .line 742
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 743
    .line 744
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->H4()Z

    .line 745
    .line 746
    .line 747
    move-result v1

    .line 748
    if-eqz v1, :cond_22

    .line 749
    .line 750
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 751
    .line 752
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 753
    .line 754
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 755
    .line 756
    .line 757
    move-result-object v1

    .line 758
    if-eqz v1, :cond_21

    .line 759
    .line 760
    sget-object v10, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 761
    .line 762
    iget-object v10, v10, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 763
    .line 764
    iget-object v10, v10, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Y:Ll/byd0;

    .line 765
    .line 766
    iget-wide v11, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 767
    .line 768
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 769
    .line 770
    .line 771
    move-result-object v1

    .line 772
    invoke-virtual {v10, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 773
    .line 774
    .line 775
    :cond_21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 776
    .line 777
    .line 778
    :cond_22
    invoke-static {}, Ll/gra;->M2()Z

    .line 779
    .line 780
    .line 781
    move-result v1

    .line 782
    if-eqz v1, :cond_23

    .line 783
    .line 784
    iget-object v1, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 785
    .line 786
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 787
    .line 788
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->P()V

    .line 789
    .line 790
    .line 791
    :cond_23
    if-eqz v2, :cond_24

    .line 792
    .line 793
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 794
    .line 795
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 796
    .line 797
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O6()Z

    .line 798
    .line 799
    .line 800
    move-result v1

    .line 801
    if-nez v1, :cond_24

    .line 802
    .line 803
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 804
    .line 805
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 806
    .line 807
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 808
    .line 809
    .line 810
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->ba()V

    .line 811
    .line 812
    .line 813
    :cond_24
    if-eqz v2, :cond_25

    .line 814
    .line 815
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 816
    .line 817
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->A0:Ll/gy6;

    .line 818
    .line 819
    invoke-virtual {v1}, Ll/gy6;->b3()Z

    .line 820
    .line 821
    .line 822
    move-result v1

    .line 823
    if-eqz v1, :cond_25

    .line 824
    .line 825
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 826
    .line 827
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->A0:Ll/gy6;

    .line 828
    .line 829
    invoke-virtual {v1}, Ll/gy6;->c3()Z

    .line 830
    .line 831
    .line 832
    move-result v1

    .line 833
    if-eqz v1, :cond_25

    .line 834
    .line 835
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 836
    .line 837
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->A0:Ll/gy6;

    .line 838
    .line 839
    invoke-virtual {v1}, Ll/gy6;->d3()V

    .line 840
    .line 841
    .line 842
    :cond_25
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 843
    .line 844
    sget-object v10, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 845
    .line 846
    invoke-virtual {v1, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 847
    .line 848
    .line 849
    move-result v1

    .line 850
    if-eqz v1, :cond_26

    .line 851
    .line 852
    invoke-static {}, Ll/bj30;->a()Z

    .line 853
    .line 854
    .line 855
    move-result v1

    .line 856
    if-eqz v1, :cond_26

    .line 857
    .line 858
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 859
    .line 860
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 861
    .line 862
    iget-object v1, v1, Ll/dkb;->X0:Ll/jxd0;

    .line 863
    .line 864
    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 865
    .line 866
    invoke-virtual {v1, v11}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 867
    .line 868
    .line 869
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 870
    .line 871
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 872
    .line 873
    invoke-virtual {v1}, Ll/dkb;->X7()Lrx/subjects/a;

    .line 874
    .line 875
    .line 876
    move-result-object v1

    .line 877
    invoke-virtual {v1, v11}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 878
    .line 879
    .line 880
    :cond_26
    invoke-static {}, Ll/ric0;->m()Z

    .line 881
    .line 882
    .line 883
    move-result v1

    .line 884
    if-eqz v1, :cond_27

    .line 885
    .line 886
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 887
    .line 888
    if-eq v7, v1, :cond_27

    .line 889
    .line 890
    invoke-virtual {v1, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 891
    .line 892
    .line 893
    move-result v1

    .line 894
    if-eqz v1, :cond_27

    .line 895
    .line 896
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 897
    .line 898
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 899
    .line 900
    invoke-virtual {v1}, Ll/dw6;->y3()Lrx/c;

    .line 901
    .line 902
    .line 903
    invoke-static {}, Ll/ric0;->i()Ll/ric0;

    .line 904
    .line 905
    .line 906
    move-result-object v1

    .line 907
    invoke-virtual {v1}, Ll/ric0;->o()V

    .line 908
    .line 909
    .line 910
    :cond_27
    iget-object v1, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 911
    .line 912
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 913
    .line 914
    iget-object v7, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 915
    .line 916
    invoke-virtual {v1, v7, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->E0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 917
    .line 918
    .line 919
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/main/a;->w:Z

    .line 920
    .line 921
    if-eqz v1, :cond_28

    .line 922
    .line 923
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 924
    .line 925
    .line 926
    move-result-object v1

    .line 927
    invoke-interface {v1, v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPhotoAlbumFrag(Landroidx/fragment/app/Fragment;)Z

    .line 928
    .line 929
    .line 930
    move-result v1

    .line 931
    if-eqz v1, :cond_28

    .line 932
    .line 933
    if-eqz v2, :cond_28

    .line 934
    .line 935
    const/4 v1, 0x1

    .line 936
    invoke-static {v10, v1}, Ll/ji30;->m(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 937
    .line 938
    .line 939
    :cond_28
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 940
    .line 941
    .line 942
    move-result-object v1

    .line 943
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 944
    .line 945
    .line 946
    move-result v5

    .line 947
    if-eqz v5, :cond_29

    .line 948
    .line 949
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 950
    .line 951
    .line 952
    move-result-object v5

    .line 953
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 954
    .line 955
    .line 956
    move-result v5

    .line 957
    if-eqz v5, :cond_29

    .line 958
    .line 959
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 960
    .line 961
    .line 962
    move-result-object v5

    .line 963
    invoke-virtual {v5, v6}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 964
    .line 965
    .line 966
    move-result-object v5

    .line 967
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 968
    .line 969
    .line 970
    move-result v7

    .line 971
    if-eqz v7, :cond_29

    .line 972
    .line 973
    iget-object v7, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 974
    .line 975
    invoke-static {v7, v5}, Ll/ji30;->l(Lcom/p1/mobile/putong/newui/main/base/TabName;Landroid/os/Bundle;)V

    .line 976
    .line 977
    .line 978
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 979
    .line 980
    .line 981
    move-result-object v5

    .line 982
    invoke-virtual {v5, v6}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 983
    .line 984
    .line 985
    :cond_29
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 986
    .line 987
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 988
    .line 989
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 990
    .line 991
    .line 992
    move-result v6

    .line 993
    if-eqz v6, :cond_2a

    .line 994
    .line 995
    if-eqz v2, :cond_2a

    .line 996
    .line 997
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 998
    .line 999
    .line 1000
    move-result-object v6

    .line 1001
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 1002
    .line 1003
    invoke-interface {v6, v7}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->isLiveSquareHome(Landroidx/fragment/app/Fragment;)Z

    .line 1004
    .line 1005
    .line 1006
    move-result v6

    .line 1007
    invoke-static {v5, v6}, Ll/ji30;->m(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 1008
    .line 1009
    .line 1010
    :cond_2a
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 1011
    .line 1012
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1013
    .line 1014
    invoke-virtual {v6}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v6

    .line 1018
    invoke-virtual {v8, v6}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v6

    .line 1022
    if-eq v5, v6, :cond_2c

    .line 1023
    .line 1024
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 1025
    .line 1026
    if-nez v5, :cond_2b

    .line 1027
    .line 1028
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1029
    .line 1030
    invoke-virtual {v9, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1031
    .line 1032
    .line 1033
    move-result v5

    .line 1034
    if-nez v5, :cond_2b

    .line 1035
    .line 1036
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1037
    .line 1038
    invoke-static {v5}, Ll/uqi;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 1039
    .line 1040
    .line 1041
    :cond_2b
    const/4 v5, 0x1

    .line 1042
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/newui/main/a;->U9(Z)V

    .line 1043
    .line 1044
    .line 1045
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1046
    .line 1047
    invoke-virtual {v6}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v6

    .line 1051
    invoke-virtual {v8, v6}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v6

    .line 1055
    check-cast v6, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 1056
    .line 1057
    iput-object v6, v0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 1058
    .line 1059
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/newui/main/a;->X9(Z)V

    .line 1060
    .line 1061
    .line 1062
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/main/a;->W9(Z)V

    .line 1063
    .line 1064
    .line 1065
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1066
    .line 1067
    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1068
    .line 1069
    .line 1070
    move-result v5

    .line 1071
    if-eqz v5, :cond_2c

    .line 1072
    .line 1073
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1074
    .line 1075
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 1076
    .line 1077
    invoke-virtual {v5}, Ll/cza;->x3()Lrx/subjects/a;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v5

    .line 1081
    sget-object v6, Ll/uxj0;->a:Ll/uxj0;

    .line 1082
    .line 1083
    invoke-static {v6}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v6

    .line 1087
    invoke-virtual {v5, v6}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 1088
    .line 1089
    .line 1090
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->s9()V

    .line 1091
    .line 1092
    .line 1093
    :cond_2c
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 1094
    .line 1095
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1096
    .line 1097
    invoke-virtual {v5, v6}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 1098
    .line 1099
    .line 1100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/a;->h9()V

    .line 1101
    .line 1102
    .line 1103
    invoke-virtual {v10}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1104
    .line 1105
    .line 1106
    move-result-object v5

    .line 1107
    invoke-virtual {v8, v5}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 1108
    .line 1109
    .line 1110
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1111
    .line 1112
    invoke-static {v5}, Ll/xq8;->a(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 1113
    .line 1114
    .line 1115
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1116
    .line 1117
    invoke-virtual {v5, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1118
    .line 1119
    .line 1120
    move-result v5

    .line 1121
    const-string v6, "cards"

    .line 1122
    .line 1123
    if-eqz v5, :cond_2d

    .line 1124
    .line 1125
    iget-object v5, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1126
    .line 1127
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1128
    .line 1129
    .line 1130
    move-result v5

    .line 1131
    if-eqz v5, :cond_2d

    .line 1132
    .line 1133
    invoke-static {}, Ll/s7a;->k()Z

    .line 1134
    .line 1135
    .line 1136
    move-result v5

    .line 1137
    if-eqz v5, :cond_2d

    .line 1138
    .line 1139
    invoke-static {}, Ll/joa;->C3()Z

    .line 1140
    .line 1141
    .line 1142
    move-result v5

    .line 1143
    if-eqz v5, :cond_2d

    .line 1144
    .line 1145
    invoke-static {}, Ll/vfi;->u()Ljava/lang/ref/WeakReference;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v5

    .line 1149
    invoke-virtual {v5}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v5

    .line 1153
    check-cast v5, Ll/vfi;

    .line 1154
    .line 1155
    invoke-virtual {v5}, Ll/vfi;->t()V

    .line 1156
    .line 1157
    .line 1158
    :cond_2d
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1159
    .line 1160
    invoke-virtual {v5, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1161
    .line 1162
    .line 1163
    move-result v5

    .line 1164
    if-eqz v5, :cond_35

    .line 1165
    .line 1166
    invoke-virtual {v9}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1167
    .line 1168
    .line 1169
    move-result-object v5

    .line 1170
    invoke-virtual {v8, v5}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v5

    .line 1174
    instance-of v7, v5, Ll/cvl;

    .line 1175
    .line 1176
    if-eqz v7, :cond_35

    .line 1177
    .line 1178
    check-cast v5, Ll/cvl;

    .line 1179
    .line 1180
    iget-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1181
    .line 1182
    invoke-static {v7, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1183
    .line 1184
    .line 1185
    move-result v6

    .line 1186
    const/4 v7, 0x0

    .line 1187
    if-eqz v6, :cond_2e

    .line 1188
    .line 1189
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 1190
    .line 1191
    invoke-interface {v5, v6, v7}, Ll/cvl;->C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 1192
    .line 1193
    .line 1194
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1195
    .line 1196
    goto/16 :goto_7

    .line 1197
    .line 1198
    :cond_2e
    iget-object v6, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1199
    .line 1200
    const-string v9, "moment_theme_card"

    .line 1201
    .line 1202
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1203
    .line 1204
    .line 1205
    move-result v6

    .line 1206
    if-eqz v6, :cond_30

    .line 1207
    .line 1208
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 1209
    .line 1210
    .line 1211
    move-result-object v6

    .line 1212
    iget-boolean v6, v6, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->enabled:Z

    .line 1213
    .line 1214
    if-nez v6, :cond_2f

    .line 1215
    .line 1216
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v6

    .line 1220
    invoke-virtual {v6}, Ll/nh00;->f()Z

    .line 1221
    .line 1222
    .line 1223
    move-result v6

    .line 1224
    if-eqz v6, :cond_35

    .line 1225
    .line 1226
    :cond_2f
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MOMENT_THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 1227
    .line 1228
    invoke-interface {v5, v6}, Ll/cvl;->f1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 1229
    .line 1230
    .line 1231
    invoke-interface {v5, v6, v7}, Ll/cvl;->C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 1232
    .line 1233
    .line 1234
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1235
    .line 1236
    goto/16 :goto_7

    .line 1237
    .line 1238
    :cond_30
    iget-object v6, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1239
    .line 1240
    const-string v9, "play_together"

    .line 1241
    .line 1242
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1243
    .line 1244
    .line 1245
    move-result v6

    .line 1246
    if-eqz v6, :cond_31

    .line 1247
    .line 1248
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PLAY_TOGETHER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 1249
    .line 1250
    invoke-interface {v5, v6}, Ll/cvl;->f1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 1251
    .line 1252
    .line 1253
    invoke-interface {v5, v6, v7}, Ll/cvl;->C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 1254
    .line 1255
    .line 1256
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1257
    .line 1258
    goto/16 :goto_7

    .line 1259
    .line 1260
    :cond_31
    iget-object v6, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1261
    .line 1262
    const-string v9, "boosting"

    .line 1263
    .line 1264
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1265
    .line 1266
    .line 1267
    move-result v6

    .line 1268
    if-eqz v6, :cond_32

    .line 1269
    .line 1270
    invoke-static {v1}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 1271
    .line 1272
    .line 1273
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1274
    .line 1275
    goto :goto_7

    .line 1276
    :cond_32
    iget-object v6, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1277
    .line 1278
    const-string v9, "supreme_sartner"

    .line 1279
    .line 1280
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1281
    .line 1282
    .line 1283
    move-result v6

    .line 1284
    if-eqz v6, :cond_33

    .line 1285
    .line 1286
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1287
    .line 1288
    goto :goto_7

    .line 1289
    :cond_33
    iget-object v6, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1290
    .line 1291
    const-string v9, "odiamond_private_custom"

    .line 1292
    .line 1293
    invoke-static {v6, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1294
    .line 1295
    .line 1296
    move-result v6

    .line 1297
    if-eqz v6, :cond_35

    .line 1298
    .line 1299
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1300
    .line 1301
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 1302
    .line 1303
    invoke-virtual {v6}, Ll/yna;->E3()Z

    .line 1304
    .line 1305
    .line 1306
    move-result v6

    .line 1307
    if-eqz v6, :cond_34

    .line 1308
    .line 1309
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PRIVATE_CUSTOM:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 1310
    .line 1311
    invoke-interface {v5, v6}, Ll/cvl;->f1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 1312
    .line 1313
    .line 1314
    invoke-interface {v5, v6, v7}, Ll/cvl;->C1(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;Ljava/lang/String;)V

    .line 1315
    .line 1316
    .line 1317
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1318
    .line 1319
    iget-object v6, v0, Ll/k930;->i:Ljava/util/HashMap;

    .line 1320
    .line 1321
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1322
    .line 1323
    .line 1324
    move-result v6

    .line 1325
    if-eqz v6, :cond_35

    .line 1326
    .line 1327
    iget-object v6, v0, Ll/k930;->i:Ljava/util/HashMap;

    .line 1328
    .line 1329
    invoke-virtual {v6}, Ljava/util/HashMap;->size()I

    .line 1330
    .line 1331
    .line 1332
    move-result v6

    .line 1333
    if-lez v6, :cond_35

    .line 1334
    .line 1335
    iget-object v6, v0, Ll/k930;->i:Ljava/util/HashMap;

    .line 1336
    .line 1337
    const-string v7, "navigation_to"

    .line 1338
    .line 1339
    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 1340
    .line 1341
    .line 1342
    move-result v6

    .line 1343
    if-eqz v6, :cond_35

    .line 1344
    .line 1345
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 1346
    .line 1347
    .line 1348
    move-result-object v6

    .line 1349
    invoke-virtual {v6}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 1350
    .line 1351
    .line 1352
    move-result-object v6

    .line 1353
    invoke-interface {v5}, Ll/cvl;->Y()Lcom/p1/mobile/android/app/Frag;

    .line 1354
    .line 1355
    .line 1356
    move-result-object v5

    .line 1357
    iget-object v9, v0, Ll/k930;->i:Ljava/util/HashMap;

    .line 1358
    .line 1359
    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1360
    .line 1361
    .line 1362
    move-result-object v9

    .line 1363
    check-cast v9, Ljava/lang/String;

    .line 1364
    .line 1365
    invoke-interface {v6, v5, v9}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->W6(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V

    .line 1366
    .line 1367
    .line 1368
    iget-object v5, v0, Ll/k930;->i:Ljava/util/HashMap;

    .line 1369
    .line 1370
    invoke-virtual {v5, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1371
    .line 1372
    .line 1373
    goto :goto_7

    .line 1374
    :cond_34
    iput-object v7, v0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 1375
    .line 1376
    :cond_35
    :goto_7
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1377
    .line 1378
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1379
    .line 1380
    invoke-virtual {v5}, Ll/dkb;->a8()Z

    .line 1381
    .line 1382
    .line 1383
    move-result v5

    .line 1384
    if-eqz v5, :cond_36

    .line 1385
    .line 1386
    invoke-static {}, Ll/x19;->w()Ll/x19;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v5

    .line 1390
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1391
    .line 1392
    invoke-virtual {v5, v6}, Ll/x19;->v(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 1393
    .line 1394
    .line 1395
    :cond_36
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1396
    .line 1397
    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1398
    .line 1399
    .line 1400
    move-result v5

    .line 1401
    if-nez v5, :cond_37

    .line 1402
    .line 1403
    iget-object v5, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1404
    .line 1405
    invoke-virtual {v5, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1406
    .line 1407
    .line 1408
    move-result v5

    .line 1409
    if-eqz v5, :cond_39

    .line 1410
    .line 1411
    :cond_37
    if-eqz v2, :cond_39

    .line 1412
    .line 1413
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1414
    .line 1415
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1416
    .line 1417
    invoke-virtual {v5}, Ll/dkb;->Z7()Z

    .line 1418
    .line 1419
    .line 1420
    move-result v5

    .line 1421
    if-eqz v5, :cond_39

    .line 1422
    .line 1423
    invoke-static {}, Ll/pzi0;->o()J

    .line 1424
    .line 1425
    .line 1426
    move-result-wide v5

    .line 1427
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1428
    .line 1429
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1430
    .line 1431
    invoke-virtual {v7}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 1432
    .line 1433
    .line 1434
    move-result-object v7

    .line 1435
    iget-wide v9, v7, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 1436
    .line 1437
    double-to-long v9, v9

    .line 1438
    const/4 v7, 0x5

    .line 1439
    invoke-static {v5, v6, v9, v10, v7}, Ll/tzi0;->h(JJI)Z

    .line 1440
    .line 1441
    .line 1442
    move-result v5

    .line 1443
    if-nez v5, :cond_39

    .line 1444
    .line 1445
    invoke-static {v1}, Ll/gv20;->k(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;

    .line 1446
    .line 1447
    .line 1448
    move-result-object v5

    .line 1449
    iget-object v6, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1450
    .line 1451
    invoke-virtual {v6, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1452
    .line 1453
    .line 1454
    move-result v6

    .line 1455
    if-eqz v6, :cond_38

    .line 1456
    .line 1457
    const-string v6, "message_list_page"

    .line 1458
    .line 1459
    goto :goto_8

    .line 1460
    :cond_38
    const-string v6, "explore_page"

    .line 1461
    .line 1462
    :goto_8
    invoke-static {v1, v5, v6}, Ll/gv20;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 1463
    .line 1464
    .line 1465
    :cond_39
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1466
    .line 1467
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1468
    .line 1469
    .line 1470
    move-result v1

    .line 1471
    if-eqz v1, :cond_3a

    .line 1472
    .line 1473
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 1474
    .line 1475
    .line 1476
    move-result-object v1

    .line 1477
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fs()Z

    .line 1478
    .line 1479
    .line 1480
    move-result v1

    .line 1481
    if-eqz v1, :cond_3a

    .line 1482
    .line 1483
    if-eqz v2, :cond_3a

    .line 1484
    .line 1485
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1486
    .line 1487
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->q1:Lcom/p1/mobile/putong/core/api/i;

    .line 1488
    .line 1489
    sget-object v1, Lcom/p1/mobile/putong/core/api/i;->S:Lrx/subjects/a;

    .line 1490
    .line 1491
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 1492
    .line 1493
    invoke-virtual {v1, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 1494
    .line 1495
    .line 1496
    :cond_3a
    invoke-static {}, Ll/gra;->i()Z

    .line 1497
    .line 1498
    .line 1499
    move-result v1

    .line 1500
    if-eqz v1, :cond_3b

    .line 1501
    .line 1502
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1503
    .line 1504
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 1505
    .line 1506
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->Ee()V

    .line 1507
    .line 1508
    .line 1509
    :cond_3b
    const/4 v1, 0x1

    .line 1510
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/newui/main/a;->w:Z

    .line 1511
    .line 1512
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 1513
    .line 1514
    .line 1515
    move-result-object v1

    .line 1516
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 1517
    .line 1518
    .line 1519
    move-result-object v3

    .line 1520
    invoke-virtual/range {v18 .. v18}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1521
    .line 1522
    .line 1523
    move-result-object v5

    .line 1524
    invoke-interface {v1, v3, v5, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Yb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 1525
    .line 1526
    .line 1527
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1528
    .line 1529
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 1530
    .line 1531
    invoke-virtual/range {v18 .. v18}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1532
    .line 1533
    .line 1534
    move-result-object v2

    .line 1535
    invoke-virtual {v1, v2}, Ll/h79;->h3(Ljava/lang/String;)V

    .line 1536
    .line 1537
    .line 1538
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 1539
    .line 1540
    .line 1541
    move-result-object v1

    .line 1542
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ke()Z

    .line 1543
    .line 1544
    .line 1545
    move-result v1

    .line 1546
    if-eqz v1, :cond_3c

    .line 1547
    .line 1548
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1549
    .line 1550
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1551
    .line 1552
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 1553
    .line 1554
    .line 1555
    move-result v1

    .line 1556
    if-eqz v1, :cond_3c

    .line 1557
    .line 1558
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 1559
    .line 1560
    .line 1561
    move-result-object v1

    .line 1562
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 1563
    .line 1564
    .line 1565
    move-result-object v3

    .line 1566
    const/4 v12, 0x0

    .line 1567
    invoke-interface {v1, v3, v2, v12}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->setTabDot(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 1568
    .line 1569
    .line 1570
    :cond_3c
    iget-object v1, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1571
    .line 1572
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 1573
    .line 1574
    .line 1575
    move-result-object v1

    .line 1576
    invoke-virtual {v8, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 1577
    .line 1578
    .line 1579
    move-result-object v1

    .line 1580
    check-cast v1, Lcom/p1/mobile/android/app/Frag;

    .line 1581
    .line 1582
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1583
    .line 1584
    const-string v2, "finish : "

    .line 1585
    .line 1586
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1587
    .line 1588
    .line 1589
    iget-object v0, v0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 1590
    .line 1591
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1592
    .line 1593
    .line 1594
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1595
    .line 1596
    .line 1597
    move-result-object v0

    .line 1598
    invoke-static {v4, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1599
    .line 1600
    .line 1601
    return-void
.end method

.method public final p7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/f4a;->H3()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/jg30;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/jg30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/lg30;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/lg30;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/f4a;->F3()Lrx/c;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic p8(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const-string p3, ""

    .line 16
    .line 17
    :cond_0
    const-string p2, "serverCode"

    .line 18
    .line 19
    invoke-virtual {p0, p2, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p2, Landroid/content/Intent;

    .line 28
    .line 29
    const-string p3, "android.intent.action.VIEW"

    .line 30
    .line 31
    invoke-direct {p2, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

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
.end method

.method public q6()Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public final q7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/w930;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/w930;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/y930;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/y930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/kl40;->f()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    new-instance v0, Ll/z930;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/z930;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic q8(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->b2:Ll/h79;

    .line 10
    .line 11
    iget-boolean v0, p1, Ll/h79;->S:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ll/h79;->d3(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->Z5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final q9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p2, "serverCode"

    .line 10
    .line 11
    invoke-virtual {p0, p2, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v4, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    const-string v1, ""

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    move-object v0, p1

    .line 29
    invoke-static/range {v0 .. v5}, Ll/xwa;->A(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public r6()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v1, v1, Ll/dkb;->R1:Lrx/subjects/a;

    .line 10
    .line 11
    new-instance v2, Ll/xh30;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/xh30;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/yh30;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/yh30;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/zh30;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/zh30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 36
    .line 37
    .line 38
    new-instance p0, Ll/v60;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/v60;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final r7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->enable:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/wc30;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/wc30;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v0, Ll/hd30;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/hd30;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic r8(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    sget v0, Ll/ji30;->f:I

    .line 2
    .line 3
    invoke-static {}, Ll/gra;->N3()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-int/2addr v0, v2

    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->K0(Ljava/lang/Integer;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->D0(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final r9(Landroidx/fragment/app/Fragment;Z)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->R4()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainContextFrag;->Q4()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    instance-of p0, p1, Lcom/p1/mobile/android/app/Frag;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    move-object p0, p1

    .line 21
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 22
    .line 23
    new-instance p2, Ll/wa30;

    .line 24
    .line 25
    invoke-direct {p2, p1}, Ll/wa30;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final s6(Ll/bkj0;)Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;>;)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/joa;->k4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/dbc0;->p:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    sget p0, Ll/dbc0;->o:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget p0, Ll/dbc0;->n:I

    .line 20
    .line 21
    :goto_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Lcom/google/common/base/Optional;

    .line 24
    .line 25
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Lcom/google/common/base/Optional;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_5

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/vg60;

    .line 47
    .line 48
    iget-object v1, v0, Ll/vg60;->a:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x0

    .line 55
    if-nez v1, :cond_3

    .line 56
    .line 57
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move v0, v2

    .line 65
    :goto_1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Ll/vg60;

    .line 70
    .line 71
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_4

    .line 78
    .line 79
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 80
    .line 81
    iget v2, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 82
    .line 83
    :cond_4
    add-int/2addr v0, v2

    .line 84
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_5
    :goto_2
    const/4 p1, -0x1

    .line 98
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public final s7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ln40;->f()Ll/ln40;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ln40;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {}, Ll/gra;->q3()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ll/ch30;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/ch30;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/dh30;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/dh30;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/eh30;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/eh30;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->m5()V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-static {}, Ll/gra;->r3()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->V1:Ll/p4a;

    .line 89
    .line 90
    const/16 v1, 0x32

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ll/p4a;->i3(I)Lrx/c;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->s:Lrx/subjects/a;

    .line 96
    .line 97
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance v0, Ll/fh30;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/fh30;-><init>()V

    .line 108
    .line 109
    .line 110
    new-instance v1, Ll/hh30;

    .line 111
    .line 112
    invoke-direct {v1}, Ll/hh30;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    :cond_2
    :goto_1
    return-void
.end method

.method public final synthetic s8(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->M()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final s9()V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->a2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->go()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    instance-of p1, p0, Lcom/p1/mobile/android/app/Frag;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/android/app/Frag;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final t7()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/u930;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/u930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/v930;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/v930;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic t8(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->h:Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/admob/NavigationBarAdView;->M()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final t9()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->C:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/exk;->j(Landroid/app/Activity;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->C:Ll/jxd0;

    .line 23
    .line 24
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final u6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, ""

    .line 29
    .line 30
    return-object p0
.end method

.method public final u7()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Sf()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u8(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->n0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final u9()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->resetAll()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->u:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public v6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->L(Lcom/p1/mobile/putong/newui/main/base/TabName;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final v7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/s7a;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 10
    .line 11
    const-string v1, "youthVip"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic v8(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    sget-object p1, Ll/bep;->INSTANCE:Ll/bep;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ll/bep;->l(Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v9()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of v0, p0, Ll/cvl;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    check-cast p0, Ll/cvl;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/cvl;->Y()Lcom/p1/mobile/android/app/Frag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->B:Ll/b240;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/b240;->M8()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public w6()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/android/app/Frag;

    .line 18
    .line 19
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    move-object v1, v0

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->c6()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    move-object v1, v0

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;->o()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    instance-of v1, v0, Ll/cvl;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    move-object v1, v0

    .line 70
    check-cast v1, Ll/cvl;

    .line 71
    .line 72
    invoke-interface {v1}, Ll/cvl;->o()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 80
    .line 81
    if-eqz v1, :cond_3

    .line 82
    .line 83
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_3

    .line 88
    .line 89
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->o()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    :goto_0
    return-void

    .line 98
    :cond_3
    iget-object v0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 101
    .line 102
    if-eq v0, v1, :cond_4

    .line 103
    .line 104
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->Z5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    const/4 v0, 0x1

    .line 111
    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final w7()V
    .locals 0

    .line 1
    new-instance p0, Ll/qd30;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/qd30;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic w8(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const v1, 0x61bba

    .line 6
    .line 7
    .line 8
    const v2, 0x61bb8

    .line 9
    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/v3l0;->e()Ll/v3l0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->data:Lcom/p1/mobile/putong/data/VerificationData;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VerificationData;->groupName:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Ll/v3l0;->h(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    if-ne v0, v2, :cond_1

    .line 28
    .line 29
    sget-object v0, Ll/bep;->INSTANCE:Ll/bep;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->data:Lcom/p1/mobile/putong/data/VerificationData;

    .line 36
    .line 37
    iget p1, p1, Lcom/p1/mobile/putong/data/VerificationData;->status:I

    .line 38
    .line 39
    invoke-virtual {v0, p0, p1}, Ll/bep;->o(Lcom/p1/mobile/android/app/Act;I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationNetworkData;->data:Lcom/p1/mobile/putong/data/VerificationData;

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/data/VerificationData;->status:I

    .line 46
    .line 47
    sget-object v0, Ll/bep;->INSTANCE:Ll/bep;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0, p1}, Ll/bep;->p(Lcom/p1/mobile/android/app/Act;I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public w9(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/main/a;->V9(Lcom/p1/mobile/putong/newui/main/base/TabName;ZZ)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->A9()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public x6()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->q0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic x8(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-le v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 17
    .line 18
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v2, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->v0(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 34
    .line 35
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->x0(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public x9(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->FEATURED:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->p0(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final y6()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->v()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/vd30;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/vd30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final y7()V
    .locals 2

    .line 1
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n46;->n()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/n46;->h()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/sc30;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/sc30;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {}, Ll/n46;->g()Ll/n46;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/n46;->m()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->S9()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/tc30;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/tc30;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    new-instance v0, Ll/uc30;

    .line 70
    .line 71
    invoke-direct {v0}, Ll/uc30;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance v0, Ll/vc30;

    .line 79
    .line 80
    invoke-direct {v0}, Ll/vc30;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method

.method public final synthetic y8(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a;->r:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y9()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->q0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z1()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/k930;->z1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->L7()V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/lqb;->k5()Lrx/c;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/jan;->P3()Lrx/c;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/spl0;->P()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j2:Ll/e3c0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/e3c0;->j3()Lrx/c;

    .line 42
    .line 43
    .line 44
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->A0:Ll/gy6;

    .line 47
    .line 48
    iget-object v0, v0, Ll/gy6;->R:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    const-wide/16 v2, 0x0

    .line 61
    .line 62
    cmp-long v0, v0, v2

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->A0:Ll/gy6;

    .line 69
    .line 70
    iget-object v0, v0, Ll/gy6;->R:Ll/byd0;

    .line 71
    .line 72
    invoke-static {}, Ll/pzi0;->o()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->N6()V

    .line 84
    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q2:[I

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    aput v1, v0, v1

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->Y5()V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/ta30;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/ta30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->N7()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final z6()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/dkb;->g5:Z

    .line 10
    .line 11
    return-void
.end method

.method public final z7()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ric0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/sb30;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/sb30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/tb30;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/tb30;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/ub30;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/ub30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/vb30;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/vb30;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/ric0;->i()Ll/ric0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Ll/ric0;->a:Ll/jxd0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    invoke-static {}, Ll/ric0;->i()Ll/ric0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Ll/ric0;->a:Ll/jxd0;

    .line 85
    .line 86
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v1, "https://auto.tancdn.com/v1/raw/0fdc8f64-5452-4968-85c0-79b096797fdc12.svga"

    .line 97
    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    const-string v1, "https://auto.tancdn.com/v1/raw/41db580d-31c8-4180-8063-c656e986409212.svga"

    .line 102
    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    const-string v1, "https://auto.tancdn.com/v1/raw/c8af9bff-3dbd-425d-9be3-058125b716eb13.svga"

    .line 107
    .line 108
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    const-string v1, "https://auto.tancdn.com/v1/raw/31429bf5-9bbd-42df-b607-5a5929f6256b12.svga"

    .line 112
    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->batchDownload(Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic z8(Lcom/p1/mobile/putong/core/data/IntlTribeBubble;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, v2, Ll/dkb;->N6:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    sub-long/2addr v0, v2

    .line 22
    const-wide/32 v2, 0x2932e00

    .line 23
    .line 24
    .line 25
    cmp-long v0, v0, v2

    .line 26
    .line 27
    if-lez v0, :cond_0

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget p1, p1, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->tribeCount:I

    .line 32
    .line 33
    if-lez p1, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 38
    .line 39
    new-instance v1, Ll/he30;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/he30;-><init>(Lcom/p1/mobile/putong/core/newui/main/a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->A0(ILcom/p1/mobile/android/ui/bubble/a$c;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public z9(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->s0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
