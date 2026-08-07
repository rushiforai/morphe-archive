.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/k6c;
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/lrl;


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Landroidx/viewpager/widget/ViewPager;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/TextView;

.field public h:Ll/l4g0;

.field public i:Ll/x1m;

.field public j:Ll/ojh;

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/mah;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:I

.field public n:Ll/e320;

.field public o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:I

.field public r:Z

.field public s:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


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
    const-class v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->o:Ljava/util/ArrayList;

    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->q:I

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r:Z

    .line 38
    .line 39
    new-instance v0, Ll/cjh;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/cjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->s:Ll/y20;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->q2(Ll/mah;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->m2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Z1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b2(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->p2(Ll/mah;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->o2(Ll/mah;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic e2(Ll/y20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->n2(Ljava/lang/Integer;)V

    return-void
.end method

.method private synthetic m2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/l4g0;->e()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method private w2()V
    .locals 1

    .line 1
    new-instance v0, Ll/e320;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/e320;-><init>(Ll/k6c;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->n:Ll/e320;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/e320;->g()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public A2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public final B2()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->t0:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_3

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_3

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 26
    .line 27
    invoke-interface {v1}, Ll/x1m;->c()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/lit8 v1, v1, -0x1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-lt v1, v2, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 61
    .line 62
    invoke-interface {v4}, Ll/x1m;->c()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    add-int/lit8 v4, v4, -0x1

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Ll/mah;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    new-instance v1, Ll/ejh;

    .line 89
    .line 90
    invoke-direct {v1, p0, v3}, Ll/ejh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;)V

    .line 91
    .line 92
    .line 93
    const-wide/16 v2, 0xc8

    .line 94
    .line 95
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 96
    .line 97
    .line 98
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    return-void
.end method

.method public U(Ll/mah;)V
    .locals 2

    .line 1
    new-instance v0, Ll/jjh;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/jjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/kjh;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/kjh;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->y2(Ll/mah;Ll/y20;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->e:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->g:Landroid/widget/TextView;

    .line 11
    .line 12
    const-string v1, "\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r:Z

    .line 18
    .line 19
    return-void
.end method

.method public c(ILjava/util/List;Lcom/p1/mobile/putong/data/Links;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/mah;",
            ">;",
            "Lcom/p1/mobile/putong/data/Links;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->z2(I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->s2()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 26
    .line 27
    invoke-interface {p0, v1, v1}, Ll/x1m;->a(II)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k2()V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move v0, p3

    .line 37
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 50
    .line 51
    invoke-interface {p2, p1, v1}, Ll/x1m;->a(II)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->j:Ll/ojh;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {p2, v1}, Ll/ojh;->s(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->l:I

    .line 62
    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->onPageSelected(I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    :goto_1
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public finish()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x3

    .line 13
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v1, v3, v2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ll/mah;

    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    iget-object v2, v2, Ll/mah;->a:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    new-instance v1, Landroid/content/Intent;

    .line 51
    .line 52
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 53
    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->n:Ljava/lang/String;

    .line 56
    .line 57
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->l:I

    .line 58
    .line 59
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    new-instance v2, Landroid/os/Bundle;

    .line 63
    .line 64
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 65
    .line 66
    .line 67
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->l:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->m:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->o:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 77
    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->o:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    const/4 v2, -0x1

    .line 87
    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 88
    .line 89
    .line 90
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ljh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int/2addr v0, p1

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x4

    .line 11
    if-ge v0, p1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r:Z

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->n:Ll/e320;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/e320;->f()V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r:Z

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->w2()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->l2()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/djh;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/djh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-object p1
.end method

.method public final k2()V
    .locals 1

    .line 1
    new-instance v0, Ll/ojh;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/ojh;-><init>(Lcom/p1/mobile/android/app/Act;Ll/lrl;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->j:Ll/ojh;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->d:Landroidx/viewpager/widget/ViewPager;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final l2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->d:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->d:Landroidx/viewpager/widget/ViewPager;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/njh;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->c:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-direct {v0, v1, p0}, Ll/njh;-><init>(Lv/navigationbar/VNavigationBar;Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 20
    .line 21
    return-void
.end method

.method public final synthetic n2(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->v2(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o2(Ll/mah;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->u2(Ll/mah;Z)V

    .line 3
    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->y2(Ll/mah;Ll/y20;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->q:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->m:I

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ll/ovl;->b(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i2(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/mah;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "moment_swipe"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const-string v0, "respond_match"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/mah;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 63
    .line 64
    :goto_0
    const-string v2, "notes_type"

    .line 65
    .line 66
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ll/mah;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    const-string v3, "card_user_id"

    .line 85
    .line 86
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v2, "e_interested_user_card"

    .line 95
    .line 96
    const-string v4, "p_interested_user"

    .line 97
    .line 98
    invoke-static {v2, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ll/mah;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 122
    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Ll/mah;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    filled-new-array {v0}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "e_respond_match"

    .line 146
    .line 147
    invoke-static {v1, v4, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_2
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Ll/mah;

    .line 156
    .line 157
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 164
    .line 165
    const-string v1, "like"

    .line 166
    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_3

    .line 172
    .line 173
    invoke-static {}, Ll/cmg;->K()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_3

    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 180
    .line 181
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    check-cast v0, Ll/mah;

    .line 186
    .line 187
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 192
    .line 193
    const-string v1, "moments_user_id"

    .line 194
    .line 195
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    filled-new-array {v0}, [Ll/pf60;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v1, "e_polite_gratitude"

    .line 204
    .line 205
    invoke-static {v1, v4, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 210
    .line 211
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    check-cast v0, Ll/mah;

    .line 216
    .line 217
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    filled-new-array {v0}, [Ll/pf60;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const-string v1, "e_follow"

    .line 232
    .line 233
    invoke-static {v1, v4, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 234
    .line 235
    .line 236
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Ll/mah;

    .line 243
    .line 244
    invoke-virtual {v0}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 249
    .line 250
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    filled-new-array {v0}, [Ll/pf60;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    const-string v1, "e_interested_user_card_close"

    .line 259
    .line 260
    invoke-static {v1, v4, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 261
    .line 262
    .line 263
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->q:I

    .line 264
    .line 265
    :cond_4
    :goto_2
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->B2()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p2(Ll/mah;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->u2(Ll/mah;Z)V

    .line 3
    .line 4
    .line 5
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

.method public q0(Ll/mah;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->u2(Ll/mah;Z)V

    .line 5
    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->y2(Ll/mah;Ll/y20;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 27
    .line 28
    const-string v2, "default"

    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 39
    .line 40
    const-string v2, "followed"

    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 51
    .line 52
    const-string v2, "unknown_"

    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    :cond_1
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 63
    .line 64
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 65
    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 69
    .line 70
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v1, v2, p2, v0}, Ll/jka;->f7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Z)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    new-instance v0, Ll/hjh;

    .line 93
    .line 94
    invoke-direct {v0, p0, p1}, Ll/hjh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Ll/mah;)V

    .line 95
    .line 96
    .line 97
    new-instance p0, Ll/ijh;

    .line 98
    .line 99
    invoke-direct {p0}, Ll/ijh;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public final synthetic q2(Ll/mah;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->y2(Ll/mah;Ll/y20;Ll/y20;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->u2(Ll/mah;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->n:Ll/e320;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/e320;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->s2()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->n:Ll/e320;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/e320;->f()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->e:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, "\u6ca1\u6709\u66f4\u591a\u4e86\uff0c\u5148\u53bb\u5192\u4e2a\u6ce1\u8ba9\u66f4\u591a\u7684\u4eba\u770b\u5230\u4f60\u5427"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    invoke-interface {p0, v0, v0}, Ll/x1m;->a(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final u2(Ll/mah;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->j:Ll/ojh;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->s:Ll/y20;

    .line 12
    .line 13
    invoke-virtual {v0, p2, v1}, Ll/ojh;->q(ILl/y20;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->s:Ll/y20;

    .line 24
    .line 25
    invoke-virtual {v0, p2, v1}, Ll/ojh;->r(ILl/y20;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->i:Ll/x1m;

    .line 29
    .line 30
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->l:I

    .line 31
    .line 32
    add-int/lit8 v0, v0, -0x1

    .line 33
    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->l:I

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    invoke-interface {p2, v0, v1}, Ll/x1m;->d(II)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->o:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object p1, p1, Ll/mah;->a:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public v2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->j:Ll/ojh;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/ojh;->s(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->k:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->r2()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public y2(Ll/mah;Ll/y20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mah;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/jka;->T6(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/fjh;

    .line 18
    .line 19
    invoke-direct {p1, p2}, Ll/fjh;-><init>(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    new-instance p2, Ll/gjh;

    .line 23
    .line 24
    invoke-direct {p2, p3}, Ll/gjh;-><init>(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public z2(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "user_num"

    .line 4
    .line 5
    invoke-static {v1, p1}, Ll/tfj0$a;->f(Ljava/lang/String;I)Ll/tfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/tfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/tfj0;->a([Ll/tfj0$a;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->h:Ll/l4g0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
