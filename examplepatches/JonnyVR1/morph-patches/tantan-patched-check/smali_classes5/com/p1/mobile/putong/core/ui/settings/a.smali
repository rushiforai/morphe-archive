.class public Lcom/p1/mobile/putong/core/ui/settings/a;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/settings/b;",
        ">;"
    }
.end annotation


# static fields
.field public static y:Ll/wyd0;


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/data/Settings;

.field public c:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

.field public d:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

.field public e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

.field public f:Ll/fmj;

.field public g:Lv/CoverGuideView;

.field public h:Ll/jxd0;

.field public i:Ll/jxd0;

.field public final j:Ll/jxd0;

.field public k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public m:[Ljava/lang/String;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

.field public r:Z

.field public s:I

.field public t:Z

.field public u:Ljava/lang/String;

.field public v:I

.field public w:I

.field public x:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "city"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    const-string v1, "prioritized_recommend_guideview_shown"

    .line 9
    .line 10
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->h:Ll/jxd0;

    .line 14
    .line 15
    new-instance p1, Ll/jxd0;

    .line 16
    .line 17
    const-string v1, "tantan_verification_tip_show"

    .line 18
    .line 19
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->i:Ll/jxd0;

    .line 23
    .line 24
    new-instance p1, Ll/jxd0;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "hasJumpToNotificationPage"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->j:Ll/jxd0;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->n:Z

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->o:Z

    .line 58
    .line 59
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->p:Z

    .line 60
    .line 61
    new-instance p1, Lcom/p1/mobile/putong/core/ui/settings/a$a;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/a$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->x:Ljava/lang/Runnable;

    .line 67
    .line 68
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->X2()V

    return-void
.end method

.method public static synthetic B1(Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/facebook/AccessToken;->d()Lcom/facebook/AccessToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/z0w;->m()Ll/z0w;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/z0w;->u()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->y2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->A2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->T2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->i2(Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C2()V

    return-void
.end method

.method public static bridge synthetic E1(Lcom/p1/mobile/putong/core/ui/settings/a;)Lcom/p1/mobile/putong/data/Settings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    return-object p0
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->R2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

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

.method public static synthetic H0(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->B2()V

    return-void
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->r2(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    return-void
.end method

.method public static synthetic J0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->l2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->t2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->n2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic P0(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "settings"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->D2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->v2(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->W2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->K2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->q2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->U2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->s2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->P2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->m2(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->p2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H2()V

    return-void
.end method

.method public static synthetic d1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->o2(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/core/ui/settings/a;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/settings/a;->e2(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic f0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic f1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->L2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->h3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->J2()V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

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
    new-instance v0, Ll/aye0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/aye0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic h1(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "settings"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->F(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->k2()V

    return-void
.end method

.method public static synthetic i1(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->N2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 2
    .line 3
    const-string v1, "wechat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 12
    .line 13
    const-string v0, "qq"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic j1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->I2(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j2(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    new-instance p1, Ll/l01;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/l01;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Bo:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "male"

    .line 23
    .line 24
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ao:I

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v2, "female"

    .line 44
    .line 45
    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v3, Lcom/p1/mobile/putong/core/R$string;->zo:I

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v3, "both"

    .line 65
    .line 66
    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    new-instance p1, Ll/l01;

    .line 70
    .line 71
    invoke-direct {p1}, Ll/l01;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Of:I

    .line 85
    .line 86
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Sf:I

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pf:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-string v1, "nonbinary"

    .line 129
    .line 130
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 134
    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Of:I

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v1, " & "

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Sf:I

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Bo:I

    .line 195
    .line 196
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ao:I

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    sget v2, Lcom/p1/mobile/putong/core/R$string;->zo:I

    .line 223
    .line 224
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    filled-new-array {p1, v0, v1}, [Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->m:[Ljava/lang/String;

    .line 233
    .line 234
    const/4 p1, 0x0

    .line 235
    invoke-static {p0, p1}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->f:Ll/fmj;

    .line 240
    .line 241
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 242
    .line 243
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->r()V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isCannotModify()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic k1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->Y2(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k2()V
    .locals 2

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->r:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Ll/pf60;

    .line 7
    .line 8
    const-string v0, "e_setting_finish_no_location"

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic l0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/a;->h2(Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/core/ui/settings/a;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/a;->w2(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->S2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->u2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic o0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/d1k0;->f:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic o1(Lcom/p1/mobile/putong/core/ui/settings/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->Z2(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic o2(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 32
    .line 33
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 34
    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic p0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->Q2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->j2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic q1(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic q2(Ljava/lang/Boolean;)V
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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->o1(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
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

.method public static synthetic r1(Lcom/p1/mobile/putong/core/ui/settings/a;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->f2(Ll/z80;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic s1(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->V2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/ui/settings/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->F2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t1(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->M2(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V

    return-void
.end method

.method private synthetic t2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->h1(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    const-string v1, "is_success"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "has_city"

    .line 10
    .line 11
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 16
    .line 17
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "location_latitude"

    .line 22
    .line 23
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 28
    .line 29
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v3, "location_longitude"

    .line 34
    .line 35
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {v1, v0, v2, p0}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "e_setting_location_to_address"

    .line 44
    .line 45
    const-string v1, ""

    .line 46
    .line 47
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic u1(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic u2(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_3

    .line 6
    .line 7
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->n:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/settings/b;->u1(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 23
    .line 24
    invoke-static {}, Ll/xxv;->u()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/xxv;->t()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    :cond_1
    move v1, v2

    .line 37
    :cond_2
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/settings/b;->w1(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->Q3()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/gra;->D2()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_6

    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->d1()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 58
    .line 59
    if-ne p1, v0, :cond_5

    .line 60
    .line 61
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_4

    .line 68
    .line 69
    move v1, v2

    .line 70
    :cond_4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, "is_location_success"

    .line 75
    .line 76
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    filled-new-array {p1}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v0, "e_setting_page_location_info"

    .line 85
    .line 86
    const-string v1, ""

    .line 87
    .line 88
    invoke-static {v0, v1, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->F3()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 96
    .line 97
    if-ne p1, v0, :cond_6

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

    .line 100
    .line 101
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

    .line 108
    .line 109
    invoke-virtual {p1}, Lv/CoverGuideView;->d()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

    .line 116
    .line 117
    invoke-virtual {p0}, Lv/CoverGuideView;->c()V

    .line 118
    .line 119
    .line 120
    :cond_6
    return-void
.end method

.method public static synthetic v1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v2(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/settings/b;->c:Lv/VScroll;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x4

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/b;->u1(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 35
    .line 36
    sget-object p1, Ll/yyh0;->INSTANCE:Ll/yyh0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/yyh0;->i()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->u:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 59
    .line 60
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->s:I

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 75
    .line 76
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->t:Z

    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->u:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 107
    .line 108
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->w:I

    .line 109
    .line 110
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 123
    .line 124
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->v:I

    .line 125
    .line 126
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 131
    .line 132
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E3()V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 136
    .line 137
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->k0()V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 144
    .line 145
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 146
    .line 147
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 148
    .line 149
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 150
    .line 151
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 158
    .line 159
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideContacts()Ljava/lang/Boolean;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideContacts:Ljava/lang/Boolean;

    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 168
    .line 169
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 174
    .line 175
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts()Ljava/lang/Boolean;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 190
    .line 191
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->previewPushMessage()Ljava/lang/Boolean;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 206
    .line 207
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 208
    .line 209
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->showMomentLikes()Ljava/lang/Boolean;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 214
    .line 215
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 218
    .line 219
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 220
    .line 221
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 222
    .line 223
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 228
    .line 229
    new-instance v1, Ljava/util/ArrayList;

    .line 230
    .line 231
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .line 233
    .line 234
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 235
    .line 236
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 243
    .line 244
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 245
    .line 246
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 247
    .line 248
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E3()V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 265
    .line 266
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 267
    .line 268
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 273
    .line 274
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 275
    .line 276
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 281
    .line 282
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 283
    .line 284
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 289
    .line 290
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 291
    .line 292
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 293
    .line 294
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 295
    .line 296
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 297
    .line 298
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->k0()V

    .line 299
    .line 300
    .line 301
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 302
    .line 303
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 304
    .line 305
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-eqz v0, :cond_3

    .line 316
    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 318
    .line 319
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 324
    .line 325
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 330
    .line 331
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IntlMoreGender;->clone()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 336
    .line 337
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 338
    .line 339
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 344
    .line 345
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 346
    .line 347
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 352
    .line 353
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 354
    .line 355
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->X1(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 360
    .line 361
    .line 362
    :cond_3
    return-void
.end method

.method public static synthetic x0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic x1(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->z2()V

    return-void
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->g2(Lcom/p1/mobile/putong/data/DoublePair;)V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/a;->x2(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic z1(Lcom/p1/mobile/putong/core/ui/settings/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->E2()V

    return-void
.end method


# virtual methods
.method public final synthetic A2(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/fye0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/fye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_svip"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C3(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public A3()Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/pxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic B2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->Y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B3(Lv/VFrame;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 8
    .line 9
    const-string v1, "verified"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const-string v0, "p_settings_view"

    .line 22
    .line 23
    const-string v1, "student"

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string p1, "e_student_verification_firstly_on"

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const-string p1, "e_student_verification_firstly_off"

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v1}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void

    .line 97
    :cond_2
    const-string p1, "pending"

    .line 98
    .line 99
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_3

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget p1, Lcom/p1/mobile/putong/core/R$string;->op:I

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 120
    .line 121
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->z1()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final synthetic C2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Hp:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Fp:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Gp:I

    .line 40
    .line 41
    new-instance v2, Ll/gye0;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/gye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->Y()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final C3(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/settings/b;->a1()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "privacy_type"

    .line 16
    .line 17
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    filled-new-array {v3}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const-string v4, "e_privacy"

    .line 26
    .line 27
    invoke-static {v4, v1, v3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/joa;->M3()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->a1()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    filled-new-array {p2}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {v4, p0, p2}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void

    .line 75
    :cond_1
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "p_settings,privacy"

    .line 90
    .line 91
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 92
    .line 93
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 98
    .line 99
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic D2(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/wxe0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/wxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "freeze_activetime"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C3(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public D3()V
    .locals 2

    .line 1
    sget-object v0, Ll/eaf0;->b:Ll/jxd0;

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    sget v1, Ll/dbc0;->xu:I

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/b;->e1(ZI)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic E2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ip:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->Z()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final E3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sget v2, Lcom/p1/mobile/putong/data/User;->AGE_MIN_GOOGLEPLAY:I

    .line 20
    .line 21
    if-ge v1, v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    sget v2, Lcom/p1/mobile/putong/data/User;->AGE_MIN_GOOGLEPLAY:I

    .line 59
    .line 60
    if-ge v1, v2, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 78
    .line 79
    return-void
.end method

.method public F1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic F2(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/xxe0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/xxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_age"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C3(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public F3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->a3()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 39
    .line 40
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 72
    .line 73
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 76
    .line 77
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 82
    .line 83
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 86
    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 92
    .line 93
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 102
    .line 103
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 106
    .line 107
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 112
    .line 113
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 114
    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 116
    .line 117
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 122
    .line 123
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 126
    .line 127
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 132
    .line 133
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 134
    .line 135
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 136
    .line 137
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iput-object v2, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 142
    .line 143
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 144
    .line 145
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 146
    .line 147
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 150
    .line 151
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_0

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 168
    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 170
    .line 171
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 172
    .line 173
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_1

    .line 188
    .line 189
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 190
    .line 191
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 192
    .line 193
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Ll/lwe0;

    .line 198
    .line 199
    invoke-direct {v1}, Ll/lwe0;-><init>()V

    .line 200
    .line 201
    .line 202
    new-instance v2, Ll/mwe0;

    .line 203
    .line 204
    invoke-direct {v2}, Ll/mwe0;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 212
    .line 213
    .line 214
    :cond_1
    invoke-static {}, Ll/d79;->T()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-eqz v0, :cond_2

    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->O1()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_2

    .line 229
    .line 230
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 233
    .line 234
    const/4 v1, 0x0

    .line 235
    invoke-virtual {v0, p0, v1}, Ll/dx6;->o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    new-instance v0, Ll/nwe0;

    .line 240
    .line 241
    invoke-direct {v0}, Ll/nwe0;-><init>()V

    .line 242
    .line 243
    .line 244
    new-instance v1, Ll/owe0;

    .line 245
    .line 246
    invoke-direct {v1}, Ll/owe0;-><init>()V

    .line 247
    .line 248
    .line 249
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 254
    .line 255
    .line 256
    :cond_2
    return-void
.end method

.method public H1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->j1()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic H2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Kp:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->a0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final H3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    invoke-static {}, Ll/joa;->M3()Z

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
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/ina;->R3(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/iye0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/iye0;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/jye0;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/jye0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public I1()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/String;

    .line 18
    .line 19
    return-object p0
.end method

.method public final synthetic I2(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/vxe0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/vxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "hide_location"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C3(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I3()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-double v0, v0

    .line 12
    invoke-static {v0, v1}, Ll/q8g0;->K(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide v2, 0x404d800000000000L    # 59.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    cmpl-double v2, v0, v2

    .line 22
    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v2, v3, :cond_0

    .line 46
    .line 47
    const/16 p0, 0x3b

    .line 48
    .line 49
    return p0

    .line 50
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-lt v2, p0, :cond_1

    .line 71
    .line 72
    const/16 p0, 0x3c

    .line 73
    .line 74
    return p0

    .line 75
    :cond_1
    double-to-int p0, v0

    .line 76
    return p0
.end method

.method public J1()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sub-int/2addr v0, p0

    .line 22
    div-int/lit16 v0, v0, 0x3e8

    .line 23
    .line 24
    return v0
.end method

.method public final synthetic J2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->b0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J3()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    sub-int/2addr v0, p0

    .line 22
    div-int/lit16 v0, v0, 0x3e8

    .line 23
    .line 24
    return v0
.end method

.method public final synthetic K2(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Ll/txe0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/txe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "show_to_mylikes_only"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/a;->C3(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public K3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/mxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public L1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->frozenActivity:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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
    const-string v0, "from_setting"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationHistoryAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic M2(Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;)V
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
    sget-object p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 9
    .line 10
    if-ne p1, p0, :cond_0

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Dm:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->t4:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public M3(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "increase_distance_open"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Ll/sfj0$a;->o(Z)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_edit_increase_distance"

    .line 25
    .line 26
    const-string v2, "p_settings_view"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 44
    .line 45
    return-void
.end method

.method public N1(I)Lcom/p1/mobile/android/app/Dialog$g;
    .locals 1

    .line 1
    new-instance v0, Ll/hye0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic N2(Ljava/lang/Throwable;)V
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
    sget p0, Lcom/p1/mobile/putong/core/R$string;->t4:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N3(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SettingsIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 14
    .line 15
    return-void
.end method

.method public O1()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->d:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->c:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->l1(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->d:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->c:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->subtract(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public O3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

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
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->P3()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->I1()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public P1()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic P2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    invoke-static {p1, v0}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 40
    .line 41
    .line 42
    invoke-interface {p1}, Ll/tvl;->a()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/cye0;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/cye0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/dye0;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/dye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Ll/eye0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/eye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final P3()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x2

    .line 16
    if-le v1, v2, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Tf:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-lez v1, :cond_3

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Lcom/p1/mobile/putong/data/LookingFor;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-nez v3, :cond_1

    .line 76
    .line 77
    const-string v3, " & "

    .line 78
    .line 79
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 83
    .line 84
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 99
    .line 100
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->l:Ljava/util/Map;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public Q1()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic Q2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/AboutTantanAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Q3()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ROAMING_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->Z:Ll/jxd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreProduct;->a0:Ll/jxd0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->v1()V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public R1()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic R2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "setting"

    .line 12
    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/IntlPersonalDetailsAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public R3(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public S1()I
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "ko"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/16 v1, 0x14

    .line 28
    .line 29
    if-gt v0, v1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method public final synthetic S2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gr(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public S3(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/common/R$string;->B:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->None:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 30
    .line 31
    invoke-static {v0, v1, p0, v1}, Ll/uqb0;->b1(Ljava/lang/Class;ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;Z)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {}, Ll/psd0;->F()Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    new-instance p0, Ljava/lang/Exception;

    .line 43
    .line 44
    const-string p1, "catch datebase query null NullPointerException"

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    sget-object v2, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v4}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lcom/p1/mobile/putong/data/AuthData;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2, v3, v4, p1}, Ll/yyd0;->p(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->d:Ll/yyd0;

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/eyd0;->i()Z

    .line 88
    .line 89
    .line 90
    :goto_0
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 91
    .line 92
    const-string v2, "Log out"

    .line 93
    .line 94
    invoke-virtual {p1, v2, v0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 98
    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->a1()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const-string v0, "e_sign_out_botton"

    .line 106
    .line 107
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    const/4 p1, 0x1

    .line 111
    invoke-static {p1, v1}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Lrx/c;->materialize()Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v0, Ll/vwe0;

    .line 124
    .line 125
    invoke-direct {v0}, Ll/vwe0;-><init>()V

    .line 126
    .line 127
    .line 128
    new-instance v1, Ll/wwe0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/wwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public T1()Ljava/lang/String;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/lit8 v2, v1, -0x1

    .line 22
    .line 23
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "ko"

    .line 32
    .line 33
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const-string v4, ""

    .line 38
    .line 39
    const-string v5, "+"

    .line 40
    .line 41
    const-string v6, " - "

    .line 42
    .line 43
    if-eqz v3, :cond_5

    .line 44
    .line 45
    const/16 v3, 0x14

    .line 46
    .line 47
    if-ge v0, v3, :cond_0

    .line 48
    .line 49
    move v0, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    if-lt v0, v2, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 65
    .line 66
    :goto_0
    if-ge v1, v3, :cond_2

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    if-lt v1, v2, :cond_3

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    goto :goto_1

    .line 82
    :cond_3
    add-int/lit8 v3, v1, 0x1

    .line 83
    .line 84
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_4

    .line 115
    .line 116
    move-object v4, v5

    .line 117
    :cond_4
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0

    .line 125
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {v1, p0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_6

    .line 168
    .line 169
    move-object v4, v5

    .line 170
    :cond_6
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0
.end method

.method public final synthetic T2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public T3(IILl/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lt p1, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lt p2, v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-gt p1, v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-gt p2, v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 70
    .line 71
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 76
    .line 77
    invoke-interface {p3}, Ll/x20;->call()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->x:Ljava/lang/Runnable;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->x:Ljava/lang/Runnable;

    .line 94
    .line 95
    const-wide/16 p2, 0x3e8

    .line 96
    .line 97
    invoke-virtual {p1, p0, p2, p3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public U1(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 12
    .line 13
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public final synthetic U2(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 13
    .line 14
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->s1(Lcom/p1/mobile/putong/data/SettingGroups;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v0, "male"

    .line 49
    .line 50
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v0, 0x0

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    move p1, v0

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v1, "female"

    .line 66
    .line 67
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/4 p1, 0x2

    .line 76
    :goto_0
    const-string v1, "p_settings_view"

    .line 77
    .line 78
    new-array v0, v0, [Ll/sfj0$a;

    .line 79
    .line 80
    const-string v2, "e_edit_gender_filter"

    .line 81
    .line 82
    invoke-static {v2, v1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 86
    .line 87
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->r1(I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public U3(Ll/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "+"

    .line 11
    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, " "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v3, Lcom/p1/mobile/putong/core/R$string;->kj:I

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-double v3, v1

    .line 49
    invoke-static {v3, v4}, Ll/q8g0;->K(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    const-wide v5, 0x404d800000000000L    # 59.0

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmpl-double v1, v3, v5

    .line 59
    .line 60
    if-ltz v1, :cond_0

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-ge v1, v5, :cond_0

    .line 83
    .line 84
    const-string p0, "59"

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    goto/16 :goto_1

    .line 91
    .line 92
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 103
    .line 104
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-lt v1, v5, :cond_1

    .line 113
    .line 114
    new-instance p0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v1, "60"

    .line 117
    .line 118
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    goto/16 :goto_1

    .line 132
    .line 133
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 144
    .line 145
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-gt v1, v2, :cond_2

    .line 154
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v1, "<1 "

    .line 158
    .line 159
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    sget v1, Lcom/p1/mobile/putong/core/R$string;->lj:I

    .line 167
    .line 168
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    goto/16 :goto_1

    .line 180
    .line 181
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .line 185
    .line 186
    sget-object v1, Ll/c17;->h:Ljava/text/DecimalFormat;

    .line 187
    .line 188
    invoke-virtual {v1, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    goto/16 :goto_1

    .line 203
    .line 204
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 205
    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    div-int/lit16 v1, v1, 0x3e8

    .line 215
    .line 216
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    sget v4, Lcom/p1/mobile/putong/core/R$string;->sh:I

    .line 221
    .line 222
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 227
    .line 228
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 233
    .line 234
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    if-nez v4, :cond_4

    .line 239
    .line 240
    move-object v4, v0

    .line 241
    :cond_4
    if-nez p0, :cond_5

    .line 242
    .line 243
    goto :goto_0

    .line 244
    :cond_5
    move-object v0, p0

    .line 245
    :goto_0
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    div-int/lit16 p0, p0, 0x3e8

    .line 250
    .line 251
    if-lt v1, p0, :cond_6

    .line 252
    .line 253
    new-instance p0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    div-int/lit16 v0, v0, 0x3e8

    .line 263
    .line 264
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    goto :goto_1

    .line 278
    :cond_6
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 279
    .line 280
    .line 281
    move-result p0

    .line 282
    div-int/lit16 p0, p0, 0x3e8

    .line 283
    .line 284
    if-gt v1, p0, :cond_7

    .line 285
    .line 286
    new-instance p0, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    const-string v1, "<"

    .line 289
    .line 290
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    div-int/lit16 v0, v0, 0x3e8

    .line 298
    .line 299
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    goto :goto_1

    .line 310
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 311
    .line 312
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 313
    .line 314
    .line 315
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    :goto_1
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    return-void
.end method

.method public V1()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, -0x1

    .line 22
    sparse-switch v1, :sswitch_data_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :sswitch_0
    const-string v1, "fate"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v3, 0x3

    .line 36
    goto :goto_0

    .line 37
    :sswitch_1
    const-string v1, "date"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v3, 0x2

    .line 47
    goto :goto_0

    .line 48
    :sswitch_2
    const-string v1, "relationship"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v3, 0x1

    .line 58
    goto :goto_0

    .line 59
    :sswitch_3
    const-string v1, "friend"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    move v3, v2

    .line 69
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :pswitch_0
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ho:I

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :pswitch_1
    sget v2, Lcom/p1/mobile/putong/core/R$string;->go:I

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :pswitch_2
    sget v2, Lcom/p1/mobile/putong/core/R$string;->jo:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :pswitch_3
    sget v2, Lcom/p1/mobile/putong/core/R$string;->io:I

    .line 83
    .line 84
    :goto_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :sswitch_data_0
    .sparse-switch
        -0x4b79f562 -> :sswitch_3
        -0xf9b89c8 -> :sswitch_2
        0x2eefae -> :sswitch_1
        0x2fd86c -> :sswitch_0
    .end sparse-switch

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic V2(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/datastorage/DataAndStorageAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public V3(I)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    const/16 v1, 0x3c

    .line 10
    .line 11
    if-ne p1, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    sub-int/2addr v2, p0

    .line 65
    int-to-double p0, p1

    .line 66
    invoke-static {p0, p1}, Ll/q8g0;->L(D)D

    .line 67
    .line 68
    .line 69
    move-result-wide p0

    .line 70
    const-wide/16 v3, 0x0

    .line 71
    .line 72
    invoke-static {v3, v4, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 73
    .line 74
    .line 75
    move-result-wide p0

    .line 76
    double-to-int p0, p0

    .line 77
    invoke-static {v2, p0}, Ljava/lang/Math;->min(II)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    add-int/2addr v1, p0

    .line 82
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMaximum()Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getRadiusAllowedMinimum()Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    sub-int/2addr v2, p0

    .line 128
    mul-int/lit16 p1, p1, 0x3e8

    .line 129
    .line 130
    const/4 p0, 0x0

    .line 131
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-static {v2, p0}, Ljava/lang/Math;->min(II)I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    add-int/2addr v1, p0

    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 145
    .line 146
    return-void
.end method

.method public W1()Landroid/text/SpannableString;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Hq:I

    .line 8
    .line 9
    const-string v2, "7.3.3"

    .line 10
    .line 11
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Landroid/text/style/UnderlineSpan;

    .line 23
    .line 24
    invoke-direct {p0}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v0, p0, v1, v2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public final synthetic W2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/d1k0;->x(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X1(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 12
    .line 13
    iput-object v0, v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlMoreGender;->notShowCis:Ljava/lang/Boolean;

    .line 26
    .line 27
    iput-object p1, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->notShowCis:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->P3()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic X2()V
    .locals 3

    .line 1
    const-string v0, "e_school_identify_makeSure_guide_click"

    .line 2
    .line 3
    const-string v1, "p_school_identify_makeSure_guide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v1, "Chanel8.SchoolIdentifyPage.Shown"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;->X1(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Y1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideAge:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Y2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->B1()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/dtf0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, v0}, Ll/dtf0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/dtf0;->a()V

    .line 18
    .line 19
    .line 20
    sget-object p1, Ll/eaf0;->b:Ll/jxd0;

    .line 21
    .line 22
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 30
    .line 31
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->q1(Ljava/lang/Boolean;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->p:Z

    .line 13
    .line 14
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->h0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->s:I

    .line 23
    .line 24
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->c0()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->t:Z

    .line 33
    .line 34
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->d0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->u:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->f0()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->v:I

    .line 53
    .line 54
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->e0()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->w:I

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->new_()Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 69
    .line 70
    return-void
.end method

.method public Z1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideLocation:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Z2(Ljava/lang/Throwable;)V
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

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/yve0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yve0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/awe0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/awe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/cwe0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/cwe0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/dwe0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/dwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

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
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/ewe0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/ewe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->j9()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/fwe0;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/fwe0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/gwe0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/gwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/hwe0;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/hwe0;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/iwe0;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/iwe0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Ll/kwe0;

    .line 119
    .line 120
    invoke-direct {v1}, Ll/kwe0;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/jwe0;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/jwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 140
    .line 141
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/uwe0;

    .line 148
    .line 149
    invoke-direct {v1}, Ll/uwe0;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/fxe0;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/fxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 167
    .line 168
    .line 169
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 174
    .line 175
    .line 176
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 179
    .line 180
    iget-object v0, v0, Ll/dkb;->e0:Ll/jxd0;

    .line 181
    .line 182
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    new-instance v1, Ll/qxe0;

    .line 195
    .line 196
    invoke-direct {v1, p0}, Ll/qxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 197
    .line 198
    .line 199
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 204
    .line 205
    .line 206
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    new-instance v1, Ll/bye0;

    .line 219
    .line 220
    invoke-direct {v1, p0}, Ll/bye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    new-instance v1, Ll/kye0;

    .line 228
    .line 229
    invoke-direct {v1, p0}, Ll/kye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 230
    .line 231
    .line 232
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 237
    .line 238
    .line 239
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 240
    .line 241
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 242
    .line 243
    iget-object v0, v0, Ll/sw6;->U:Ll/jxd0;

    .line 244
    .line 245
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    new-instance v1, Ll/lye0;

    .line 258
    .line 259
    invoke-direct {v1, p0}, Ll/lye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 260
    .line 261
    .line 262
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 267
    .line 268
    .line 269
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 270
    .line 271
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 272
    .line 273
    invoke-virtual {v0}, Ll/dkb;->ea()Lrx/c;

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-static {v0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 281
    .line 282
    .line 283
    invoke-static {}, Ll/d79;->T()Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_0

    .line 288
    .line 289
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 292
    .line 293
    invoke-virtual {v0}, Ll/dx6;->s3()Lrx/c;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    new-instance v1, Ll/mye0;

    .line 298
    .line 299
    invoke-direct {v1}, Ll/mye0;-><init>()V

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    new-instance v1, Ll/nye0;

    .line 311
    .line 312
    invoke-direct {v1, p0}, Ll/nye0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 313
    .line 314
    .line 315
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 320
    .line 321
    .line 322
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 323
    .line 324
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 325
    .line 326
    invoke-virtual {v0}, Ll/dx6;->q3()Lrx/c;

    .line 327
    .line 328
    .line 329
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ao(Ljava/lang/String;)Lrx/c;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    new-instance v1, Ll/zve0;

    .line 350
    .line 351
    invoke-direct {v1, p0}, Ll/zve0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 352
    .line 353
    .line 354
    new-instance p0, Ll/bwe0;

    .line 355
    .line 356
    invoke-direct {p0}, Ll/bwe0;-><init>()V

    .line 357
    .line 358
    .line 359
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 364
    .line 365
    .line 366
    return-void
.end method

.method public a2(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/a;->H3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final a3()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/app/Activity;

    .line 23
    .line 24
    instance-of v1, p0, Lcom/p1/mobile/putong/core/ui/account/SwitchAccountAct;

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    instance-of v1, p0, Lcom/p1/mobile/putong/core/ui/account/SwitchAccountV2Act;

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignOutJumpAct()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_0

    .line 45
    .line 46
    return v0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0

    .line 49
    :cond_1
    return v0
.end method

.method public b2()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 10
    .line 11
    const-string v2, "wechat"

    .line 12
    .line 13
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 20
    .line 21
    const-string v2, "qq"

    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    :cond_1
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Cc:I

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/settings/b;->p1(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 71
    .line 72
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 75
    .line 76
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->a0:Ll/sw6;

    .line 87
    .line 88
    iget-object v2, v2, Ll/sw6;->U:Ll/jxd0;

    .line 89
    .line 90
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Ljava/lang/Boolean;

    .line 95
    .line 96
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-nez v2, :cond_2

    .line 101
    .line 102
    const/4 v2, 0x1

    .line 103
    goto :goto_0

    .line 104
    :cond_2
    const/4 v2, 0x0

    .line 105
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/settings/b;->o1(Z)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/r43;->b()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 115
    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Wn:I

    .line 123
    .line 124
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->k1(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 133
    .line 134
    const-string v1, "facebook"

    .line 135
    .line 136
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 143
    .line 144
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Un:I

    .line 151
    .line 152
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->k1(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    :cond_4
    return-void
.end method

.method public b3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/CoverGuideView;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->g:Lv/CoverGuideView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lv/CoverGuideView;->c()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public c2()V
    .locals 2

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
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/axe0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/axe0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/bxe0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/bxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

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
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/cxe0;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/cxe0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/dxe0;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/dxe0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/exe0;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/exe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public c3(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    xor-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Ha(Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/uxe0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/uxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;Z)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/fjf0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/fjf0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d2(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p1, p0, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final synthetic e2(ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-eq p1, p4, :cond_2

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 12
    .line 13
    const-string p2, "male"

    .line 14
    .line 15
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iput-object p3, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 20
    .line 21
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    const/4 p2, 0x1

    .line 40
    if-ne p4, p2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 47
    .line 48
    const-string p2, "female"

    .line 49
    .line 50
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iput-object p3, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 55
    .line 56
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 77
    .line 78
    const-string p2, "both"

    .line 79
    .line 80
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    iput-object p3, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 85
    .line 86
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->k:Ljava/util/Map;

    .line 91
    .line 92
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->g1(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method

.method public e3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/ChatInputSettingAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic f2(Ll/z80;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p1, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->m1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public f3(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->q:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ll/dkb;->y9(Lcom/p1/mobile/putong/data/UserPrivacySettings;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/swe0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/swe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/twe0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/twe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->y1()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic g2(Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->a:Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget v0, Lcom/p1/mobile/putong/core/R$string;->mo:I

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->n1(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ljava/lang/CharSequence;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    move-result-object p0

    .line 109
    sget v0, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    goto :goto_0

    .line 116
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, Ljava/lang/String;

    .line 123
    .line 124
    :goto_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->m1(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_2
    check-cast v1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    sget v2, Lcom/p1/mobile/putong/core/R$string;->no:I

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->n1(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 144
    .line 145
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 148
    .line 149
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    check-cast v1, Ljava/lang/CharSequence;

    .line 154
    .line 155
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_3

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    goto :goto_1

    .line 172
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Ljava/lang/String;

    .line 179
    .line 180
    :goto_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/b;->m1(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->f:Ll/fmj;

    .line 184
    .line 185
    iget-wide v4, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 186
    .line 187
    iget-wide v6, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 188
    .line 189
    new-instance v8, Ll/rxe0;

    .line 190
    .line 191
    invoke-direct {v8, p0}, Ll/rxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 192
    .line 193
    .line 194
    new-instance v9, Ll/sxe0;

    .line 195
    .line 196
    invoke-direct {v9}, Ll/sxe0;-><init>()V

    .line 197
    .line 198
    .line 199
    move-object v3, p0

    .line 200
    invoke-virtual/range {v2 .. v9}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public g3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/kxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic h2(Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/settings/a;->y:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/z80;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/z80;->b()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget v1, Lcom/p1/mobile/putong/core/R$string;->lo:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p2}, Ll/z80;->b()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->m1(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ll/z80;->b()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    const-string p2, "location_longitude"

    .line 51
    .line 52
    const-string v0, "location_latitude"

    .line 53
    .line 54
    const-string v1, "has_city"

    .line 55
    .line 56
    const-string v2, "is_success"

    .line 57
    .line 58
    const-string v3, ""

    .line 59
    .line 60
    const-string v4, "e_setting_location_to_address"

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 77
    .line 78
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 87
    .line 88
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    filled-new-array {p0, v1, v0, p1}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v4, v3, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 115
    .line 116
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 125
    .line 126
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    filled-new-array {v2, p0, v0, p1}, [Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {v4, v3, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public h3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/nxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic i2(Lcom/p1/mobile/putong/location/Location;)V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->r:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v0, v0, [Ll/pf60;

    .line 6
    .line 7
    const-string v1, "e_setting_get_user_location_success"

    .line 8
    .line 9
    const-string v2, ""

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->f:Ll/fmj;

    .line 53
    .line 54
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 55
    .line 56
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 57
    .line 58
    new-instance v7, Ll/yxe0;

    .line 59
    .line 60
    invoke-direct {v7, p0, v0}, Ll/yxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;Lcom/p1/mobile/putong/data/DoublePair;)V

    .line 61
    .line 62
    .line 63
    new-instance v8, Ll/zxe0;

    .line 64
    .line 65
    invoke-direct {v8, v0}, Ll/zxe0;-><init>(Lcom/p1/mobile/putong/data/DoublePair;)V

    .line 66
    .line 67
    .line 68
    move-object v2, p0

    .line 69
    invoke-virtual/range {v1 .. v8}, Ll/fmj;->e(Ll/ner;DDLl/y20;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public i3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/ixe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ixe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public j3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/qwe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public k3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/ywe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ywe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic l2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/b;->o1(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Cc:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->p1(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public l3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/rwe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic m2(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->o:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->n0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->o:Z

    .line 14
    .line 15
    return-void
.end method

.method public m3()V
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
    const-string v1, "setting"

    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/privacy/PrivacySettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic n2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->o1(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/PushMsgSettingAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public o3()V
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
    const-string v1, "other_setting"

    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/privacyandpremisson/PrivacyAndPremissonAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic p2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->f1(Z)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public p3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v2, Lcom/p1/mobile/putong/core/ui/settings/privacyandpremisson/PrivacyAndPremissonAct;

    .line 12
    .line 13
    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public q3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/lxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic r2(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V
    .locals 1

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->c:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->d:Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->m0(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public r3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/oxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic s2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->F1(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/jxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public t3()V
    .locals 3

    .line 1
    const-string v0, "set_page"

    .line 2
    .line 3
    invoke-static {v0}, Ll/lve0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v2, "\u8bbe\u7f6e\u5c4f\u853d\u8bcd"

    .line 16
    .line 17
    invoke-static {p0, v2, v0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public u3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/gxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public v3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/xwe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic w2(ZLl/uxj0;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/data/User;->setBlackDiamondTag(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->A1()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public w3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/hxe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hxe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic x2(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const-string v0, "open"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string v0, "close"

    .line 37
    .line 38
    :goto_0
    const-string v1, "hide_time_status"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "e_hide_active_time_status"

    .line 49
    .line 50
    const-string v2, "p_settings_view"

    .line 51
    .line 52
    invoke-static {v1, v2, v0}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideActivityTime:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->f1(Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public x3()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->b:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    div-int/lit16 p0, p0, 0x3e8

    .line 15
    .line 16
    const-string v0, "max_distance"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "e_edit_distance_filter"

    .line 27
    .line 28
    const-string v1, "p_settings_view"

    .line 29
    .line 30
    invoke-static {v0, v1, p0}, Ll/sfj0;->g(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic y2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->Z0(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public y3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/pwe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic z2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/a;->e:Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->hideIcon:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Jp:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/ui/settings/b;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/b;->X()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public z3()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/zwe0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zwe0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
