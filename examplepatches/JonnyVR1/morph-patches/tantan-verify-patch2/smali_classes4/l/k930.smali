.class public abstract Ll/k930;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/k930$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# static fields
.field public static p:Z

.field public static q:Z


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/jxd0;

.field public e:J

.field public f:Z

.field public g:Z

.field public h:Lcom/p1/mobile/putong/data/NavigationIntent;

.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:I

.field public k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

.field public l:Lcom/p1/mobile/putong/core/newui/main/a$v;

.field public m:Z

.field public n:Z

.field public o:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M7()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 18
    .line 19
    :goto_0
    iput-object p1, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 20
    .line 21
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 22
    .line 23
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/k930;->c:Lrx/subjects/a;

    .line 28
    .line 29
    new-instance p1, Ll/jxd0;

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "settingLocationShown"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Ll/k930;->d:Ll/jxd0;

    .line 59
    .line 60
    const-wide v0, -0x147ae147ae147aeL

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    iput-wide v0, p0, Ll/k930;->e:J

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    iput-boolean p1, p0, Ll/k930;->f:Z

    .line 69
    .line 70
    iput-boolean p1, p0, Ll/k930;->g:Z

    .line 71
    .line 72
    iput-boolean p1, p0, Ll/k930;->m:Z

    .line 73
    .line 74
    iput-boolean p1, p0, Ll/k930;->n:Z

    .line 75
    .line 76
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Ll/k930;->o:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/k930;->h1()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic A0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/data/MomentFeedPushArgs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic D0(Ll/k930;Lcom/p1/mobile/putong/data/MomentFeedPushArgs;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->v1(Lcom/p1/mobile/putong/data/MomentFeedPushArgs;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

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

.method public static synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G0(Ll/k930;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->p1(Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V

    return-void
.end method

.method public static synthetic H0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->O2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/wkh0;->d()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic I0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/c;->J2:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/c;->J2:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic L0(Ll/k930;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->u1(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic N0(Lrx/Notification;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic O0()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->opened:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {v2}, Ll/fph0;->J(Z)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {v3}, Ll/fph0;->J(Z)V

    .line 16
    .line 17
    .line 18
    :goto_0
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    .line 19
    .line 20
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 21
    .line 22
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {v2}, Ll/fph0;->H(Z)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    invoke-static {v3}, Ll/fph0;->H(Z)V

    .line 37
    .line 38
    .line 39
    :goto_1
    const-string v0, "android.permission.READ_CONTACTS"

    .line 40
    .line 41
    filled-new-array {v0}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-static {v2}, Ll/fph0;->a(Z)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    invoke-static {v3}, Ll/fph0;->a(Z)V

    .line 56
    .line 57
    .line 58
    :goto_2
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 59
    .line 60
    filled-new-array {v0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-static {v2}, Ll/fph0;->b(Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_3
    invoke-static {v3}, Ll/fph0;->b(Z)V

    .line 75
    .line 76
    .line 77
    :goto_3
    invoke-static {}, Ll/fph0;->O()V

    .line 78
    .line 79
    .line 80
    return v3
.end method

.method public static synthetic P0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q0(Ll/k930;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->x1(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S0(Ll/k930;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->l1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic U0(Ll/k930;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k930;->o1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic V0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic W0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "refresh merchandise error :"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[core][merchandise]"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic X0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/v;->a0:Lrx/subjects/b;

    .line 2
    .line 3
    const-string v1, "match_success"

    .line 4
    .line 5
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic f0(Ll/k930;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k930;->m1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Ll/k930;Lcom/p1/mobile/putong/data/OMSDialogInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->s1(Lcom/p1/mobile/putong/data/OMSDialogInfo;)V

    return-void
.end method

.method public static synthetic h0(Ll/k930;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->n1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j0(Ll/k930;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->t1(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    sget-object p0, Ll/wtd;->a:Ll/wyd0;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/wtd;->b:Ll/jxd0;

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic l0(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lu8;->m4()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic m0(Ll/uxj0;)Lrx/c;
    .locals 3

    .line 1
    sget-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x5

    .line 8
    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 v0, 0x6

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lrx/c;->buffer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private synthetic m1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    sget-boolean p1, Lcom/p1/mobile/android/app/Act;->isFromBackground:Z

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 14
    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/k930;->b1()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 22
    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ll/tx0;->K(Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public static synthetic n0(Ll/k930;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k930;->r1()V

    return-void
.end method

.method public static synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p0(Ll/k930;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k930;->k1()V

    return-void
.end method

.method public static synthetic q0(Ll/k930;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k930;->j1()V

    return-void
.end method

.method public static synthetic r0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->z0:Lrx/subjects/a;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/Boolean;
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->z()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/32 v4, 0x2932e00

    .line 10
    .line 11
    .line 12
    sub-long/2addr v2, v4

    .line 13
    cmp-long p0, v0, v2

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x0(Ll/k930;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k930;->q1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y0(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

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
    new-instance v0, Ll/b930;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/b930;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic z0(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W8()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Ye()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public B1(I)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->t()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-wide/16 v1, 0xa

    .line 13
    .line 14
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/v730;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/v730;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    const/16 v0, 0x21

    .line 53
    .line 54
    if-ne p1, v0, :cond_0

    .line 55
    .line 56
    iget-object p0, p0, Ll/k930;->c:Lrx/subjects/a;

    .line 57
    .line 58
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public C(Ll/iam;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method

.method public final C1(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->V1()Z

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
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/e;->H6(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/ui7;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/ui7;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/z830;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/z830;-><init>(Ll/k930;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/a930;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/a930;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public D1()V
    .locals 19

    move-object/from16 v0, p0

    .line 1
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-wide/16 v2, -0x1

    const-string v4, "extra_heartbeat_expire_time"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v3, v1, v5

    const-wide/16 v7, 0x3e8

    if-lez v3, :cond_0

    .line 2
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v9

    cmp-long v1, v9, v1

    if-lez v1, :cond_0

    .line 3
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    new-instance v2, Ll/k930$a;

    invoke-direct {v2, v0}, Ll/k930$a;-><init>(Ll/k930;)V

    .line 4
    invoke-static {v1, v2, v7, v8}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 5
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 6
    :cond_0
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v2, "menu"

    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const-string v2, "from"

    const-class v3, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;

    const/4 v4, 0x1

    const/4 v9, 0x0

    if-eqz v1, :cond_1

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    goto/16 :goto_2

    .line 8
    :cond_1
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "moment"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, v1, Ll/dkb;->A0:Lrx/subjects/a;

    new-instance v5, Ll/e930;

    invoke-direct {v5}, Ll/e930;-><init>()V

    .line 11
    invoke-virtual {v1, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    move-result-object v1

    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    move-result-object v5

    invoke-virtual {v1, v5}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v1

    new-instance v5, Ll/a830;

    invoke-direct {v5, v0}, Ll/a830;-><init>(Ll/k930;)V

    .line 15
    invoke-static {v5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v5

    .line 16
    invoke-virtual {v1, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_2

    .line 17
    :cond_2
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "setting"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 19
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    const-class v6, Lcom/p1/mobile/putong/core/newui/container/NewUI1ContainerActivity;

    invoke-direct {v1, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    const-class v5, Lcom/p1/mobile/putong/core/ui/settings/SettingsFragOld;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "fragmentName"

    invoke-virtual {v1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    const-string v5, "setting_scroll_to_bottom"

    iget-boolean v6, v0, Ll/k930;->m:Z

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 22
    iget-object v5, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 23
    :cond_3
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "profile"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    goto/16 :goto_2

    .line 25
    :cond_4
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "live"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const/4 v10, 0x0

    if-eqz v1, :cond_7

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 27
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "main_jump_live_tag"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 28
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "main_jump_live_has_params"

    invoke-virtual {v6, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_32

    if-nez v1, :cond_5

    .line 29
    new-instance v1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;

    const-string v6, "samsung_intent_params_saved"

    invoke-direct {v1, v6, v10}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)V

    .line 30
    invoke-virtual {v1}, Ll/dyd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 31
    new-instance v8, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    invoke-direct {v8}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;-><init>()V

    invoke-virtual {v1, v8}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    move-object v1, v6

    .line 32
    :cond_5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    iget-object v6, v1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->liveId:Ljava/lang/String;

    invoke-static {v6}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 33
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v6

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v8

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v10

    invoke-interface {v8, v10, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Xh(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    :cond_6
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 35
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 36
    :cond_7
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "profile_edit"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 38
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    .line 39
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    invoke-virtual {v6}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v6

    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v7, "profile_frag_menu"

    .line 41
    invoke-static {v5, v6, v7, v9, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v5

    .line 42
    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 43
    :cond_8
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "profile_edit_continuous"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 45
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    .line 46
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    invoke-virtual {v6}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v6

    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    const-string v7, "from_profile_frag_edit"

    .line 48
    invoke-static {v5, v6, v7, v9, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    move-result-object v5

    .line 49
    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 50
    :cond_9
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "cards"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 51
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 52
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_32

    .line 53
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    const-string v5, "cardType"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    const-string v5, "main"

    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    goto/16 :goto_2

    .line 54
    :cond_a
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "webview"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const-string v11, "hideNavigationBar"

    if-eqz v1, :cond_b

    .line 55
    iget-object v12, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 56
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "webview_title"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 57
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "webview_url"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 58
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v11, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v15

    .line 59
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "hardwareAccelerated"

    invoke-virtual {v1, v5, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v16

    .line 60
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "useMkWebview"

    invoke-virtual {v1, v5, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v17

    .line 61
    invoke-static/range {v12 .. v17}, Ll/xwa;->A(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    move-result-object v1

    .line 62
    invoke-virtual {v12, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 63
    :cond_b
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "seeLikes"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 65
    iput-boolean v4, v0, Ll/k930;->n:Z

    .line 66
    iget-object v1, v0, Ll/k930;->o:Lrx/subjects/a;

    sget-object v5, Ll/uxj0;->a:Ll/uxj0;

    invoke-virtual {v1, v5}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 67
    :cond_c
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "seeSidePush"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 68
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    const-string v5, "push_call2buysee"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 69
    :cond_d
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "seeSideMsg"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 70
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    const-string v5, "msg_call2buysee"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 71
    :cond_e
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "seeSideNewPush"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 72
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    const-string v5, "push_call2buysee_side_new"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 73
    :cond_f
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "seeSideNewMsg"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 74
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    const-string v5, "msg_call2buysee_side_new"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 75
    :cond_10
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "liveAnchor"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v1

    iget-object v5, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    const-string v6, "p_core_push"

    invoke-interface {v1, v5, v4, v4, v6}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->F8(Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;)V

    goto/16 :goto_2

    .line 77
    :cond_11
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v12, "startVoiceLive"

    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const-string v12, ""

    if-eqz v1, :cond_12

    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    move-result-object v1

    iget-object v5, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    invoke-interface {v1, v5, v12}, Ll/ftn0;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 79
    :cond_12
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v13, "quickchat"

    invoke-static {v1, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 80
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 81
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/g;->go()V

    .line 82
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    new-instance v5, Ll/b830;

    invoke-direct {v5}, Ll/b830;-><init>()V

    invoke-static {v1, v5}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    goto/16 :goto_2

    .line 83
    :cond_13
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v13, "greetChat"

    invoke-static {v1, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 84
    invoke-static {}, Ll/d79;->U()Z

    move-result v1

    if-nez v1, :cond_14

    goto/16 :goto_5

    .line 85
    :cond_14
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 86
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "greetingId"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 87
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    invoke-virtual {v5, v1}, Lcom/p1/mobile/putong/core/api/j;->o5(Ljava/lang/String;)Lrx/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v1

    .line 88
    invoke-virtual {v1, v4}, Lrx/c;->take(I)Lrx/c;

    move-result-object v1

    new-instance v5, Ll/c830;

    invoke-direct {v5, v0}, Ll/c830;-><init>(Ll/k930;)V

    new-instance v6, Ll/d830;

    invoke-direct {v6}, Ll/d830;-><init>()V

    .line 89
    invoke-static {v5, v6}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v5

    .line 90
    invoke-virtual {v1, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_2

    .line 91
    :cond_15
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v13, "quickChatMatch"

    invoke-static {v1, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 92
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 93
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "otherUser"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 94
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 95
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v6, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v5

    iput-object v5, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 96
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    new-instance v6, Ll/e830;

    invoke-direct {v6, v1}, Ll/e830;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    const-wide/16 v7, 0x320

    .line 97
    invoke-static {v5, v6, v7, v8}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    goto/16 :goto_2

    .line 98
    :cond_16
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v13, "freeTrialPromotion"

    invoke-static {v1, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 100
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 101
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    move-result-object v5

    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/FreeTrialData;->titleText:Ljava/lang/String;

    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 102
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    move-result-object v6

    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionUrl:Ljava/lang/String;

    .line 103
    invoke-static {v1, v5, v6, v4}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    .line 104
    invoke-virtual {v1, v11, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 105
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 106
    :cond_17
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;->NONE:Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;

    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/CoreProduct;->H4()Lcom/p1/mobile/putong/core/api/CoreProduct$PromotionStatus;

    move-result-object v5

    if-ne v1, v5, :cond_18

    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    move-result v1

    if-nez v1, :cond_32

    .line 108
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    sget v5, Lcom/p1/mobile/putong/core/R$string;->L5:I

    invoke-virtual {v1, v5}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 109
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->G4()Lrx/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v1

    new-instance v5, Ll/f830;

    invoke-direct {v5, v0}, Ll/f830;-><init>(Ll/k930;)V

    new-instance v6, Ll/h830;

    invoke-direct {v6, v0}, Ll/h830;-><init>(Ll/k930;)V

    .line 110
    invoke-static {v5, v6}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v5

    .line 111
    invoke-virtual {v1, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    goto/16 :goto_2

    .line 112
    :cond_18
    sget v1, Lcom/p1/mobile/putong/core/R$string;->O5:I

    invoke-static {v1}, Ll/o1j0;->h(I)V

    goto/16 :goto_2

    .line 113
    :cond_19
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "introPromotion"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    goto/16 :goto_2

    .line 114
    :cond_1a
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "setting_chooselocation"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 115
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-static {v5, v12}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 116
    :cond_1b
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "vip"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 117
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    iget v6, v0, Ll/k930;->j:I

    invoke-static {v5, v6}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 118
    :cond_1c
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "fakealert"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 119
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v1}, Ll/dkb;->Z7()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 120
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    invoke-static {v1}, Ll/gv20;->m(Lcom/p1/mobile/android/app/Act;)V

    goto/16 :goto_2

    .line 121
    :cond_1d
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "welcomeBack"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 122
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v1

    sget-object v5, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_welcomeback_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 124
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    move-result-object v1

    .line 125
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 126
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v6

    .line 127
    invoke-virtual {v6}, Ll/pk50;->f()Ll/rj50;

    move-result-object v6

    .line 128
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    iget-object v7, v1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    iget-boolean v7, v7, Lcom/p1/mobile/putong/data/OMSDisplayRule;->userDimension:Z

    xor-int/2addr v7, v4

    .line 129
    invoke-virtual {v6, v5, v7}, Ll/rj50;->M(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 130
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v5

    invoke-virtual {v5}, Ll/pk50;->f()Ll/rj50;

    move-result-object v5

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v6

    invoke-virtual {v5, v6, v1, v4, v10}, Ll/rj50;->u0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZLl/y20;)V

    goto/16 :goto_2

    .line 131
    :cond_1e
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "voiceChat"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 132
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->VoiceChat:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    goto/16 :goto_2

    .line 133
    :cond_1f
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "seePicks"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 134
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 135
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    new-instance v5, Landroid/content/Intent;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 136
    :cond_20
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "quickChat2Floor"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 137
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 138
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 139
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    const-string v5, "active"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Ljava/lang/String;

    .line 140
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    :cond_21
    move-object v1, v10

    .line 141
    :goto_0
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    .line 142
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v6

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_22

    const-string v1, "push_quickchat"

    :cond_22
    invoke-static {v6, v10, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 143
    invoke-virtual {v5, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2

    .line 144
    :cond_23
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "profile_purchase_svip"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const-string v11, "NA,NA,push_click"

    if-eqz v1, :cond_24

    .line 145
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    .line 147
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    .line 148
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-interface {v1, v5, v11, v10, v10}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    goto/16 :goto_2

    .line 149
    :cond_24
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "profile_purchase_see"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 150
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v1

    .line 152
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v1

    .line 153
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-interface {v1, v5, v11}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 154
    :cond_25
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "profile_purchase_vip"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 155
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 156
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 157
    :cond_26
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "intl_operating_pet"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const/4 v10, 0x3

    if-eqz v1, :cond_27

    .line 158
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/a$a;->f()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 159
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 160
    sget-object v1, Ll/ix60;->INSTANCE:Ll/ix60;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-virtual {v1, v5, v10}, Ll/ix60;->e0(Lcom/p1/mobile/android/app/Act;I)V

    goto/16 :goto_2

    .line 161
    :cond_27
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "intl_similar_interests"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 162
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/a$a;->g()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 163
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 164
    sget-object v1, Ll/xnf0;->INSTANCE:Ll/xnf0;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-virtual {v1, v5, v10}, Ll/xnf0;->n(Lcom/p1/mobile/android/app/Act;I)V

    goto/16 :goto_2

    .line 165
    :cond_28
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "intl_camping"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 166
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/a$a;->c()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 167
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 168
    sget-object v1, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->INSTANCE:Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;

    .line 169
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    .line 170
    invoke-virtual {v1, v5, v10}, Lcom/p1/mobile/putong/core/ui/intloperation/campingactivity/b;->i(Lcom/p1/mobile/android/app/Act;I)V

    goto/16 :goto_2

    .line 171
    :cond_29
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v11, "regular_main_popup"

    invoke-static {v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 172
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/a$a;->a()Z

    move-result v1

    if-nez v1, :cond_32

    .line 173
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 174
    sget-object v1, Ll/udo;->INSTANCE:Ll/udo;

    .line 175
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    .line 176
    invoke-virtual {v1, v5, v10}, Ll/udo;->m(Lcom/p1/mobile/android/app/Act;I)V

    goto/16 :goto_2

    .line 177
    :cond_2a
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "intl_third_pay_quick_login"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 178
    sget-object v1, Lcom/p1/mobile/putong/core/ui/quicklogin/a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/quicklogin/a;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/ui/quicklogin/a;->b(Lcom/p1/mobile/android/app/Act;)V

    goto/16 :goto_2

    .line 179
    :cond_2b
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "loveBuzz"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 180
    invoke-static {}, Ll/d79;->e0()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 181
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Buzz:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    goto/16 :goto_2

    .line 182
    :cond_2c
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "intlTribe"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 183
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 184
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/m;->z3()Lrx/subjects/a;

    move-result-object v1

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v5}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 185
    :cond_2d
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v10, "heartbeatMatch"

    invoke-static {v1, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 186
    const-string v1, "e_heart_signal_enter"

    new-array v10, v9, [Ll/pf60;

    invoke-static {v1, v12, v10}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 187
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v10, "bundle_check_exp"

    invoke-virtual {v1, v10, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 188
    const-string v11, "bundle_push_exp_time"

    if-eqz v1, :cond_2f

    .line 189
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v11, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v12

    cmp-long v1, v12, v5

    if-lez v1, :cond_2e

    .line 190
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v5

    cmp-long v1, v5, v12

    if-lez v1, :cond_2e

    .line 191
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v1

    new-instance v5, Ll/i830;

    invoke-direct {v5, v0}, Ll/i830;-><init>(Ll/k930;)V

    .line 192
    invoke-static {v1, v5, v7, v8}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    goto :goto_1

    .line 193
    :cond_2e
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 194
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v5

    const-wide/16 v7, 0x4e20

    add-long/2addr v5, v7

    iput-wide v5, v1, Ll/f49;->h0:J

    .line 195
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 196
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "traker"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 197
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "userid"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 198
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    invoke-virtual {v6, v1}, Ll/f49;->V3(Ljava/lang/String;)Lrx/c;

    move-result-object v1

    invoke-virtual {v1, v4}, Lrx/c;->take(I)Lrx/c;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v1

    new-instance v6, Ll/j830;

    invoke-direct {v6, v5}, Ll/j830;-><init>(Ljava/lang/String;)V

    new-instance v5, Ll/f930;

    invoke-direct {v5}, Ll/f930;-><init>()V

    .line 199
    invoke-static {v6, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v5

    .line 200
    invoke-virtual {v1, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 201
    :cond_2f
    :goto_1
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v10}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 202
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v11}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_2

    .line 203
    :cond_30
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v5, "verify_avatar"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 204
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 205
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :cond_32

    .line 206
    iget-object v1, v0, Ll/k930;->i:Ljava/util/HashMap;

    const-string v5, "status"

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 207
    sget-object v5, Ll/bep;->INSTANCE:Ll/bep;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v6

    invoke-virtual {v5, v6, v1}, Ll/bep;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    goto :goto_2

    .line 208
    :cond_31
    iget-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    const-string v5, "internal_voice_square"

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 209
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "live_internal_voice_square_tab_id"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    move-result-object v6

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v7

    invoke-interface {v6, v7, v1}, Ll/ftn0;->r(Landroid/content/Context;Ljava/lang/String;)V

    .line 211
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 212
    :cond_32
    :goto_2
    const-string v1, "unknown_"

    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    move-result-object v1

    iput-object v1, v0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 213
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "superlike_user_id"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_33

    .line 214
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 215
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 216
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a9(Ljava/lang/String;)Lrx/c;

    move-result-object v1

    new-instance v2, Ll/g930;

    invoke-direct {v2}, Ll/g930;-><init>()V

    new-instance v3, Ll/h930;

    invoke-direct {v3}, Ll/h930;-><init>()V

    .line 217
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 218
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 219
    :cond_33
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "album_user_id"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    .line 220
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 221
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v6

    .line 223
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v7

    .line 224
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v12, 0x2

    .line 225
    const-string v9, "push"

    const/4 v10, -0x1

    invoke-interface/range {v6 .. v12}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    .line 226
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 227
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 228
    :cond_34
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "extra_to_caption"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 229
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 230
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 231
    :cond_35
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 232
    :cond_36
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "card_push_link"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_37

    .line 233
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 234
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 235
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 236
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y8(Ljava/lang/String;)Lrx/c;

    .line 237
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 238
    :cond_37
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "oms_dialog_link"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 239
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "oms_id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 240
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "oms_identifier"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 241
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    .line 242
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v1

    .line 243
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ll/rj50;->S(Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSDialogInfo;

    move-result-object v8

    .line 244
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 245
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v1

    invoke-virtual {v1, v4}, Ll/rj50;->r0(Z)V

    .line 246
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v6

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v7

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v6 .. v11}, Ll/rj50;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZZLl/y20;)V

    goto :goto_3

    .line 247
    :cond_38
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    .line 248
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v1

    .line 249
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/rj50;->p0(Ljava/lang/String;)Lrx/c;

    move-result-object v1

    .line 250
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v1

    new-instance v2, Ll/i930;

    invoke-direct {v2, v0}, Ll/i930;-><init>(Ll/k930;)V

    new-instance v3, Ll/j930;

    invoke-direct {v3}, Ll/j930;-><init>()V

    .line 251
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v2

    .line 252
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 253
    :cond_39
    :goto_3
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 254
    :cond_3a
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "extra_to_conversation"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 255
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 256
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 257
    :cond_3b
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 258
    :cond_3c
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "letter_user_id"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3d

    .line 259
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v6, "letter_content"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3d

    .line 260
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 261
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 262
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 263
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    invoke-virtual {v3, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->X8(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object v1

    new-instance v2, Ll/w730;

    invoke-direct {v2}, Ll/w730;-><init>()V

    new-instance v3, Ll/x730;

    invoke-direct {v3}, Ll/x730;-><init>()V

    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 264
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 265
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 266
    :cond_3d
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "extra_to_message"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 267
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 268
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 269
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "extra_message_user_id"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 270
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3e

    .line 271
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v10

    .line 272
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    .line 273
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "media_keyboard"

    invoke-virtual {v1, v2, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v15

    const/4 v12, 0x0

    const/4 v13, 0x0

    .line 274
    invoke-static/range {v10 .. v15}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->n2(Landroid/content/Context;Ljava/lang/String;ZZIZ)Landroid/content/Intent;

    move-result-object v1

    .line 275
    iget-object v2, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    new-instance v3, Ll/y730;

    invoke-direct {v3, v0, v1}, Ll/y730;-><init>(Ll/k930;Landroid/content/Intent;)V

    const-wide/16 v0, 0x1f4

    invoke-static {v2, v3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    return-void

    .line 276
    :cond_3e
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "NewMainAct error: can not go to MessagesAct, because userId = null"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    return-void

    .line 277
    :cond_3f
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "album_comment_or_like_user_id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_40

    .line 278
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 279
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 280
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 281
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v2

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v3

    const/4 v6, 0x1

    const/4 v7, 0x1

    const-string v4, "activities"

    const/4 v5, 0x1

    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumActivitiesAct(Landroid/content/Context;Ljava/lang/String;ZZZ)Landroid/content/Intent;

    move-result-object v0

    .line 282
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 283
    :cond_40
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "extra_new_main_type"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_41

    .line 284
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "extra_new_main_type_moment_live"

    .line 285
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_41

    .line 286
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 287
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 288
    :cond_41
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_42

    .line 289
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "extra_new_main_type_live"

    .line 290
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 291
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 292
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 293
    :cond_42
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "extra_join_group_id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_43

    .line 294
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 295
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 296
    invoke-virtual {v0, v1}, Ll/k930;->C1(Ljava/lang/String;)V

    .line 297
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 298
    :cond_43
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "navigation_to_picks"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 299
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 300
    iget-object v1, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    invoke-direct {v4, v5, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 301
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 302
    :cond_44
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "navigation_to_moment_post"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 303
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v0, v1, v9}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 304
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "extra_topic_id"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 305
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "extra_topic_name"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 306
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "extra_from_key"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 307
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v3

    iget-object v4, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 308
    invoke-interface {v3, v4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->getFeedMediaHandler(Lcom/p1/mobile/android/app/Act;)Ll/keh;

    move-result-object v10

    iget-object v11, v0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    new-array v3, v9, [Lcom/p1/mobile/putong/data/Media;

    .line 309
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v12

    .line 310
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_45

    const-string v1, "other"

    :cond_45
    move-object v14, v1

    new-instance v1, Ll/z730;

    invoke-direct {v1, v0}, Ll/z730;-><init>(Ll/k930;)V

    const/16 v3, 0x190

    .line 311
    invoke-static {v3, v1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    move-result-object v17

    const/16 v18, 0x0

    const/4 v13, 0x1

    .line 312
    invoke-interface/range {v10 .. v18}, Ll/keh;->b(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/String;)V

    .line 313
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    return-void

    .line 314
    :cond_46
    invoke-static {}, Ll/gra;->M2()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 315
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "extra_show_surprise_box_dialog"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 316
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v2, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 317
    new-instance v1, Ll/gch0;

    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v3

    invoke-direct {v1, v3}, Ll/gch0;-><init>(Landroid/content/Context;)V

    .line 318
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    move-result v3

    if-eqz v3, :cond_47

    .line 319
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    move-result-object v3

    sget-object v4, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SURPRISE_BOX:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 320
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object v5

    const/16 v6, 0x4e20

    invoke-virtual {v3, v4, v5, v1, v6}, Lcom/p1/mobile/android/ui/poplevel/a;->C(Ll/c3m;Ll/e3m;Ll/d3m;I)V

    goto :goto_4

    .line 321
    :cond_47
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    move-result-object v3

    invoke-static {v1}, Ll/al80;->a(Ll/f3m;)Ll/al80;

    move-result-object v1

    invoke-virtual {v3, v1}, Ll/cl80;->q(Ll/al80;)V

    .line 322
    :goto_4
    invoke-virtual {v0}, Ll/k930;->c1()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    :cond_48
    :goto_5
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    const-string v0, "NewMainBasePresenter initSubscription"

    .line 2
    .line 3
    invoke-static {v0}, Ll/yhi0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/uqb0;->v0:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/m830;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/m830;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->J5()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v2, Ll/o830;

    .line 42
    .line 43
    invoke-direct {v2}, Ll/o830;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v3, Ll/p830;

    .line 47
    .line 48
    invoke-direct {v3}, Ll/p830;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/k930;->c:Lrx/subjects/a;

    .line 59
    .line 60
    new-instance v2, Ll/q830;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/q830;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v2, Ll/s830;

    .line 82
    .line 83
    invoke-direct {v2}, Ll/s830;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v3, Ll/t830;

    .line 87
    .line 88
    invoke-direct {v3}, Ll/t830;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v2, Ll/u830;

    .line 109
    .line 110
    invoke-direct {v2}, Ll/u830;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    new-instance v0, Ll/v830;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/v830;-><init>(Ll/k930;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    new-instance v1, Ll/w830;

    .line 141
    .line 142
    invoke-direct {v1}, Ll/w830;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/x830;

    .line 150
    .line 151
    invoke-direct {v1}, Ll/x830;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 155
    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/api/u;->a3()V

    .line 158
    .line 159
    .line 160
    invoke-static {}, Ll/yy6;->M()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/n830;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/n830;-><init>(Ll/k930;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    invoke-static {}, Ll/yhi0;->b()V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public abstract a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
.end method

.method public b1()Lcom/p1/mobile/putong/newui/main/base/TabName;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    return-object p0
.end method

.method public c1()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d1()Lcom/p1/mobile/putong/core/newui/main/a$v;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->l:Lcom/p1/mobile/putong/core/newui/main/a$v;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public f1(Landroid/content/Intent;)V
    .locals 10

    .line 1
    const-string v0, "bundle_check_exp"

    .line 2
    .line 3
    const-string v1, "extra_navigation_to_tenum"

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 14
    .line 15
    iput-object v2, p0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :catchall_0
    move-exception v2

    .line 19
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    iget-object v2, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    invoke-virtual {v2, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_2
    iget-object p1, p0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 64
    .line 65
    const-string v2, "unknown_"

    .line 66
    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    invoke-static {v2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 74
    .line 75
    :cond_2
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v3, "EXTRA_SHOW_TUTORIAL"

    .line 80
    .line 81
    const/4 v4, 0x0

    .line 82
    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    sput-boolean p1, Ll/k930;->p:Z

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string v3, "from_sign_up"

    .line 93
    .line 94
    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    iput-boolean p1, p0, Ll/k930;->f:Z

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string v3, "extra_show_secret_crush_introduction"

    .line 105
    .line 106
    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iput-boolean p1, p0, Ll/k930;->g:Z

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string v3, "extra_from_push_transfer"

    .line 117
    .line 118
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Landroid/content/Intent;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    const-string v5, "extra_navigation_card_to"

    .line 129
    .line 130
    invoke-virtual {v3, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 135
    .line 136
    iput-object v3, p0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 137
    .line 138
    if-nez v3, :cond_3

    .line 139
    .line 140
    invoke-static {v2}, Lcom/p1/mobile/putong/data/NavigationCardIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iput-object v2, p0, Ll/k930;->k:Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 145
    .line 146
    :cond_3
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    const-string v3, "extra_scroll_to_setting_bottom"

    .line 151
    .line 152
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    iput-boolean v2, p0, Ll/k930;->m:Z

    .line 157
    .line 158
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    const-string v3, "navigation_to_vip_page_index"

    .line 163
    .line 164
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    iput v2, p0, Ll/k930;->j:I

    .line 169
    .line 170
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    const-string v3, "extra_param_2"

    .line 175
    .line 176
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    check-cast v2, Ljava/util/HashMap;

    .line 181
    .line 182
    iput-object v2, p0, Ll/k930;->i:Ljava/util/HashMap;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    const-string v6, "tarot_dialog"

    .line 189
    .line 190
    invoke-virtual {v2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    const-string v7, "horoscope_dialog"

    .line 199
    .line 200
    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v6

    .line 204
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v2

    .line 208
    if-nez v2, :cond_4

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-static {v2}, Ll/oli0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 215
    .line 216
    .line 217
    :cond_4
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-nez v2, :cond_5

    .line 222
    .line 223
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-static {v2}, Ll/ly5;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 228
    .line 229
    .line 230
    :cond_5
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    const-string v6, "bundle_notify_type"

    .line 235
    .line 236
    invoke-virtual {v2, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    const-string v6, "common.link"

    .line 241
    .line 242
    invoke-static {v2, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v6

    .line 246
    if-nez v6, :cond_7

    .line 247
    .line 248
    const-string v6, "heartbeat.match.link"

    .line 249
    .line 250
    invoke-static {v2, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v6

    .line 254
    if-eqz v6, :cond_6

    .line 255
    .line 256
    goto :goto_3

    .line 257
    :cond_6
    invoke-static {}, Ll/spl0;->Q()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_a

    .line 262
    .line 263
    const-string v0, "quickchat.party"

    .line 264
    .line 265
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-eqz v0, :cond_a

    .line 270
    .line 271
    invoke-static {}, Ll/i5c0;->i()Ll/i5c0;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    invoke-virtual {v0, v2}, Ll/i5c0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 280
    .line 281
    .line 282
    goto :goto_4

    .line 283
    :cond_7
    :goto_3
    :try_start_2
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v2, v0, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 288
    .line 289
    .line 290
    move-result v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 291
    const-string v4, "bundle_push_exp_time"

    .line 292
    .line 293
    if-eqz v2, :cond_9

    .line 294
    .line 295
    :try_start_3
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    const-wide/16 v6, 0x0

    .line 300
    .line 301
    invoke-virtual {v2, v4, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 302
    .line 303
    .line 304
    move-result-wide v8

    .line 305
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 306
    .line 307
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 308
    .line 309
    invoke-virtual {v2}, Ll/f49;->J3()Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    if-nez v2, :cond_8

    .line 314
    .line 315
    cmp-long v2, v8, v6

    .line 316
    .line 317
    if-lez v2, :cond_8

    .line 318
    .line 319
    invoke-static {}, Ll/pzi0;->o()J

    .line 320
    .line 321
    .line 322
    move-result-wide v6

    .line 323
    cmp-long v2, v6, v8

    .line 324
    .line 325
    if-lez v2, :cond_8

    .line 326
    .line 327
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    new-instance v6, Ll/g830;

    .line 332
    .line 333
    invoke-direct {v6}, Ll/g830;-><init>()V

    .line 334
    .line 335
    .line 336
    const-wide/16 v7, 0x3e8

    .line 337
    .line 338
    invoke-static {v2, v6, v7, v8}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 339
    .line 340
    .line 341
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 342
    .line 343
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 344
    .line 345
    invoke-virtual {v2}, Ll/f49;->d4()V

    .line 346
    .line 347
    .line 348
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 349
    .line 350
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 351
    .line 352
    invoke-virtual {v2}, Ll/f49;->J3()Z

    .line 353
    .line 354
    .line 355
    :cond_9
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    invoke-virtual {v2, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v0, v4}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 367
    .line 368
    .line 369
    :catch_0
    :cond_a
    :goto_4
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {v0, v3}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-virtual {v0, v5}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    iget-object v0, p0, Ll/k930;->h:Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 391
    .line 392
    const-string v1, "menu"

    .line 393
    .line 394
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    if-eqz v0, :cond_b

    .line 399
    .line 400
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-static {v0}, Ll/toh0;->i(Landroid/content/Intent;)Z

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-eqz v0, :cond_b

    .line 409
    .line 410
    invoke-static {}, Ll/asj0;->e0()V

    .line 411
    .line 412
    .line 413
    :cond_b
    iget-boolean v0, p0, Ll/k930;->f:Z

    .line 414
    .line 415
    if-eqz v0, :cond_c

    .line 416
    .line 417
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 418
    .line 419
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 420
    .line 421
    iget-object v0, v0, Ll/dkb;->S:Ll/jxd0;

    .line 422
    .line 423
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 424
    .line 425
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    invoke-static {}, Ll/lq40;->a()Ll/lq40;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    const/4 v1, 0x1

    .line 433
    iput-boolean v1, v0, Ll/lq40;->a:Z

    .line 434
    .line 435
    :cond_c
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/a0;->g()V

    .line 440
    .line 441
    .line 442
    sget-object v0, Ll/wtd;->b:Ll/jxd0;

    .line 443
    .line 444
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    check-cast v0, Ljava/lang/Boolean;

    .line 449
    .line 450
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    if-eqz v0, :cond_d

    .line 455
    .line 456
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    new-instance v1, Ll/r830;

    .line 461
    .line 462
    invoke-direct {v1, p0}, Ll/r830;-><init>(Ll/k930;)V

    .line 463
    .line 464
    .line 465
    const-wide/16 v2, 0x12c

    .line 466
    .line 467
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 468
    .line 469
    .line 470
    sget-object v0, Ll/wtd;->a:Ll/wyd0;

    .line 471
    .line 472
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    check-cast v0, Ljava/lang/CharSequence;

    .line 477
    .line 478
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-nez v0, :cond_d

    .line 483
    .line 484
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 485
    .line 486
    .line 487
    move-result-object v0

    .line 488
    new-instance v1, Ll/c930;

    .line 489
    .line 490
    invoke-direct {v1, p0}, Ll/c930;-><init>(Ll/k930;)V

    .line 491
    .line 492
    .line 493
    const-wide/16 v2, 0x190

    .line 494
    .line 495
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 496
    .line 497
    .line 498
    :cond_d
    iget-boolean v0, p0, Ll/k930;->f:Z

    .line 499
    .line 500
    if-eqz v0, :cond_e

    .line 501
    .line 502
    invoke-virtual {p0}, Ll/k930;->i1()V

    .line 503
    .line 504
    .line 505
    :cond_e
    if-eqz p1, :cond_f

    .line 506
    .line 507
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 508
    .line 509
    .line 510
    move-result-object p0

    .line 511
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 512
    .line 513
    .line 514
    :cond_f
    return-void
.end method

.method public final g1()V
    .locals 9

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const-string v0, "fakeMatch"

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/joa;->f4()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/qap$a;->h()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0}, Ll/qap$a;->h()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {v1, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 68
    .line 69
    const/4 v7, 0x0

    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    const/4 v3, 0x1

    .line 75
    const/4 v4, 0x0

    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/qa9;->w3()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_3

    .line 94
    .line 95
    sget-object p0, Ll/qap;->Companion:Ll/qap$a;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/qap$a;->h()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_3

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {p0}, Ll/qap$a;->h()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-interface {v1, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_2

    .line 124
    .line 125
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 126
    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 128
    .line 129
    const/4 v7, 0x0

    .line 130
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 131
    .line 132
    .line 133
    move-result-object v8

    .line 134
    const/4 v3, 0x1

    .line 135
    const/4 v4, 0x0

    .line 136
    const/4 v5, 0x0

    .line 137
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/LikeExtraData;Lcom/p1/mobile/putong/data/LikeFrom;)Lrx/c;

    .line 138
    .line 139
    .line 140
    :cond_2
    return-void

    .line 141
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ch()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_4

    .line 154
    .line 155
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 158
    .line 159
    invoke-virtual {v0, p0}, Ll/qa9;->u3(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string v0, ""

    .line 167
    .line 168
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rp(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 174
    .line 175
    invoke-virtual {p0}, Ll/qa9;->q3()V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public abstract h1()V
.end method

.method public final i1()V
    .locals 3

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v1, p0, Ll/k930;->f:Z

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/status/MarryStatusSetAct;->a2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/16 v2, 0x17

    .line 22
    .line 23
    invoke-virtual {v1, v0, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic j1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/k930;->a1(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Ll/wtd;->a:Ll/wyd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "live_id_enter"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "skip_from"

    .line 22
    .line 23
    const-string v2, "fb"

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "e_intl_skip_to_live_room"

    .line 34
    .line 35
    const-string v2, "p_suggest_users_home_view"

    .line 36
    .line 37
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 41
    .line 42
    const-string v1, "unknown_"

    .line 43
    .line 44
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 51
    .line 52
    const-string v1, "oversea"

    .line 53
    .line 54
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    return-void

    .line 62
    :cond_1
    :goto_0
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 63
    .line 64
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 65
    .line 66
    .line 67
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 70
    .line 71
    const-string v1, "oversea_chinese"

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Ll/dkb;->z9(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance v0, Ll/d930;

    .line 88
    .line 89
    invoke-direct {v0}, Ll/d930;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic k1()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

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
    sget-object v1, Ll/wtd;->a:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "chat"

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-interface {v0, p0, v1, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic l1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k930;->c1()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/toh0;->i(Landroid/content/Intent;)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/y830;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/y830;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic n1(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Landroid/content/ComponentName;

    .line 8
    .line 9
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const-class v1, Lcom/p1/mobile/putong/miniwidget/MiniWidgetProvider;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic o1(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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
    const/4 v1, 0x1

    .line 10
    invoke-static {p0, p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;->a2(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->titleText:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionUrl:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v0, "hideNavigationBar"

    .line 48
    .line 49
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->O5:I

    .line 61
    .line 62
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic q1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/R$string;->H6:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic s1(Lcom/p1/mobile/putong/data/OMSDialogInfo;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ll/rj50;->r0(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v5, 0x1

    .line 32
    const/4 v6, 0x0

    .line 33
    const/4 v4, 0x0

    .line 34
    move-object v3, p1

    .line 35
    invoke-virtual/range {v1 .. v6}, Ll/rj50;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/OMSDialogInfo;ZZLl/y20;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic t1(Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u1(Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/k930;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/16 v0, 0x312

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic v1(Lcom/p1/mobile/putong/data/MomentFeedPushArgs;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->A0:Lrx/subjects/a;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "comment"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->path:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v2, v3, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentActivitiesAct(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    const-string v0, "user"

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->path:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsFeedAct(Landroid/content/Context;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->uid:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 86
    .line 87
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 96
    .line 97
    const-string v1, "matched"

    .line 98
    .line 99
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MomentFeedPushArgs;->uid:Ljava/lang/String;

    .line 118
    .line 119
    const-string v2, "scheme"

    .line 120
    .line 121
    invoke-interface {v1, p0, p1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToMomentsInProfileAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/d79;->U()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public z1()V
    .locals 6

    .line 1
    sget-boolean v0, Ll/k930;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-wide v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i:J

    .line 7
    .line 8
    sget-wide v4, Lcom/p1/mobile/putong/app/TantanApp;->h:J

    .line 9
    .line 10
    cmp-long v0, v2, v4

    .line 11
    .line 12
    if-ltz v0, :cond_0

    .line 13
    .line 14
    sget-wide v2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->i:J

    .line 15
    .line 16
    sget-wide v4, Lcom/p1/mobile/putong/app/TantanApp;->h:J

    .line 17
    .line 18
    sub-long/2addr v2, v4

    .line 19
    const-wide/16 v4, 0xbb8

    .line 20
    .line 21
    cmp-long v0, v2, v4

    .line 22
    .line 23
    if-gez v0, :cond_0

    .line 24
    .line 25
    sput-boolean v1, Ll/k930;->q:Z

    .line 26
    .line 27
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->b:Ll/uqb0;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    sget-wide v4, Lcom/p1/mobile/putong/app/TantanApp;->f:J

    .line 37
    .line 38
    sub-long/2addr v2, v4

    .line 39
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "during_time"

    .line 44
    .line 45
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-boolean v2, Ll/uqb0;->n0:Z

    .line 50
    .line 51
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "from_sign"

    .line 56
    .line 57
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    sget-boolean v3, Lcom/p1/mobile/putong/app/TantanApp;->g:Z

    .line 62
    .line 63
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    const-string v4, "first_record"

    .line 68
    .line 69
    invoke-static {v4, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    filled-new-array {v0, v2, v3}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v2, "e_app_launch_duration"

    .line 78
    .line 79
    const-string v3, ""

    .line 80
    .line 81
    invoke-static {v2, v3, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/jf00;->k()Lrx/c;

    .line 87
    .line 88
    .line 89
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->x()V

    .line 92
    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 99
    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/sw6;->q3()V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/h7d0;->m0()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G0:Ll/s07;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/s07;->p3()V

    .line 119
    .line 120
    .line 121
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->m0:Ll/byd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/Long;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 134
    .line 135
    .line 136
    move-result-wide v2

    .line 137
    const-wide/16 v4, 0x0

    .line 138
    .line 139
    cmp-long v0, v2, v4

    .line 140
    .line 141
    if-gtz v0, :cond_2

    .line 142
    .line 143
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->m0:Ll/byd0;

    .line 148
    .line 149
    invoke-static {}, Ll/pzi0;->o()J

    .line 150
    .line 151
    .line 152
    move-result-wide v2

    .line 153
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    :cond_2
    invoke-virtual {p0}, Ll/k930;->g1()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v2, Ll/k830;

    .line 168
    .line 169
    invoke-direct {v2}, Ll/k830;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    new-instance v1, Ll/l830;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/l830;-><init>(Ll/k930;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 190
    .line 191
    .line 192
    return-void
.end method
