.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;
.super Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/ImageView;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/feed/newui/camera/a;

.field public h:I

.field public i:Ljava/lang/String;

.field public final j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "hot"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->j:Lrx/subjects/a;

    .line 13
    .line 14
    return-void
.end method

.method private synthetic A2(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "hot"

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

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
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 23
    :goto_1
    sget-object v2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 24
    .line 25
    if-ne p1, v2, :cond_2

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/api/a;->h2(Ljava/lang/String;)Lrx/subjects/a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->e0(Ljava/util/List;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 48
    .line 49
    if-ne p1, v0, :cond_3

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->N()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/l120;->d()J

    .line 57
    .line 58
    .line 59
    move-result-wide p0

    .line 60
    invoke-static {p0, p1}, Ll/l120;->o(J)Z

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method private synthetic B2(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->e:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/a;->W(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic C2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->e:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private I2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jka;->Pb()Ll/jfh;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, p0}, Ll/jfh;->n(Lcom/p1/mobile/android/app/Act;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->F2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/l120;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/l120;->o(J)Z

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/l120;->h()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/lwv;->k()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/lwv;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->u2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->v2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->w2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->s2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->A2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->E2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->C2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->z2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->B2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->D2(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->y2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method private synthetic v2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic D2(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 1

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-nez p4, :cond_3

    .line 8
    .line 9
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "hot"

    .line 12
    .line 13
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 29
    .line 30
    const-string p1, "fav"

    .line 31
    .line 32
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-object p3

    .line 40
    :cond_2
    :goto_0
    return-object p2

    .line 41
    :cond_3
    :goto_1
    return-object p1
.end method

.method public final synthetic E2(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 2
    .line 3
    const-string v1, "favor"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->Z(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final F2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->N()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->K2()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->j:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    const-string v0, "fav"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    const-string v0, "hot"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/api/a;->O2(Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/api/a;->L2()V

    .line 54
    .line 55
    .line 56
    :goto_0
    const/4 p1, -0x1

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->h:I

    .line 58
    .line 59
    return-void
.end method

.method public H2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->startMillTime:I

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->endMillTime:I

    .line 4
    .line 5
    invoke-static {p1, p0, v0}, Ll/l120;->n(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;II)J

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K2()V
    .locals 2

    .line 1
    invoke-static {}, Ll/l120;->d()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/l120;->o(J)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->q2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hx10;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/ix10;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ix10;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public initSubscription()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->N2()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/tw10;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/tw10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/bx10;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/bx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

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
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 32
    .line 33
    const-string v1, "hot"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/a;->T2(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/api/a;->d2()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {}, Ll/lwv;->j()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->j:Lrx/subjects/a;

    .line 50
    .line 51
    new-instance v4, Ll/cx10;

    .line 52
    .line 53
    invoke-direct {v4, p0}, Ll/cx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1, v2, v3, v4}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/dx10;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/dx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/ex10;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/ex10;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/fx10;

    .line 90
    .line 91
    invoke-direct {v1}, Ll/fx10;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/gx10;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/gx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3e9

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    sget v1, Ll/a8c0;->j:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_music_library"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/k9c0;->a:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public q2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kx10;->b(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jic0;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->h:I

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/jic0;->getItemCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->h:I

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "hot"

    .line 30
    .line 31
    const/4 v3, -0x1

    .line 32
    sparse-switch v1, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_0
    const-string v1, "local"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v3, 0x2

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 v3, 0x1

    .line 55
    goto :goto_0

    .line 56
    :sswitch_2
    const-string v1, "fav"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    const/4 v3, 0x0

    .line 66
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 67
    .line 68
    .line 69
    :goto_1
    return-void

    .line 70
    :pswitch_0
    invoke-static {}, Ll/lwv;->i()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/api/a;->U2(Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/xw10;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/xw10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Ll/yw10;

    .line 90
    .line 91
    invoke-direct {p0}, Ll/yw10;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :pswitch_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/a;->e2()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/zw10;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/zw10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 115
    .line 116
    .line 117
    new-instance p0, Ll/ax10;

    .line 118
    .line 119
    invoke-direct {p0}, Ll/ax10;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    nop

    .line 131
    :sswitch_data_0
    .sparse-switch
        0x18b1b -> :sswitch_2
        0x1944d -> :sswitch_1
        0x625df6b -> :sswitch_0
    .end sparse-switch

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic s2(Ljava/lang/Boolean;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setTheme()V
    .locals 0

    return-void
.end method

.method public final synthetic u2(Ljava/lang/Boolean;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic w2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->K2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->H2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic y2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "result_selected"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic z2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    const/16 v0, 0xc

    .line 11
    .line 12
    invoke-direct {p1, p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct$a;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 34
    .line 35
    new-instance v0, Ll/jx10;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/jx10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->V(Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 48
    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 51
    .line 52
    const-string v0, "hot"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/api/a;->O2(Ljava/lang/String;)Lrx/c;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->c:Landroid/widget/ImageView;

    .line 58
    .line 59
    new-instance v0, Ll/uw10;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/uw10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 68
    .line 69
    new-instance v0, Ll/vw10;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/vw10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->X(Ll/y20;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->g:Lcom/p1/mobile/putong/feed/newui/camera/a;

    .line 78
    .line 79
    new-instance v0, Ll/ww10;

    .line 80
    .line 81
    invoke-direct {v0, p0}, Ll/ww10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/a;->Y(Ll/y20;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->I2()V

    .line 88
    .line 89
    .line 90
    return-void
.end method
