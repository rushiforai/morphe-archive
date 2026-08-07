.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/w2c0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;,
        Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;
    }
.end annotation


# static fields
.field public static A:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public static B:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Lv/navigationbar/VNavigationBar;

.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VImage;

.field public i:Lv/VRelative;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public n:Ll/jxd0;

.field public o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field

.field public q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public s:Landroid/view/View;

.field public t:Lv/navigationbar/VNavigationTabLayout;

.field public u:Landroid/view/View;

.field public v:Ljava/lang/String;

.field public w:[Landroid/widget/TextView;

.field public x:I

.field public y:Z

.field public final z:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "HASSHOWSTATEPAGEACTPOSTTVGUIDEBUBBLE"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->n:Ll/jxd0;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 37
    .line 38
    new-instance v0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r:Ljava/util/List;

    .line 44
    .line 45
    const/4 v0, 0x2

    .line 46
    new-array v0, v0, [Landroid/widget/TextView;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->w:[Landroid/widget/TextView;

    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->z:Ljava/lang/Runnable;

    .line 56
    .line 57
    return-void
.end method

.method private synthetic A2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "stateSquare"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    xor-int/2addr v0, v1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic B2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->M2(Lv/VLinear;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic D2(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->z:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "e_meet_back"

    .line 11
    .line 12
    const-string v0, "p_meet_greet"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static I2(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/l4i;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l4i;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
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

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->D2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B2()V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->F2(Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->E2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->C2(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic e2(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->z2(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic h2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->u:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic i2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    return-object p0
.end method

.method public static bridge synthetic k2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)[Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->w:[Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic l2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic m2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    return-void
.end method

.method public static bridge synthetic n2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->p:Ljava/util/List;

    return-void
.end method

.method private p2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->F0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->F0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "stateId"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "userId"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "needAppendFeed"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "from"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method private r()V
    .locals 11

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->p2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->e:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->g2:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 34
    .line 35
    sget v1, Ll/lbc0;->I3:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r:Ljava/util/List;

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 43
    .line 44
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->O0:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r:Ljava/util/List;

    .line 54
    .line 55
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 56
    .line 57
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->f3:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const-string v2, "initialShowIndex"

    .line 76
    .line 77
    const/4 v3, 0x0

    .line 78
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const-string v2, "stateId"

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const-string v2, "next"

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v2, "needAppendFeed"

    .line 107
    .line 108
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 109
    .line 110
    .line 111
    move-result v7

    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const-string v2, "userId"

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, "from"

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v9

    .line 132
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    const-string v10, "stateSquare"

    .line 137
    .line 138
    invoke-virtual {v1, v10, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 139
    .line 140
    .line 141
    move-result v10

    .line 142
    invoke-static/range {v4 .. v10}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->S4(ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    const-string v5, "bubbleInfo"

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    check-cast v4, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 157
    .line 158
    invoke-static {}, Ll/cmg;->k0()Z

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    if-eqz v5, :cond_0

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    invoke-virtual {v5, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-static {v4, v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->y5(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 177
    .line 178
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    invoke-virtual {v6, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    sget v6, Ll/tec0;->z:I

    .line 195
    .line 196
    invoke-interface {v5, v2, v4, v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->i7(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;I)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    :goto_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 207
    .line 208
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;->k(Ljava/util/List;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 221
    .line 222
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->e:Lv/navigationbar/VNavigationBar;

    .line 226
    .line 227
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    sget v2, Ll/k9c0;->p0:I

    .line 236
    .line 237
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->e:Lv/navigationbar/VNavigationBar;

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setupViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->e:Lv/navigationbar/VNavigationBar;

    .line 252
    .line 253
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getTabLayout()Lv/navigationbar/VNavigationTabLayout;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 258
    .line 259
    if-eqz v0, :cond_1

    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    sget v2, Ll/k9c0;->p0:I

    .line 270
    .line 271
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 276
    .line 277
    .line 278
    :cond_1
    invoke-static {}, Ll/cmg;->t0()Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    if-eqz v0, :cond_2

    .line 283
    .line 284
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    sget v1, Ll/tec0;->t3:I

    .line 289
    .line 290
    const/4 v2, 0x0

    .line 291
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->u:Landroid/view/View;

    .line 296
    .line 297
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->e:Lv/navigationbar/VNavigationBar;

    .line 298
    .line 299
    filled-new-array {v0}, [Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 304
    .line 305
    .line 306
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->u:Landroid/view/View;

    .line 307
    .line 308
    new-instance v1, Ll/f4i;

    .line 309
    .line 310
    invoke-direct {v1, p0}, Ll/f4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 311
    .line 312
    .line 313
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 314
    .line 315
    .line 316
    :cond_2
    move v0, v3

    .line 317
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 318
    .line 319
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1}, Lv/navigationbar/VNavigationTabLayout;->getTabCount()I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    if-ge v0, v1, :cond_4

    .line 327
    .line 328
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 329
    .line 330
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;->j(I)Landroid/view/View;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 335
    .line 336
    invoke-virtual {v2, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v2, v1}, Lv/navigationbar/VNavigationTabLayout$f;->n(Landroid/view/View;)Lv/navigationbar/VNavigationTabLayout$f;

    .line 344
    .line 345
    .line 346
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 347
    .line 348
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    iget-object v1, v1, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 356
    .line 357
    if-nez v0, :cond_3

    .line 358
    .line 359
    const/high16 v2, 0x40800000    # 4.0f

    .line 360
    .line 361
    :goto_2
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 362
    .line 363
    .line 364
    move-result v2

    .line 365
    goto :goto_3

    .line 366
    :cond_3
    const/high16 v2, 0x40c00000    # 6.0f

    .line 367
    .line 368
    goto :goto_2

    .line 369
    :goto_3
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 370
    .line 371
    invoke-virtual {v4, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 372
    .line 373
    .line 374
    move-result-object v4

    .line 375
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    iget-object v4, v4, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 379
    .line 380
    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    .line 381
    .line 382
    .line 383
    move-result v4

    .line 384
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 385
    .line 386
    invoke-virtual {v5, v0}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 387
    .line 388
    .line 389
    move-result-object v5

    .line 390
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    iget-object v5, v5, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 394
    .line 395
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    .line 396
    .line 397
    .line 398
    move-result v5

    .line 399
    invoke-virtual {v1, v2, v4, v3, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 400
    .line 401
    .line 402
    add-int/lit8 v0, v0, 0x1

    .line 403
    .line 404
    goto :goto_1

    .line 405
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->t:Lv/navigationbar/VNavigationTabLayout;

    .line 406
    .line 407
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;

    .line 408
    .line 409
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout;->setOnTabSelectedListener(Lv/navigationbar/VNavigationTabLayout$d;)V

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 416
    .line 417
    invoke-virtual {v0, v3}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 421
    .line 422
    new-instance v1, Ll/g4i;

    .line 423
    .line 424
    invoke-direct {v1, p0}, Ll/g4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 425
    .line 426
    .line 427
    const-wide/16 v2, 0xc8

    .line 428
    .line 429
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 430
    .line 431
    .line 432
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 433
    .line 434
    invoke-virtual {v0}, Ll/jka;->K7()Lrx/subjects/a;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    new-instance v1, Ll/h4i;

    .line 443
    .line 444
    invoke-direct {v1, p0}, Ll/h4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 445
    .line 446
    .line 447
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 452
    .line 453
    .line 454
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->h:Lv/VImage;

    .line 455
    .line 456
    new-instance v1, Ll/i4i;

    .line 457
    .line 458
    invoke-direct {v1, p0}, Ll/i4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 459
    .line 460
    .line 461
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 462
    .line 463
    .line 464
    invoke-static {}, Ll/cmg;->k0()Z

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    if-eqz v0, :cond_5

    .line 469
    .line 470
    sget-object v0, Ll/jka;->M1:Lrx/subjects/b;

    .line 471
    .line 472
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    new-instance v1, Ll/j4i;

    .line 477
    .line 478
    invoke-direct {v1, p0}, Ll/j4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 479
    .line 480
    .line 481
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 482
    .line 483
    .line 484
    move-result-object p0

    .line 485
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 486
    .line 487
    .line 488
    :cond_5
    return-void
.end method

.method public static r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "initialShowIndex"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "next"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "from"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->I2(Ljava/util/List;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static s2(Landroid/content/Context;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "stateSquare"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "bubbleInfo"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "from"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static showView(Landroid/view/View;)V
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    .line 6
    .line 7
    const/4 v8, 0x1

    .line 8
    const/4 v9, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v6, 0x1

    .line 14
    const/high16 v7, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-direct/range {v1 .. v9}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v2, 0x12c

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic z2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->z5()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public C()Landroid/animation/Animator;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic C2(Ljava/util/Map;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->H2(Lcom/p1/mobile/putong/data/BubbleInfo;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v1}, [Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 41
    .line 42
    const/high16 v2, 0x40800000    # 4.0f

    .line 43
    .line 44
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->d:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getRightIconContainer()Lv/VLinear;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/high16 v2, 0x42080000    # 34.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    if-nez p1, :cond_0

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    new-instance v0, Ll/k4i;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/k4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 86
    .line 87
    .line 88
    const-wide/16 v1, 0x320

    .line 89
    .line 90
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 91
    .line 92
    .line 93
    :cond_0
    return-void
.end method

.method public E()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E2(Ljava/lang/Boolean;)V
    .locals 8

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
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y:Z

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 13
    .line 14
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    new-array v7, p1, [F

    .line 19
    .line 20
    fill-array-data v7, :array_0

    .line 21
    .line 22
    .line 23
    const-string v1, "alpha"

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    const-wide/16 v4, 0x64

    .line 28
    .line 29
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$a;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void

    .line 45
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic F2(Lcom/p1/mobile/putong/data/BubbleInfo;Landroid/view/View;)V
    .locals 7

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 2
    .line 3
    const-string v0, "p_state_explore"

    .line 4
    .line 5
    const-string v1, "p_other_state"

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    move-object v2, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v1

    .line 12
    :goto_0
    if-nez p2, :cond_1

    .line 13
    .line 14
    move-object p2, v0

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move-object p2, v1

    .line 17
    :goto_1
    const-string v3, "source_page"

    .line 18
    .line 19
    invoke-static {v3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v3, ""

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    move-object v4, v3

    .line 28
    goto :goto_2

    .line 29
    :cond_2
    iget-object v4, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 30
    .line 31
    :goto_2
    const-string v5, "state_id"

    .line 32
    .line 33
    invoke-static {v5, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    if-nez p1, :cond_3

    .line 38
    .line 39
    move-object v5, v3

    .line 40
    goto :goto_3

    .line 41
    :cond_3
    iget-object v5, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 42
    .line 43
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 44
    .line 45
    :goto_3
    const-string v6, "owner_id"

    .line 46
    .line 47
    invoke-static {v6, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    filled-new-array {p2, v4, v5}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string v4, "e_set_my_state"

    .line 56
    .line 57
    invoke-static {v4, v2, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    if-nez p1, :cond_6

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 63
    .line 64
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 73
    .line 74
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 75
    .line 76
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_4

    .line 85
    .line 86
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 87
    .line 88
    iget-object p1, p1, Ll/ms8;->H:Lrx/subjects/a;

    .line 89
    .line 90
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/data/KanPostData;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 97
    .line 98
    const-string p2, "start"

    .line 99
    .line 100
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    const-string p0, "\u72b6\u6001\u53d1\u5e03\u4e2d..."

    .line 107
    .line 108
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_4
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 113
    .line 114
    if-nez p1, :cond_5

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    move-object v0, v1

    .line 118
    :goto_4
    invoke-static {p0, v0}, Ll/h3i;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_6
    new-instance p2, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 131
    .line 132
    const/4 v0, 0x1

    .line 133
    if-ne p1, v0, :cond_7

    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_7
    const-string v1, "p_my_state"

    .line 137
    .line 138
    :goto_5
    const/4 p1, 0x0

    .line 139
    invoke-static {p0, p2, p1, v3, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r2(Landroid/content/Context;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final H2(Lcom/p1/mobile/putong/data/BubbleInfo;)Landroid/view/View;
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 2
    .line 3
    const-string v1, "p_other_state"

    .line 4
    .line 5
    const-string v2, "p_state_explore"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    move-object v3, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v3, v1

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    move-object v1, v2

    .line 15
    :cond_1
    const-string v0, "source_page"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, ""

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    move-object v2, v1

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 28
    .line 29
    :goto_1
    const-string v4, "state_id"

    .line 30
    .line 31
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    goto :goto_2

    .line 38
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 41
    .line 42
    :goto_2
    const-string v4, "owner_id"

    .line 43
    .line 44
    invoke-static {v4, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {v0, v2, v1}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "e_set_my_state"

    .line 53
    .line 54
    invoke-static {v1, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v1, Ll/tec0;->H2:I

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v1, Ll/hdc0;->C1:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lv/VLinear;

    .line 75
    .line 76
    sget v2, Ll/hdc0;->L1:I

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lv/VDraweeView;

    .line 83
    .line 84
    sget v3, Ll/hdc0;->K1:I

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lv/VText;

    .line 91
    .line 92
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    const/4 v5, 0x1

    .line 97
    if-eqz v4, :cond_4

    .line 98
    .line 99
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 100
    .line 101
    .line 102
    :cond_4
    const/4 v4, 0x0

    .line 103
    if-eqz p1, :cond_5

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    move v5, v4

    .line 107
    :goto_3
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    const/high16 v5, 0x41500000    # 13.0f

    .line 111
    .line 112
    if-nez p1, :cond_6

    .line 113
    .line 114
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    invoke-virtual {v1, v6, v4, v7, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 123
    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_6
    const/high16 v6, 0x41200000    # 10.0f

    .line 127
    .line 128
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    const/high16 v7, 0x41400000    # 12.0f

    .line 133
    .line 134
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    invoke-virtual {v1, v6, v4, v7, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 139
    .line 140
    .line 141
    :goto_4
    if-nez p1, :cond_7

    .line 142
    .line 143
    sget v4, Ll/lbc0;->q5:I

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_7
    sget v4, Ll/lbc0;->r5:I

    .line 147
    .line 148
    :goto_5
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    if-nez p1, :cond_8

    .line 152
    .line 153
    const-string v1, "#ffffff"

    .line 154
    .line 155
    :goto_6
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_7

    .line 160
    :cond_8
    const-string v1, "#1a1a1b"

    .line 161
    .line 162
    goto :goto_6

    .line 163
    :goto_7
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 164
    .line 165
    .line 166
    if-nez p1, :cond_9

    .line 167
    .line 168
    const/high16 v5, 0x41600000    # 14.0f

    .line 169
    .line 170
    :cond_9
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 171
    .line 172
    .line 173
    if-eqz p1, :cond_a

    .line 174
    .line 175
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 176
    .line 177
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 178
    .line 179
    goto :goto_8

    .line 180
    :cond_a
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 181
    .line 182
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->f2:I

    .line 183
    .line 184
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    :goto_8
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    .line 190
    .line 191
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_b

    .line 196
    .line 197
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 198
    .line 199
    iget-object v3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 200
    .line 201
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 202
    .line 203
    sget v4, Ll/qa00;->q:I

    .line 204
    .line 205
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 206
    .line 207
    .line 208
    :cond_b
    new-instance v1, Ll/n4i;

    .line 209
    .line 210
    invoke-direct {v1, p0, p1}, Ll/n4i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 211
    .line 212
    .line 213
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 214
    .line 215
    .line 216
    return-object v0
.end method

.method public K2()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    new-instance v1, Ll/m4i;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/m4i;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->showView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->L2()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->m:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$b;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V

    .line 32
    .line 33
    .line 34
    const-string v3, "feed_state_meet.svga"

    .line 35
    .line 36
    const/4 v4, -0x1

    .line 37
    invoke-virtual {v1, v3, v4, v2, v0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->z:Ljava/lang/Runnable;

    .line 41
    .line 42
    const-wide/16 v1, 0x708

    .line 43
    .line 44
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public L2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 7
    .line 8
    const-string v1, "p_meet_greet"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final M2(Lv/VLinear;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->n:Ll/jxd0;

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
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 26
    .line 27
    sget v2, Ll/bnl0;->e:I

    .line 28
    .line 29
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    const-string v1, "\u5206\u4eab\u72b6\u6001\uff0c\u8ba9\u66f4\u591a\u4eba\u770b\u5230\u4f60"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    sget v1, Ll/qa00;->m:I

    .line 41
    .line 42
    const/high16 v2, 0x41200000    # 10.0f

    .line 43
    .line 44
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 53
    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    const/4 v2, 0x1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-direct {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sget v3, Ll/k9c0;->n:I

    .line 103
    .line 104
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    filled-new-array {v1}, [I

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/high16 v1, 0x41500000    # 13.0f

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-wide/16 v3, 0x1388

    .line 123
    .line 124
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    sget v1, Ll/qa00;->j:I

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1, v0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v:Ljava/lang/String;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->n:Ll/jxd0;

    .line 155
    .line 156
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    .line 1
    invoke-static {}, Ll/cmg;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Landroidx/fragment/app/FragmentManager;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->q:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$d;

    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s:Landroid/view/View;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->r()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s:Landroid/view/View;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const p2, 0x1020002

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-nez p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v0, "initialShowIndex"

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v0, "stateId"

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string v0, "next"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const-string v0, "needAppendFeed"

    .line 87
    .line 88
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-string v0, "userId"

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    const-string v0, "from"

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string v0, "stateSquare"

    .line 117
    .line 118
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 119
    .line 120
    .line 121
    move-result v8

    .line 122
    invoke-static/range {v2 .. v8}, Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;->S4(ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/status/aquare/FeedStatusListTabFrag;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, p2, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 150
    .line 151
    .line 152
    :cond_1
    const/4 p0, 0x0

    .line 153
    return-object p0
.end method

.method public o2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/r4i;->b(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2766

    .line 5
    .line 6
    if-ne p1, v0, :cond_1

    .line 7
    .line 8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/16 p1, 0x2767

    .line 25
    .line 26
    if-ne p2, p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 37
    .line 38
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "type"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const-string v2, "id"

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "uid"

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->s6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    const/16 p1, 0x2768

    .line 72
    .line 73
    if-ne p2, p1, :cond_1

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 76
    .line 77
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 84
    .line 85
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const-string p2, "code"

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->t6(I)V

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->z:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "e_meet_back"

    .line 11
    .line 12
    const-string v1, "p_meet_greet"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v2()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onDialogAttachToWindow(Landroid/app/Dialog;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onDialogAttachToWindow(Landroid/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance p1, Ll/pf60;

    .line 11
    .line 12
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-direct {p1, v0, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onDialogDetachFromWindow(Landroid/app/Dialog;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Act;->onDialogDetachFromWindow(Landroid/app/Dialog;)V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->x:I

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance p1, Ll/pf60;

    .line 11
    .line 12
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 13
    .line 14
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onPauseLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onPauseLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->w2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTransparentStatusBar()V
    .locals 2

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/high16 v1, -0x80000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/high16 v1, 0x4000000

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public stop()V
    .locals 0

    return-void
.end method

.method public u2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "p_meet_greet"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->o:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStatusSquareTabFrag;->x6()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->y:Z

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->u2()V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->m:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/SVGAImageView;->stopAnimation()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    const/high16 v0, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    return-void
.end method

.method public w2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->v:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public y2()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->A:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_0
    return v0
.end method
