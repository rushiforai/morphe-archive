.class public Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/r2a;
.implements Ll/d39;


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/FrameLayout;

.field public i:Ll/l4g0;

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/f59;",
            ">;"
        }
    .end annotation
.end field

.field public k:I

.field public l:Ll/g3a;

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z

.field public o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

.field public p:Ll/d3a;

.field public q:Ll/g6m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/g6m<",
            "Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;",
            "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
            ">;"
        }
    .end annotation
.end field

.field public r:I

.field public s:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_interested_user"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n:Z

    .line 35
    .line 36
    const/16 v0, 0x14

    .line 37
    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r:I

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->q2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n2(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m2(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->l2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->p2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o2(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic l2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l4g0;->c()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->g()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 30
    .line 31
    if-ne p1, v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l4g0;->e()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method private synthetic o2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->d()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private synthetic p2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/a3a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/a3a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->d:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    sget v1, Ll/dbc0;->P:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->d:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    const-string v0, "\u5bf9\u4f60\u611f\u5174\u8da3\u7684\u4eba"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public O(Ll/f59;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    const/4 v7, 0x0

    .line 51
    const-string v8, ""

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    const-string v5, "p_interested_user"

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    invoke-interface/range {v1 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Yn(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->g:Landroid/widget/TextView;

    .line 11
    .line 12
    const-string v0, "\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n:Z

    .line 19
    .line 20
    return-void
.end method

.method public c(ILjava/util/List;Lcom/p1/mobile/putong/data/Links;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/f59;",
            ">;",
            "Lcom/p1/mobile/putong/data/Links;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->s2(I)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 36
    .line 37
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->p:Ll/d3a;

    .line 46
    .line 47
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p2, p3}, Ll/d3a;->n(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->k:I

    .line 53
    .line 54
    return-void
.end method

.method public d(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 11

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 9
    .line 10
    :goto_0
    move-object v3, v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    if-nez v3, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 20
    .line 21
    if-ne p2, v0, :cond_2

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v8, 0x6

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 38
    .line 39
    if-ne p2, v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {v3}, Ll/f59;->a()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ne v0, v8, :cond_3

    .line 46
    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->s:I

    .line 48
    .line 49
    if-gtz v0, :cond_3

    .line 50
    .line 51
    const-string p0, "\u5c0f\u7ea2\u82b1\u4f59\u989d\u4e0d\u8db3"

    .line 52
    .line 53
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    .line 57
    .line 58
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->M(Ll/f59;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 65
    .line 66
    const/4 v9, 0x5

    .line 67
    if-ne p2, v0, :cond_4

    .line 68
    .line 69
    invoke-virtual {v3}, Ll/f59;->a()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-ne v1, v9, :cond_4

    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r:I

    .line 76
    .line 77
    if-gtz v1, :cond_4

    .line 78
    .line 79
    const-string p0, "\u4eca\u65e5\u793c\u8c8c\u56de\u8c22\u5df2\u8fbe\u4e0a\u9650"

    .line 80
    .line 81
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->q:Ll/g6m;

    .line 88
    .line 89
    if-nez v1, :cond_5

    .line 90
    .line 91
    new-instance v1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;

    .line 92
    .line 93
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->q:Ll/g6m;

    .line 97
    .line 98
    :cond_5
    iget-object v10, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->q:Ll/g6m;

    .line 99
    .line 100
    new-instance v1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    move-object v7, p0

    .line 107
    move-object v4, p1

    .line 108
    move-object v5, p2

    .line 109
    move v6, p3

    .line 110
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;-><init>(Lcom/p1/mobile/android/app/Act;Ll/f59;Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZLl/d39;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v10, v1}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 118
    .line 119
    sget-object p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 120
    .line 121
    if-ne p0, p1, :cond_9

    .line 122
    .line 123
    if-ne v5, v0, :cond_7

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_6

    .line 134
    .line 135
    invoke-virtual {v3}, Ll/f59;->a()I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-ne p1, v8, :cond_6

    .line 140
    .line 141
    iget p1, v7, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->s:I

    .line 142
    .line 143
    add-int/lit8 p1, p1, -0x1

    .line 144
    .line 145
    iput p1, v7, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->s:I

    .line 146
    .line 147
    if-nez p1, :cond_7

    .line 148
    .line 149
    new-instance p1, Ll/u2a;

    .line 150
    .line 151
    invoke-direct {p1, v7}, Ll/u2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 152
    .line 153
    .line 154
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_6
    invoke-virtual {v3}, Ll/f59;->a()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-ne p1, v9, :cond_7

    .line 163
    .line 164
    iget p1, v7, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r:I

    .line 165
    .line 166
    add-int/lit8 p1, p1, -0x1

    .line 167
    .line 168
    iput p1, v7, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r:I

    .line 169
    .line 170
    :cond_7
    :goto_2
    new-instance p1, Ll/pf60;

    .line 171
    .line 172
    if-ne v5, v0, :cond_8

    .line 173
    .line 174
    const-string p2, "like"

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_8
    const-string p2, "dislike"

    .line 178
    .line 179
    :goto_3
    const-string p3, "actionname"

    .line 180
    .line 181
    invoke-direct {p1, p3, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    filled-new-array {p1}, [Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    const-string p2, "e_swipeaction"

    .line 189
    .line 190
    const-string p3, "p_interested_user"

    .line 191
    .line 192
    invoke-static {p2, p3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 193
    .line 194
    .line 195
    :cond_9
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public e(Ll/f59;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public finish()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/f59;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v3, v2, Ll/f59;->a:Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    const/4 v4, 0x3

    .line 34
    if-ge v3, v4, :cond_0

    .line 35
    .line 36
    iget-object v2, v2, Ll/f59;->a:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance v1, Landroid/content/Intent;

    .line 47
    .line 48
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 49
    .line 50
    .line 51
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->k:I

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m:Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    sub-int/2addr v2, v3

    .line 60
    const-string v3, "interested_users_counter"

    .line 61
    .line 62
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    new-instance v2, Landroid/os/Bundle;

    .line 66
    .line 67
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v3, "interested_users_front_part"

    .line 71
    .line 72
    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "interested_users_removed"

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 80
    .line 81
    .line 82
    const-string v0, "interested_users_counter_bundle"

    .line 83
    .line 84
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    const/4 v2, -0x1

    .line 90
    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 91
    .line 92
    .line 93
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/b3a;->b(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i2()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->w5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/w2a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/w2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/x2a;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/x2a;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/y2a;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/y2a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/z2a;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/z2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->k2()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r2()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/v2a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/v2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->j0:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/s2a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/s2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/t2a;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/t2a;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final k2()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;-><init>(Landroid/content/Context;Ll/r2a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->h:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 24
    .line 25
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v4, -0x1

    .line 28
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/d3a;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 37
    .line 38
    invoke-direct {v0, p0, p0, v1}, Ll/d3a;-><init>(Lcom/p1/mobile/android/app/Act;Ll/r2a;Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->p:Ll/d3a;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->setAdapter(Ll/nx2;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public m0(Ll/f59;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->u2(Ll/f59;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m2(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->r:I

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n2(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->s:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->p:Ll/d3a;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_interested_user"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic q2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->p:Ll/d3a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nx2;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r0(Ll/f59;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->o:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final r2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i2()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g3a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p0}, Ll/g3a;-><init>(Ll/r2a;Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->l:Ll/g3a;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/g3a;->d()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f59;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->k:I

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->m:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 p3, 0x1

    .line 21
    if-le p1, p2, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 p2, 0x2

    .line 38
    if-lt p1, p2, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/f59;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->u2(Ll/f59;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 53
    .line 54
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 61
    .line 62
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->j:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-lez p1, :cond_2

    .line 72
    .line 73
    const/4 p2, 0x4

    .line 74
    if-gt p1, p2, :cond_2

    .line 75
    .line 76
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n:Z

    .line 77
    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->l:Ll/g3a;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/g3a;->b()V

    .line 83
    .line 84
    .line 85
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->n:Z

    .line 86
    .line 87
    :cond_2
    return-void
.end method

.method public s2(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "user_num"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->i:Ll/l4g0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public u2(Ll/f59;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "moment_swipe"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "respond_match"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 30
    .line 31
    :goto_0
    const-string v1, "notes_type"

    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-string v2, "card_user_id"

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {p0, v1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string v1, "e_interested_user_card"

    .line 54
    .line 55
    const-string v3, "p_interested_user"

    .line 56
    .line 57
    invoke-static {v1, v3, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    filled-new-array {p0}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v0, "e_respond_match"

    .line 89
    .line 90
    invoke-static {v0, v3, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 101
    .line 102
    const-string v0, "like"

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_3

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_3

    .line 119
    .line 120
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 125
    .line 126
    const-string v0, "moments_user_id"

    .line 127
    .line 128
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    filled-new-array {p0}, [Ll/pf60;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    const-string v0, "e_polite_gratitude"

    .line 137
    .line 138
    invoke-static {v0, v3, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_3
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    filled-new-array {p0}, [Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    const-string v0, "e_follow"

    .line 157
    .line 158
    invoke-static {v0, v3, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 159
    .line 160
    .line 161
    :goto_1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    filled-new-array {p0}, [Ll/pf60;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    const-string p1, "e_interested_user_card_close"

    .line 176
    .line 177
    invoke-static {p1, v3, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    return-void
.end method

.method public v0(FFF)V
    .locals 2

    .line 1
    const/4 p3, 0x0

    .line 2
    cmpl-float p2, p2, p3

    .line 3
    .line 4
    if-gtz p2, :cond_0

    .line 5
    .line 6
    cmpl-float v0, p1, p3

    .line 7
    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    if-nez p2, :cond_2

    .line 25
    .line 26
    cmpl-float p1, p1, p3

    .line 27
    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleTraceAct;->e:Landroid/widget/RelativeLayout;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method
