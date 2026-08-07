.class public abstract Ll/yqg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d0r;
.implements Ll/lxh;


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/data/Moment;

.field public B:Lcom/p1/mobile/putong/data/User;

.field public C:Lcom/p1/mobile/android/app/Act;

.field public D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public E:Ljava/lang/String;

.field public F:Ll/msv;

.field public G:Ll/f0r;

.field public H:Ll/ogh;

.field public I:I

.field public a:Landroid/view/View;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VEditText;

.field public o:Landroid/widget/TextView;

.field public p:Landroid/widget/LinearLayout;

.field public q:Lv/VImage;

.field public r:Landroid/widget/TextView;

.field public s:Lv/VImage;

.field public t:Landroid/view/View;

.field public u:Landroid/view/View;

.field public v:Landroid/widget/LinearLayout;

.field public w:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

.field public x:Ljava/lang/String;

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/yqg;->I:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method private J()V
    .locals 2

    .line 1
    new-instance v0, Ll/pqg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pqg;-><init>(Ll/yqg;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/yqg;->e:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yqg;->N()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/yqg;->g:Lv/VText;

    .line 20
    .line 21
    new-instance v1, Ll/qqg;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/qqg;-><init>(Ll/yqg;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/yqg;->q:Lv/VImage;

    .line 30
    .line 31
    new-instance v1, Ll/rqg;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/rqg;-><init>(Ll/yqg;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/yqg;->p:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    new-instance v1, Ll/sqg;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/sqg;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/yqg;->f:Lv/VText;

    .line 50
    .line 51
    new-instance v1, Ll/tqg;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/tqg;-><init>(Ll/yqg;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/yqg;->s:Lv/VImage;

    .line 60
    .line 61
    new-instance v1, Ll/uqg;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/uqg;-><init>(Ll/yqg;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 3

    .line 1
    instance-of p1, p1, Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    const-string v1, "moment_preview"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v0, v1, v2}, Ll/er60;->m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/yqg;->t0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/yqg;->s0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yqg;->d0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jka;->S6(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic o(Ll/yqg;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->R(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic p(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/yqg;Lcom/p1/mobile/putong/data/User;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yqg;->b0(Lcom/p1/mobile/putong/data/User;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic r(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yqg;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yqg;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Ll/yqg;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->X(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic w(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yqg;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/yqg;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yqg;->a0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/yqg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->Y(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Ll/yqg;->z:Z

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Ll/yqg;->z:Z

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, 0x2

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    new-array p1, v0, [F

    .line 24
    .line 25
    fill-array-data p1, :array_0

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    new-array p1, v0, [F

    .line 34
    .line 35
    fill-array-data p1, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :goto_0
    const-wide/16 v0, 0xfa

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/xqg;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/xqg;-><init>(Ll/yqg;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public C(Landroid/view/View;Ll/ixh;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yqg;->H()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Ll/yqg;->F(Ll/ixh;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yqg;->r0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/yqg;->s0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E(Ll/ixh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->F(Ll/ixh;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final F(Ll/ixh;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->O(Ll/ixh;)Ll/ogh;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yqg;->I()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/ogh;->D(Ll/yqg;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final G()V
    .locals 3

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "moment_id"

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/pf60;

    .line 13
    .line 14
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "owner_id"

    .line 19
    .line 20
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "e_moment_profile_pic"

    .line 28
    .line 29
    const-string v1, "p_moment_preview"

    .line 30
    .line 31
    invoke-static {v0, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public abstract H()Landroid/view/View;
.end method

.method public I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 2
    .line 3
    iget-object v1, v0, Ll/ogh;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iput-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 11
    .line 12
    iput-object v1, p0, Ll/yqg;->D:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, v0, Ll/ogh;->l:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {}, Ll/j4h;->h()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/yqg;->q:Lv/VImage;

    .line 25
    .line 26
    sget v1, Ll/lbc0;->a6:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/yqg;->s:Lv/VImage;

    .line 32
    .line 33
    sget v1, Ll/lbc0;->b6:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/yqg;->n:Lv/VEditText;

    .line 39
    .line 40
    invoke-static {v0}, Ll/wpe;->a(Lv/VEditText;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/yqg;->s:Lv/VImage;

    .line 44
    .line 45
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    invoke-static {v1}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    xor-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/yqg;->p0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/yqg;->L()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/yqg;->M()V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ll/yqg;->J()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/yqg;->G()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 74
    .line 75
    const-string v1, "p_moment_preview"

    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/j9h;->d(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/yqg;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 81
    .line 82
    if-eqz p0, :cond_2

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->R()V

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_0
    return-void
.end method

.method public final K()V
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/yqg;->m:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/16 v2, 0x8

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/yqg;->m:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/yqg;->n:Lv/VEditText;

    .line 31
    .line 32
    iget-object v2, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/yqg;->n:Lv/VEditText;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 55
    .line 56
    iget-object v1, p0, Ll/yqg;->n:Lv/VEditText;

    .line 57
    .line 58
    iget-object v2, p0, Ll/yqg;->o:Landroid/widget/TextView;

    .line 59
    .line 60
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2, p0}, Ll/ogh;->y(Lv/VEditText;Landroid/widget/TextView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/vqg;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/vqg;-><init>(Ll/yqg;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yqg;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    new-instance v0, Ll/mqg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mqg;-><init>(Ll/yqg;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/yqg;->j:Lv/VImage;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/yqg;->k:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/nqg;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/nqg;-><init>(Ll/yqg;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/yqg;->h:Lv/VImage;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/yqg;->i:Lv/VText;

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public O(Ll/ixh;)Ll/ogh;
    .locals 2

    .line 1
    new-instance v0, Ll/ogh;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p1}, Ll/ogh;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ixh;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 11
    .line 12
    return-object v0
.end method

.method public P(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yqg;->o0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/yqg;->i0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/yqg;->h0(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/yqg;->k0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yqg;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v1, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v0, v1, p1}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/yqg;->g0(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/yqg;->F:Ll/msv;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ll/msv;->b(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/lqg;

    .line 91
    .line 92
    invoke-direct {v1, p0, p1}, Ll/lqg;-><init>(Ll/yqg;Lcom/p1/mobile/putong/data/User;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-nez v2, :cond_2

    .line 116
    .line 117
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Ljava/lang/Double;

    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 124
    .line 125
    .line 126
    move-result-wide v2

    .line 127
    invoke-static {}, Ll/pzi0;->o()J

    .line 128
    .line 129
    .line 130
    move-result-wide v4

    .line 131
    long-to-double v4, v4

    .line 132
    cmpl-double v0, v2, v4

    .line 133
    .line 134
    if-lez v0, :cond_2

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 143
    .line 144
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_2

    .line 149
    .line 150
    iget-object v0, p0, Ll/yqg;->c:Lv/VDraweeView;

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    .line 154
    .line 155
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 156
    .line 157
    iget-object p0, p0, Ll/yqg;->c:Lv/VDraweeView;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 164
    .line 165
    iget-object p1, p1, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    check-cast p1, Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_2
    return-void
.end method

.method public final synthetic R(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object v0, p0, Ll/yqg;->p:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/yqg;->t:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/yqg;->u:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yqg;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/yqg;->e0()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/yqg;->D:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/yqg;->D:Ljava/util/List;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    iget p1, p0, Ll/yqg;->I:I

    .line 29
    .line 30
    if-ltz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/yqg;->D:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget v0, p0, Ll/yqg;->I:I

    .line 39
    .line 40
    if-le p1, v0, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Ll/yqg;->D:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 49
    .line 50
    :goto_0
    move-object v6, p1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const/4 p1, 0x0

    .line 53
    goto :goto_0

    .line 54
    :goto_1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 55
    .line 56
    new-instance v1, Ll/wqg;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/wqg;-><init>()V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object v3, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    const-string v4, "p_moment_preview"

    .line 66
    .line 67
    const/4 v5, 0x1

    .line 68
    invoke-static/range {v0 .. v6}, Ll/rzi;->Q(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Media;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/yqg;->B(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yqg;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/ogh;->A(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/yqg;->H:Ll/ogh;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ogh;->Y()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/yqg;->F:Ll/msv;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 7
    .line 8
    iget-object v0, v0, Ll/ogh;->h:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p2, v1}, Ll/msv;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, p2, v1}, Ll/ksv;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object p0, p0, Ll/yqg;->F:Ll/msv;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/msv;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "live-group"

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-interface {p2, v0, p0, p1, v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public b(Ll/cf60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/data/User;Landroid/graphics/Bitmap;)V
    .locals 3

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
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {p2, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->j(Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/yqg;->H:Ll/ogh;

    .line 30
    .line 31
    iget-object p2, p2, Ll/ogh;->h:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Ll/yqg;->F:Ll/msv;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/msv;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p2, v0, v1}, Ll/ksv;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 47
    .line 48
    new-instance v0, Ll/oqg;

    .line 49
    .line 50
    invoke-direct {v0, p0, p1}, Ll/oqg;-><init>(Ll/yqg;Lcom/p1/mobile/putong/data/User;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 57
    .line 58
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public bridge synthetic c(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Ll/ixh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yqg;->C(Landroid/view/View;Ll/ixh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 10
    .line 11
    iget-object p0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/ogh;->z(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Ll/ie80$c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e0()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroidx/viewpager/widget/ViewPager;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Ll/yqg;->f0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yqg;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public abstract g0(Lcom/p1/mobile/putong/data/User;)V
.end method

.method public h(II)V
    .locals 4

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, -0x1

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/yqg;->y:Z

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/yqg;->y:Z

    .line 11
    .line 12
    iget-object v1, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    const-string v2, "#66000000"

    .line 15
    .line 16
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/yqg;->n:Lv/VEditText;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/yqg;->n:Lv/VEditText;

    .line 29
    .line 30
    const-string v2, "#66ffffff"

    .line 31
    .line 32
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/yqg;->n:Lv/VEditText;

    .line 40
    .line 41
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/yqg;->n:Lv/VEditText;

    .line 45
    .line 46
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/yqg;->o:Landroid/widget/TextView;

    .line 52
    .line 53
    iget-object v2, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {}, Ll/j4h;->h()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_0

    .line 64
    .line 65
    sget v3, Ll/k9c0;->R:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    sget v3, Ll/k9c0;->Q:I

    .line 69
    .line 70
    :goto_0
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    if-eqz p1, :cond_4

    .line 78
    .line 79
    iget-boolean v1, p0, Ll/yqg;->y:Z

    .line 80
    .line 81
    if-nez v1, :cond_4

    .line 82
    .line 83
    iput-boolean p2, p0, Ll/yqg;->y:Z

    .line 84
    .line 85
    iget-object p2, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Ll/yqg;->n:Lv/VEditText;

    .line 91
    .line 92
    const/high16 v0, -0x1000000

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Ll/yqg;->n:Lv/VEditText;

    .line 98
    .line 99
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {}, Ll/j4h;->h()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    sget v1, Ll/k9c0;->h:I

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    sget v1, Ll/k9c0;->m0:I

    .line 115
    .line 116
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Ll/yqg;->n:Lv/VEditText;

    .line 124
    .line 125
    const/4 v0, 0x3

    .line 126
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Ll/yqg;->o:Landroid/widget/TextView;

    .line 130
    .line 131
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {}, Ll/j4h;->h()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_3

    .line 142
    .line 143
    sget v1, Ll/k9c0;->b0:I

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_3
    sget v1, Ll/k9c0;->a0:I

    .line 147
    .line 148
    :goto_2
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ll/yqg;->r0()V

    .line 156
    .line 157
    .line 158
    :cond_4
    iget-object p2, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 159
    .line 160
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    instance-of v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 165
    .line 166
    if-eqz v0, :cond_5

    .line 167
    .line 168
    move-object v0, p2

    .line 169
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 170
    .line 171
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 172
    .line 173
    :cond_5
    iget-object p0, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public h0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqg;->k:Lv/VText;

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->d:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ixh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yqg;->E(Ll/ixh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract i0(Lcom/p1/mobile/putong/feed/data/Moment;)V
.end method

.method public j(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    new-instance v0, Ll/f0r;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/yqg;->G:Ll/f0r;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/yqg;->G:Ll/f0r;

    .line 24
    .line 25
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/kqg;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/kqg;-><init>(Ll/f0r;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public k(ILcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract l0(Lcom/p1/mobile/putong/feed/data/RawFeed;)V
.end method

.method public m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yqg;->p0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/yqg;->l0(Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final o0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Ll/yqg;->g:Lv/VText;

    .line 32
    .line 33
    const/16 v0, 0x8

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object v0, p0, Ll/yqg;->g:Lv/VText;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v3, p0, Ll/yqg;->g:Lv/VText;

    .line 50
    .line 51
    iget-object v5, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v4, v5, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v6, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 56
    .line 57
    const-string v7, "p_moment_preview"

    .line 58
    .line 59
    invoke-static/range {v2 .. v7}, Ll/j9h;->c(Lcom/p1/mobile/android/app/Act;Lv/VText;Ljava/lang/CharSequence;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/yqg;->G:Ll/f0r;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/yqg;->G:Ll/f0r;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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
    iput-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/yqg;->P(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/yqg;->K()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yqg;->m0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yqg;->Q(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    const-string v0, "moment_type"

    .line 13
    .line 14
    iget-object v2, p0, Ll/yqg;->x:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v1, v0, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/pf60;

    .line 20
    .line 21
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v3, "moment_id"

    .line 26
    .line 27
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance v3, Ll/pf60;

    .line 31
    .line 32
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 35
    .line 36
    const-string v4, "owner_id"

    .line 37
    .line 38
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    new-instance v4, Ll/pf60;

    .line 42
    .line 43
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 46
    .line 47
    const-string v5, "receiver_user_id"

    .line 48
    .line 49
    invoke-direct {v4, v5, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    new-instance v5, Ll/pf60;

    .line 53
    .line 54
    const-string v0, "comment_detail"

    .line 55
    .line 56
    const-string v6, "comment"

    .line 57
    .line 58
    invoke-direct {v5, v0, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance v6, Ll/pf60;

    .line 62
    .line 63
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v7, "moment_showfrom"

    .line 73
    .line 74
    invoke-direct {v6, v7, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object p0, p0, Ll/yqg;->H:Ll/ogh;

    .line 82
    .line 83
    iget-object p0, p0, Ll/ogh;->h:Ljava/lang/String;

    .line 84
    .line 85
    const-string v1, "e_comment"

    .line 86
    .line 87
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    :goto_0
    return-void
.end method

.method public s0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/yqg;->H:Ll/ogh;

    .line 44
    .line 45
    iget-boolean v1, v1, Ll/ogh;->g:Z

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->i(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "from_preview_page"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->u(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    :goto_0
    return-void

    .line 76
    :cond_1
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const-string v2, "from_nearby_focus_single"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, p0, v2}, Ll/at0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, p0, v0, v2}, Ll/at0;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
