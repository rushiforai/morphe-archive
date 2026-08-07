.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;
.super Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;",
        "Ll/iam<",
        "Ll/qw10;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/ImageView;

.field public m:Lcom/p1/mobile/putong/data/Music;

.field public n:Ll/rv10;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:I

.field public s:Ll/qw10;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->q2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->u2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->v2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s2()V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->r2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->w2(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->r:I

    return p0
.end method

.method public static bridge synthetic g2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->r:I

    return-void
.end method

.method public static bridge synthetic h2(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->D2(Z)V

    return-void
.end method

.method public static l2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Music;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "extra_music"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "extra_need_back_music"

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private n2()V
    .locals 1

    .line 1
    new-instance v0, Ll/qw10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qw10;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic s2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qw10;->t0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic u2(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Ll/owi;->a()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->k2()Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/mv10;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/mv10;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/nv10;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/nv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Ll/l3h;->a:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {p1, v0, v2, v1, p0}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/qw10;->t0()V

    .line 53
    .line 54
    .line 55
    const-string p0, "e_moment_post"

    .line 56
    .line 57
    const-string p1, "p_camera_music_aggregation"

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private synthetic v2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->p:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/qw10;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public B2(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rv10;->P(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p0
.end method

.method public final C2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->i:Landroid/widget/ImageView;

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
    invoke-interface {v1, p0}, Ll/jfh;->j(Lcom/p1/mobile/android/app/Act;)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final D2(Z)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->d:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->o:Z

    .line 7
    .line 8
    if-ne v0, p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->o:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/high16 v1, 0x43960000    # 300.0f

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v2, v0

    .line 24
    :goto_0
    if-eqz p1, :cond_2

    .line 25
    .line 26
    move p1, v0

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->d:Landroid/widget/RelativeLayout;

    .line 33
    .line 34
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 35
    .line 36
    sget-object v9, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    int-to-float p0, v2

    .line 39
    int-to-float p1, p1

    .line 40
    const/4 v1, 0x2

    .line 41
    new-array v10, v1, [F

    .line 42
    .line 43
    aput p0, v10, v0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    aput p1, v10, p0

    .line 47
    .line 48
    const-wide/16 v5, 0x0

    .line 49
    .line 50
    const-wide/16 v7, 0x12c

    .line 51
    .line 52
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public E2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qw10;->N0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public F2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->g:Landroid/widget/ImageView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v1, Ll/lbc0;->x6:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Ll/lbc0;->w6:I

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->l:Landroid/widget/ImageView;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 20
    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Music;->favor:Z

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    sget p0, Ll/lbc0;->x6:I

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    sget p0, Ll/lbc0;->y6:I

    .line 29
    .line 30
    :goto_1
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->k2()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qw10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m2(Ll/qw10;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ov10;->b(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->i2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n2()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/qw10;->a0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/gv10;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/gv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public k2()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    return-object p0
.end method

.method public m2(Ll/qw10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 2
    .line 3
    return-void
.end method

.method public o2(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rv10;->J(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p2()Ll/rv10;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 2
    .line 3
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_music_aggregation"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "extra_music"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 19
    .line 20
    iput-object p1, v0, Ll/qw10;->a:Lcom/p1/mobile/putong/data/Music;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "extra_need_back_music"

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->q:Z

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic q2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->A2(Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/rv10;->S()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/qw10;->N0()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/c30;->m()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    invoke-direct {v0, p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$a;

    .line 15
    .line 16
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "zh"

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->e:Landroid/widget/TextView;

    .line 45
    .line 46
    const-string v2, ""

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->d:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/high16 v2, 0x42a00000    # 80.0f

    .line 58
    .line 59
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->d:Landroid/widget/RelativeLayout;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/rv10;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 78
    .line 79
    invoke-direct {v0, p0, v1}, Ll/rv10;-><init>(Landroid/content/Context;Ll/qw10;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/rv10;->Q(Lcom/p1/mobile/putong/data/Music;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 97
    .line 98
    new-instance v1, Ll/hv10;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/hv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/rv10;->R(Ll/y20;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->d:Landroid/widget/RelativeLayout;

    .line 107
    .line 108
    new-instance v1, Ll/iv10;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/iv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->F2()V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->g:Landroid/widget/ImageView;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 122
    .line 123
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    new-instance v2, Ll/jv10;

    .line 127
    .line 128
    invoke-direct {v2, v1}, Ll/jv10;-><init>(Ll/qw10;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->l:Landroid/widget/ImageView;

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 137
    .line 138
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    new-instance v2, Ll/jv10;

    .line 142
    .line 143
    invoke-direct {v2, v1}, Ll/jv10;-><init>(Ll/qw10;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Music;->source:Ljava/lang/String;

    .line 152
    .line 153
    const-string v1, "default"

    .line 154
    .line 155
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_1

    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->j:Landroid/widget/TextView;

    .line 162
    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v2, "@"

    .line 166
    .line 167
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 171
    .line 172
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->k:Landroid/widget/TextView;

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 187
    .line 188
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->B1:I

    .line 189
    .line 190
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->k:Landroid/widget/TextView;

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 201
    .line 202
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Music;->name:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->j:Landroid/widget/TextView;

    .line 208
    .line 209
    const/16 v1, 0x8

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 212
    .line 213
    .line 214
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->f:Landroid/widget/ImageView;

    .line 215
    .line 216
    new-instance v1, Ll/kv10;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/kv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->i:Landroid/widget/ImageView;

    .line 225
    .line 226
    new-instance v1, Ll/lv10;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/lv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 235
    .line 236
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;

    .line 237
    .line 238
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->C2()V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public final synthetic r2(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qw10;->N0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->s:Ll/qw10;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/qw10;->L0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rv10;->N()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z2(Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->m:Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->n:Ll/rv10;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rv10;->Q(Lcom/p1/mobile/putong/data/Music;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
