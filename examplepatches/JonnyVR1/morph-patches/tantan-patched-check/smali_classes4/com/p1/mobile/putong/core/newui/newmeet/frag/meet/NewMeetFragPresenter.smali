.class public Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nr30;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:I

.field public d:I

.field public final e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;

.field public g:Ll/dzl;

.field public h:Ll/fay;

.field public i:Ljava/lang/String;

.field public j:Ll/w30;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->b:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->d:I

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e:Ljava/util/ArrayList;

    .line 19
    .line 20
    new-instance v0, Ll/fay;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/fay;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h:Ll/fay;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic A0(Ll/vg60;Ljava/lang/Boolean;Ljava/util/List;Ll/pf60;Ljava/lang/Integer;Ll/vg60;Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p3, p4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1, p5}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic C0(Ljava/lang/String;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

    .line 20
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-object p0
.end method

.method public static synthetic D0(Ljava/lang/Boolean;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

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
    move-result-wide v2

    .line 23
    const/16 v4, 0x19

    .line 24
    .line 25
    const-string v5, ""

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Long;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    const-string v2, ""

    .line 49
    .line 50
    const/16 v3, 0x19

    .line 51
    .line 52
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j7(IJLjava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->Y0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

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

.method public static synthetic H0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static bridge synthetic I0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)Ll/dzl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    return-object p0
.end method

.method public static bridge synthetic J0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)Ll/w30;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    return-object p0
.end method

.method private R0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->v4()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_0

    .line 27
    .line 28
    move v3, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v3, v2

    .line 31
    :goto_0
    invoke-virtual {p0, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/api/s;->y4(Lcom/p1/mobile/putong/data/DbLinks;ZZZ)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 38
    .line 39
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/s;->x4(Lcom/p1/mobile/putong/data/DbLinks;ZZ)V

    .line 40
    .line 41
    .line 42
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->Z4()V

    .line 47
    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->dh()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    invoke-static {}, Ll/joa;->M3()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->y5()Lrx/c;

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method private synthetic S0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nr30;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nr30;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic W0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/s;->O5(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Ll/bkj0;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->X0(Ll/bkj0;)Ll/bkj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g1(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

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

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->U0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

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

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/joa;->y3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/xq30;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/xq30;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->a1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l0(Ll/vg60;)Ll/pf60;
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
    invoke-virtual {p0}, Ll/vg60;->d()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic m0(Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic n0()V
    .locals 7

    .line 1
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/cey;->o(Z)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->u4()J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->p4()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 44
    .line 45
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/s;->m5(JLjava/lang/String;J)Lrx/c;

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->m4()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic p0(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    iget-object p0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    :cond_0
    const/4 v0, 0x1

    .line 51
    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->V0(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->b1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->d1(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e1(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->W0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->S0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SVIP_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public L0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public N0(ZLjava/lang/String;)Lkotlin/Unit;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "e_meet_unlock"

    .line 4
    .line 5
    const-string v0, "p_meet"

    .line 6
    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public O0()Lcom/p1/mobile/android/app/Frag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public P0()Ll/dzl;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->me(Lcom/p1/mobile/android/app/Act;)Ll/dzl;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 24
    .line 25
    return-object p0
.end method

.method public Q0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic U0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_2

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/s;->n4()V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->b:Z

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/s;->Z4()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->b:Z

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->l1()V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->b:Z

    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final synthetic V0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->R0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X0(Ll/bkj0;)Ll/bkj0;
    .locals 4

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/bkj0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
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
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Ll/bkj0;

    .line 18
    .line 19
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ll/vg60;

    .line 22
    .line 23
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 32
    .line 33
    if-ltz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ll/bkj0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Ll/vg60;

    .line 42
    .line 43
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 50
    .line 51
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->d:I

    .line 52
    .line 53
    add-int v2, v1, p0

    .line 54
    .line 55
    if-le v0, v2, :cond_0

    .line 56
    .line 57
    new-instance v0, Ll/vg60;

    .line 58
    .line 59
    iget-object v2, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v2, Ll/bkj0;

    .line 62
    .line 63
    iget-object v2, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast v2, Ll/vg60;

    .line 66
    .line 67
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    add-int/2addr v1, p0

    .line 71
    invoke-interface {v2, v3, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v1, Ll/bkj0;

    .line 78
    .line 79
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v1, Ll/vg60;

    .line 82
    .line 83
    iget-object v1, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 84
    .line 85
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 89
    .line 90
    move-object v1, p0

    .line 91
    check-cast v1, Ll/bkj0;

    .line 92
    .line 93
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v1, Ljava/lang/Boolean;

    .line 96
    .line 97
    check-cast p0, Ll/bkj0;

    .line 98
    .line 99
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast p0, Ljava/util/List;

    .line 102
    .line 103
    invoke-static {v0, v1, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v0, Ll/pf60;

    .line 110
    .line 111
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast p1, Ll/vg60;

    .line 114
    .line 115
    invoke-static {p0, v0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_0
    return-object p1
.end method

.method public final synthetic Y0(Ll/bkj0;)V
    .locals 9

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/bkj0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
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
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ll/bkj0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ll/vg60;

    .line 24
    .line 25
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 32
    .line 33
    if-ge v0, v3, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ll/bkj0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Ll/vg60;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/vg60;->c()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    move v0, v1

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v0, v2

    .line 52
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->a:Z

    .line 53
    .line 54
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Ll/nr30;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/nr30;->i()V

    .line 59
    .line 60
    .line 61
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Ll/bkj0;

    .line 64
    .line 65
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Ll/vg60;

    .line 68
    .line 69
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_c

    .line 76
    .line 77
    new-instance v0, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v3, Ll/bkj0;

    .line 85
    .line 86
    iget-object v3, v3, Ll/bkj0;->b:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast v3, Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iget-object v4, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 95
    .line 96
    if-eqz v3, :cond_4

    .line 97
    .line 98
    check-cast v4, Ll/bkj0;

    .line 99
    .line 100
    iget-object v3, v4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v3, Ll/vg60;

    .line 103
    .line 104
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    move v4, v2

    .line 111
    move v5, v4

    .line 112
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    if-eqz v6, :cond_5

    .line 117
    .line 118
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    check-cast v6, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;

    .line 123
    .line 124
    iget-object v7, v6, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 125
    .line 126
    iget v7, v7, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 127
    .line 128
    if-nez v7, :cond_2

    .line 129
    .line 130
    add-int/lit8 v5, v5, 0x1

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_2
    if-nez v4, :cond_3

    .line 134
    .line 135
    const/16 v7, 0xa

    .line 136
    .line 137
    if-le v5, v7, :cond_3

    .line 138
    .line 139
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 140
    .line 141
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 142
    .line 143
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/api/s;->g4()Z

    .line 144
    .line 145
    .line 146
    move-result v7

    .line 147
    if-eqz v7, :cond_3

    .line 148
    .line 149
    new-instance v4, Lcom/p1/mobile/putong/core/businessdata/meet/MeetGuideToSwipeCardItemData;

    .line 150
    .line 151
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetGuideToSwipeCardItemData;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move v4, v1

    .line 158
    :cond_3
    :goto_2
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_4
    check-cast v4, Ll/bkj0;

    .line 163
    .line 164
    iget-object v3, v4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast v3, Ll/vg60;

    .line 167
    .line 168
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 169
    .line 170
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->d:I

    .line 175
    .line 176
    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    .line 177
    .line 178
    .line 179
    move-result v5

    .line 180
    sub-int v5, v4, v5

    .line 181
    .line 182
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 183
    .line 184
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    invoke-interface {v3, v2, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v6

    .line 192
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 193
    .line 194
    .line 195
    new-instance v6, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;

    .line 196
    .line 197
    new-instance v7, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-interface {v3, v5, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 204
    .line 205
    .line 206
    invoke-direct {v6, v7}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;-><init>(Ljava/util/List;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    :cond_5
    iget-object v3, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 213
    .line 214
    check-cast v3, Ll/pf60;

    .line 215
    .line 216
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 217
    .line 218
    check-cast v3, Ll/pf60;

    .line 219
    .line 220
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v3, Ljava/util/List;

    .line 223
    .line 224
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-nez v4, :cond_9

    .line 229
    .line 230
    iget-object v4, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 231
    .line 232
    check-cast v4, Ll/pf60;

    .line 233
    .line 234
    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 235
    .line 236
    check-cast v4, Ll/pf60;

    .line 237
    .line 238
    iget-object v4, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 239
    .line 240
    check-cast v4, Ljava/lang/Integer;

    .line 241
    .line 242
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 251
    .line 252
    .line 253
    move-result-object v5

    .line 254
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Yp()Z

    .line 255
    .line 256
    .line 257
    move-result v5

    .line 258
    if-eqz v5, :cond_8

    .line 259
    .line 260
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 261
    .line 262
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 263
    .line 264
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/s;->w4()Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v6

    .line 272
    if-eqz v6, :cond_7

    .line 273
    .line 274
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->userIds:Ljava/util/List;

    .line 275
    .line 276
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 277
    .line 278
    .line 279
    move-result v6

    .line 280
    if-nez v6, :cond_7

    .line 281
    .line 282
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->userIds:Ljava/util/List;

    .line 283
    .line 284
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v6

    .line 288
    check-cast v6, Ljava/lang/String;

    .line 289
    .line 290
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 291
    .line 292
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 293
    .line 294
    invoke-virtual {v7, v6}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 295
    .line 296
    .line 297
    move-result-object v7

    .line 298
    new-instance v8, Ll/tq30;

    .line 299
    .line 300
    invoke-direct {v8, v6, v7}, Ll/tq30;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 301
    .line 302
    .line 303
    const/4 v6, 0x4

    .line 304
    invoke-static {v3, v8, v6}, Ll/jyb;->v(Ljava/util/List;Ll/qcj;I)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v6

    .line 308
    check-cast v6, Lcom/p1/mobile/putong/data/User;

    .line 309
    .line 310
    if-nez v6, :cond_6

    .line 311
    .line 312
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v6

    .line 316
    if-eqz v6, :cond_8

    .line 317
    .line 318
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->reminderType:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminderType;

    .line 319
    .line 320
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    iput-object v5, v7, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 325
    .line 326
    invoke-interface {v3, v2, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 327
    .line 328
    .line 329
    goto :goto_3

    .line 330
    :cond_6
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->reminderType:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminderType;

    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    iput-object v5, v6, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 337
    .line 338
    goto :goto_3

    .line 339
    :cond_7
    new-instance v5, Ll/vq30;

    .line 340
    .line 341
    invoke-direct {v5}, Ll/vq30;-><init>()V

    .line 342
    .line 343
    .line 344
    invoke-static {v3, v5}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 345
    .line 346
    .line 347
    :cond_8
    :goto_3
    new-instance v5, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;

    .line 348
    .line 349
    iget-object v6, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 350
    .line 351
    check-cast v6, Ll/pf60;

    .line 352
    .line 353
    iget-object v6, v6, Ll/pf60;->b:Ljava/lang/Object;

    .line 354
    .line 355
    check-cast v6, Ljava/lang/Integer;

    .line 356
    .line 357
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    invoke-direct {v5, v4, v3, v6}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;-><init>(ILjava/util/List;I)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0, v2, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_9
    move v1, v2

    .line 369
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-virtual {v3}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 378
    .line 379
    .line 380
    move-result v3

    .line 381
    if-eqz v3, :cond_a

    .line 382
    .line 383
    new-instance v3, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;

    .line 384
    .line 385
    iget-object v4, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 386
    .line 387
    check-cast v4, Ll/vg60;

    .line 388
    .line 389
    iget-object v4, v4, Ll/vg60;->a:Ljava/util/List;

    .line 390
    .line 391
    invoke-direct {v3, v4}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;-><init>(Ljava/util/List;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {v0, v1, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 395
    .line 396
    .line 397
    :cond_a
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 398
    .line 399
    check-cast v1, Ll/nr30;

    .line 400
    .line 401
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->a:Z

    .line 402
    .line 403
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 404
    .line 405
    .line 406
    move-result-object v3

    .line 407
    invoke-virtual {v1, v3}, Ll/nr30;->u(Ljava/lang/Boolean;)V

    .line 408
    .line 409
    .line 410
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->dh()Z

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    if-eqz v1, :cond_b

    .line 423
    .line 424
    invoke-static {}, Ll/joa;->M3()Z

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    if-eqz v1, :cond_b

    .line 429
    .line 430
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h:Ll/fay;

    .line 431
    .line 432
    invoke-virtual {v1}, Ll/fay;->c()Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 433
    .line 434
    .line 435
    move-result-object v1

    .line 436
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 437
    .line 438
    .line 439
    move-result v1

    .line 440
    if-eqz v1, :cond_b

    .line 441
    .line 442
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h:Ll/fay;

    .line 443
    .line 444
    invoke-virtual {v1}, Ll/fay;->c()Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;->svipWeeklyItems:Ljava/util/List;

    .line 449
    .line 450
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 451
    .line 452
    .line 453
    move-result v1

    .line 454
    if-nez v1, :cond_b

    .line 455
    .line 456
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h:Ll/fay;

    .line 457
    .line 458
    invoke-virtual {v1}, Ll/fay;->c()Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 463
    .line 464
    .line 465
    :cond_b
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 466
    .line 467
    check-cast p0, Ll/nr30;

    .line 468
    .line 469
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 470
    .line 471
    check-cast p1, Ll/bkj0;

    .line 472
    .line 473
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 474
    .line 475
    check-cast p1, Ljava/util/List;

    .line 476
    .line 477
    invoke-virtual {p0, v0, p1}, Ll/nr30;->q(Ljava/util/List;Ljava/util/List;)V

    .line 478
    .line 479
    .line 480
    return-void

    .line 481
    :cond_c
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 482
    .line 483
    check-cast p0, Ll/nr30;

    .line 484
    .line 485
    invoke-virtual {p0}, Ll/nr30;->s()V

    .line 486
    .line 487
    .line 488
    return-void
.end method

.method public Z()V
    .locals 8

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "from"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/cey;->g()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->c:I

    .line 25
    .line 26
    invoke-static {}, Ll/cey;->h()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->d:I

    .line 31
    .line 32
    invoke-static {}, Ll/cey;->f()Ll/cey;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Ll/cey;->p(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->me(Lcom/p1/mobile/android/app/Act;)Ll/dzl;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 61
    .line 62
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Ljava/lang/Long;

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 89
    .line 90
    .line 91
    move-result-wide v2

    .line 92
    const-string v0, ""

    .line 93
    .line 94
    const/16 v4, 0x19

    .line 95
    .line 96
    invoke-virtual {p0, v4, v2, v3, v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->j7(IJLjava/lang/String;)Lrx/c;

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 103
    .line 104
    iget-object p0, v2, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Ljava/lang/Long;

    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 113
    .line 114
    .line 115
    move-result-wide v4

    .line 116
    const/16 v6, 0x19

    .line 117
    .line 118
    const-string v7, ""

    .line 119
    .line 120
    const/4 v3, 0x0

    .line 121
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 122
    .line 123
    .line 124
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_2

    .line 137
    .line 138
    invoke-static {}, Ll/zxv;->c()Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-eqz p0, :cond_2

    .line 143
    .line 144
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 147
    .line 148
    const/4 v0, 0x0

    .line 149
    const/16 v2, 0x14

    .line 150
    .line 151
    invoke-virtual {p0, v0, v2, v1}, Ll/f4a;->D3(Lcom/p1/mobile/putong/data/Links;IZ)Lrx/c;

    .line 152
    .line 153
    .line 154
    :cond_2
    return-void
.end method

.method public a0()V
    .locals 10

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/er30;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/er30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/lq30;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/lq30;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/mq30;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/mq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->K4()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 44
    .line 45
    const-string v9, "svip"

    .line 46
    .line 47
    invoke-static {v9}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Ll/nq30;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/nq30;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->s4()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v3, Ll/z86;

    .line 73
    .line 74
    invoke-direct {v3}, Ll/z86;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 84
    .line 85
    invoke-static {v9}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v0, v4}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v4, Ll/oq30;

    .line 94
    .line 95
    invoke-direct {v4}, Ll/oq30;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v4, Ll/pq30;

    .line 107
    .line 108
    invoke-direct {v4, p0}, Ll/pq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v4}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->w5()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/f4a;->K3()Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h:Ll/fay;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/fay;->e()Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    new-instance v8, Ll/qq30;

    .line 138
    .line 139
    invoke-direct {v8}, Ll/qq30;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-static/range {v1 .. v8}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/wcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    new-instance v1, Ll/rq30;

    .line 155
    .line 156
    invoke-direct {v1, p0}, Ll/rq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Ll/sq30;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Ll/sq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

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
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    new-instance v1, Ll/fr30;

    .line 180
    .line 181
    invoke-direct {v1, p0}, Ll/fr30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 182
    .line 183
    .line 184
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    new-instance v1, Ll/gr30;

    .line 208
    .line 209
    invoke-direct {v1}, Ll/gr30;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    new-instance v1, Ll/hr30;

    .line 217
    .line 218
    invoke-direct {v1}, Ll/hr30;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    new-instance v1, Ll/ir30;

    .line 226
    .line 227
    invoke-direct {v1, p0}, Ll/ir30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 228
    .line 229
    .line 230
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 235
    .line 236
    .line 237
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 238
    .line 239
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 240
    .line 241
    invoke-static {v9}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    new-instance v1, Ll/jr30;

    .line 250
    .line 251
    invoke-direct {v1}, Ll/jr30;-><init>()V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    const/4 v0, 0x1

    .line 267
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    new-instance v0, Ll/kq30;

    .line 276
    .line 277
    invoke-direct {v0}, Ll/kq30;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 285
    .line 286
    .line 287
    return-void
.end method

.method public final synthetic a1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 2
    .line 3
    const/4 v3, 0x1

    .line 4
    const/4 v4, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    move-object v1, p1

    .line 7
    move-object v5, p2

    .line 8
    invoke-interface/range {v0 .. v5}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b1(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 8

    .line 1
    const/4 p3, 0x0

    .line 2
    const-string p4, "other_user_id"

    .line 3
    .line 4
    const-string v0, "p_meet"

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez p5, :cond_0

    .line 8
    .line 9
    iget-object p5, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p5, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p4, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    filled-new-array {p4}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    const-string p5, "e_meet_card_more_dislike"

    .line 22
    .line 23
    invoke-static {p5, v0, p4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 27
    .line 28
    invoke-interface {p4, p1, v1, v1, p3}, Ll/dzl;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v7, 0x0

    .line 45
    const/4 v5, 0x0

    .line 46
    move-object v4, p2

    .line 47
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    move-object v4, p2

    .line 57
    iget-object p2, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p4, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    filled-new-array {p2}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    const-string p4, "e_meet_card_more_report"

    .line 70
    .line 71
    invoke-static {p4, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p4

    .line 86
    iget-object p5, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    iget-object p5, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 89
    .line 90
    new-instance v0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;

    .line 91
    .line 92
    invoke-direct {v0, p0, p3, p1, v4}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter$1;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/os/Handler;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {p2, p4, p5, v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->O9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic d1(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p2, p3, :cond_1

    .line 12
    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-ne p2, p3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v4, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    move v4, v0

    .line 25
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-ne p2, p3, :cond_2

    .line 32
    .line 33
    move v5, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v5, v1

    .line 36
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 55
    .line 56
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/s;->L4()Ll/vg60;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 61
    .line 62
    new-instance v0, Ll/yq30;

    .line 63
    .line 64
    invoke-direct {v0, p2}, Ll/yq30;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p3, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    move-object v3, p2

    .line 72
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 73
    .line 74
    if-eqz v3, :cond_5

    .line 75
    .line 76
    if-eqz v5, :cond_3

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->gl()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L8()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_3

    .line 131
    .line 132
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_3

    .line 137
    .line 138
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_3

    .line 143
    .line 144
    :goto_3
    move-object v7, p3

    .line 145
    goto :goto_4

    .line 146
    :cond_3
    const/4 p3, 0x0

    .line 147
    goto :goto_3

    .line 148
    :goto_4
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_4

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    const-string p2, "e_iliked_letter"

    .line 163
    .line 164
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 168
    .line 169
    const/4 v6, 0x0

    .line 170
    invoke-interface/range {v2 .. v7}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    :cond_5
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final synthetic e1(Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V
    .locals 8

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p2, p3, :cond_1

    .line 12
    .line 13
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-ne p2, p3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v4, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    move v4, v0

    .line 25
    :goto_1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-ne p2, p3, :cond_2

    .line 32
    .line 33
    move v5, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move v5, v1

    .line 36
    :goto_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    if-eqz v5, :cond_3

    .line 51
    .line 52
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 53
    .line 54
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->gl()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->L8()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_3

    .line 99
    .line 100
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_3

    .line 105
    .line 106
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_3

    .line 111
    .line 112
    :goto_3
    move-object v7, v0

    .line 113
    goto :goto_4

    .line 114
    :cond_3
    const/4 v0, 0x0

    .line 115
    goto :goto_3

    .line 116
    :goto_4
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_4

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p3, "e_iliked_letter"

    .line 131
    .line 132
    invoke-static {p3, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_5

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    const-string p3, "localLikersUser"

    .line 154
    .line 155
    invoke-static {p3}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    iput-object p3, p2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 160
    .line 161
    new-instance v3, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 162
    .line 163
    invoke-direct {v3, p1, p2}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V

    .line 164
    .line 165
    .line 166
    const/4 v6, 0x0

    .line 167
    move-object v2, p0

    .line 168
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->Q0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    :cond_5
    return-void
.end method

.method public f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V
    .locals 6

    .line 1
    if-eqz p4, :cond_4

    .line 2
    .line 3
    new-instance p2, Ll/br30;

    .line 4
    .line 5
    invoke-direct {p2, p0, p1}, Ll/br30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 6
    .line 7
    .line 8
    iget-object p3, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 9
    .line 10
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 13
    .line 14
    const-string p4, "superliked"

    .line 15
    .line 16
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-eqz p3, :cond_3

    .line 21
    .line 22
    invoke-static {}, Ll/joa;->f4()Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/joa;->E3()Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-nez p3, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    const/4 p3, 0x0

    .line 49
    const-string p4, "p_meet_view,e_meet_feed_button,click"

    .line 50
    .line 51
    invoke-interface {p1, p0, p4, p2, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    invoke-static {}, Ll/joa;->E3()Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    const/4 p4, 0x1

    .line 60
    if-eqz p3, :cond_1

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-interface {p3, p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    invoke-virtual {p3}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->S9()Z

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    if-nez p3, :cond_2

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p2, "p_navigation_ilike,card_button_pull"

    .line 107
    .line 108
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ot(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    invoke-virtual {p3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    invoke-interface {p3, p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 127
    .line 128
    .line 129
    :cond_3
    return-void

    .line 130
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->g:Ll/dzl;

    .line 131
    .line 132
    const/4 v4, 0x0

    .line 133
    const/4 v5, 0x0

    .line 134
    move-object v1, p1

    .line 135
    move v2, p2

    .line 136
    move v3, p3

    .line 137
    invoke-interface/range {v0 .. v5}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final g1(Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->N6()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/wq30;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/wq30;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->V6()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Z)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "other_user_id"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_meet_card_more"

    .line 16
    .line 17
    const-string v2, "p_meet"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/w30;->b()V

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    const-string p2, "\u4e0d\u518d\u559c\u6b22/\u5173\u6ce8"

    .line 61
    .line 62
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const-string p2, "\u4e0d\u559c\u6b22"

    .line 67
    .line 68
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :goto_0
    const-string p2, "\u4e3e\u62a5"

    .line 72
    .line 73
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    new-instance p2, Ll/w30$b;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-direct {p2, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    const-string v2, "\u53d6\u6d88"

    .line 86
    .line 87
    invoke-virtual {p2, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    new-instance v2, Ll/zq30;

    .line 92
    .line 93
    invoke-direct {v2, p0}, Ll/zq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p2, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    const/4 v1, 0x1

    .line 105
    invoke-virtual {p2, v1}, Ll/w30$b;->G(Z)Ll/w30$b;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    new-instance v2, Ll/ar30;

    .line 110
    .line 111
    invoke-direct {v2, p0, p1, v0}, Ll/ar30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/data/User;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const/4 p2, 0x0

    .line 119
    filled-new-array {p2, v1}, [I

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    sget v0, Ll/f9c0;->f:I

    .line 124
    .line 125
    sget v1, Ll/f9c0;->g:I

    .line 126
    .line 127
    filled-new-array {v0, v1}, [I

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p1, p2, v0}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 140
    .line 141
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j:Ll/w30;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public i1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, v0, p2, p3, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->j1(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final j1(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 7

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    const-string v0, "p_meet_view,e_picks_feed_card,like_swipe"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "p_meet_view,e_whoiliked_card,sayhi_superlike"

    .line 7
    .line 8
    :goto_0
    if-eqz p4, :cond_3

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/d7d0;->c()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    invoke-static {}, Ll/joa;->M3()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->H3()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_5

    .line 45
    .line 46
    invoke-static {}, Ll/ela;->r3()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-gtz v1, :cond_5

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ll/d7d0;->e()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_5

    .line 93
    .line 94
    invoke-static {}, Ll/joa;->H3()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_5

    .line 99
    .line 100
    invoke-static {}, Ll/ela;->r3()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-gtz v1, :cond_5

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    invoke-static {}, Ll/joa;->f4()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_5

    .line 127
    .line 128
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 131
    .line 132
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_4

    .line 141
    .line 142
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v1}, Ll/d7d0;->c()Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_4

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 165
    .line 166
    invoke-interface {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 171
    .line 172
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_5

    .line 183
    .line 184
    invoke-static {}, Ll/d7d0;->d()Ll/d7d0;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v1}, Ll/d7d0;->e()Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_5

    .line 193
    .line 194
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 207
    .line 208
    invoke-interface {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_6

    .line 221
    .line 222
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_6

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 245
    .line 246
    move-object v5, p2

    .line 247
    move-object v4, p3

    .line 248
    move v6, p4

    .line 249
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Za(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 250
    .line 251
    .line 252
    :cond_6
    return-void
.end method

.method public k1(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eq p2, p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eq p2, p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-ne p2, p1, :cond_5

    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/jq30;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/jq30;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/uq30;

    .line 44
    .line 45
    invoke-direct {v0, p0, p3, p2}, Ll/uq30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/content/Intent;I)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return v1

    .line 56
    :cond_1
    const/16 v0, 0x12

    .line 57
    .line 58
    if-ne p1, v0, :cond_3

    .line 59
    .line 60
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    const-string p0, "see_count"

    .line 67
    .line 68
    invoke-virtual {p3, p0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_2

    .line 73
    .line 74
    invoke-static {}, Ll/cey;->n()V

    .line 75
    .line 76
    .line 77
    :cond_2
    return v1

    .line 78
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->re()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-ne p1, v0, :cond_5

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eq p2, p1, :cond_4

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eq p2, p1, :cond_4

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-ne p2, p1, :cond_5

    .line 115
    .line 116
    :cond_4
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v0, Ll/cr30;

    .line 121
    .line 122
    invoke-direct {v0}, Ll/cr30;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    new-instance v0, Ll/dr30;

    .line 130
    .line 131
    invoke-direct {v0, p0, p3, p2}, Ll/dr30;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/content/Intent;I)V

    .line 132
    .line 133
    .line 134
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 139
    .line 140
    .line 141
    return v1

    .line 142
    :cond_5
    const/4 p0, 0x0

    .line 143
    return p0
.end method

.method public l1()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->R0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "from_notes"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Gq(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public m1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 21
    .line 22
    invoke-virtual {p0, v1, v2, v0, v2}, Lcom/p1/mobile/putong/core/api/s;->y4(Lcom/p1/mobile/putong/data/DbLinks;ZZZ)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/core/api/s;->x4(Lcom/p1/mobile/putong/data/DbLinks;ZZ)V

    .line 31
    .line 32
    .line 33
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->Z4()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->dh()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-static {}, Ll/joa;->M3()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->y5()Lrx/c;

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public n1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/s;->R4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "meet"

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-interface {p1, p0, p2, v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public o1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/s;->R4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v4, "meet"

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    move-object v5, p1

    .line 24
    move-object v3, p2

    .line 25
    invoke-interface/range {v1 .. v6}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public p1()V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->a:Z

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/s;->e4(Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->d4()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
