.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;
.super Ll/lb2;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public e:Landroid/view/ViewPropertyAnimator;

.field public final synthetic f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ll/sz00;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->C()V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->D(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Z

    move-result p0

    return p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->A(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
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

.method public static synthetic w(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->E()V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->y(ZZ)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 15
    .line 16
    iget-boolean p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 17
    .line 18
    iput-boolean p2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 19
    .line 20
    iget-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->B2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o3(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->e:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x4

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->e:Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    return-void
.end method

.method public final synthetic D(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, p1, v0}, Ll/k3h;->N0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 21
    .line 22
    .line 23
    return v2
.end method

.method public final synthetic E()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/c30;->o()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->y(ZZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/api/b;->W3(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/nz00;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/nz00;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/oz00;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/oz00;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/pz00;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/pz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/qz00;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/qz00;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
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
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->C2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->C2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 18
    .line 19
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 30
    .line 31
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->C2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    instance-of v2, v1, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    move-object v2, v1

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->reset()V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/4 v0, 0x0

    .line 63
    move-object v1, v0

    .line 64
    :cond_1
    :goto_0
    if-ltz p1, :cond_8

    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 69
    .line 70
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-lt p1, v2, :cond_2

    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 83
    .line 84
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 93
    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 95
    .line 96
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o3(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 97
    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 100
    .line 101
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 102
    .line 103
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    const/4 v4, 0x1

    .line 110
    sub-int/2addr v3, v4

    .line 111
    if-ne p1, v3, :cond_3

    .line 112
    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->p3()V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 121
    .line 122
    invoke-static {v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->B2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_4

    .line 131
    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 133
    .line 134
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->C2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eq v3, p1, :cond_4

    .line 139
    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 141
    .line 142
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-virtual {v3}, Ll/c30;->o()Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-eqz v3, :cond_4

    .line 151
    .line 152
    invoke-virtual {p0, v4, v4}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->y(ZZ)V

    .line 153
    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_4
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 159
    .line 160
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->B2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-nez v3, :cond_5

    .line 169
    .line 170
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 171
    .line 172
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    invoke-virtual {v3}, Ll/c30;->o()Z

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    if-nez v3, :cond_5

    .line 181
    .line 182
    const/4 v3, 0x0

    .line 183
    invoke-virtual {p0, v3, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->y(ZZ)V

    .line 184
    .line 185
    .line 186
    :cond_5
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 187
    .line 188
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 189
    .line 190
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->E2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 194
    .line 195
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 196
    .line 197
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 204
    .line 205
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 206
    .line 207
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->F2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;I)V

    .line 208
    .line 209
    .line 210
    if-eqz v2, :cond_6

    .line 211
    .line 212
    if-eqz v0, :cond_6

    .line 213
    .line 214
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 215
    .line 216
    if-eqz p1, :cond_6

    .line 217
    .line 218
    iget-object v0, v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-nez p1, :cond_7

    .line 225
    .line 226
    :cond_6
    instance-of p1, v1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 227
    .line 228
    if-eqz p1, :cond_7

    .line 229
    .line 230
    check-cast v1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 231
    .line 232
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    if-eqz p1, :cond_7

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 239
    .line 240
    .line 241
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 242
    .line 243
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 244
    .line 245
    .line 246
    :cond_8
    :goto_2
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->M(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/lz00;

    .line 37
    .line 38
    invoke-direct {v1, p0, p2}, Ll/lz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->setOnLongPressListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/mz00;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/mz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    return-object p2

    .line 59
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 64
    .line 65
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 79
    .line 80
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    if-eqz v3, :cond_1

    .line 83
    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const-string v3, ""

    .line 88
    .line 89
    :goto_0
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->L2(Ljava/lang/String;)Ll/ie80;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-nez p1, :cond_2

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    new-instance p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a$a;

    .line 129
    .line 130
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->x(Ll/ie80$b;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    return-object p2
.end method

.method public final y(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/c30;->m()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/c30;->G()V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->z(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final z(Z)V
    .locals 5

    .line 1
    const-wide/16 v0, 0x12c

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->e:Landroid/view/ViewPropertyAnimator;

    .line 14
    .line 15
    new-instance v2, Ll/rz00;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/rz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    int-to-float p0, p0

    .line 33
    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance p1, Landroid/view/animation/AccelerateInterpolator;

    .line 42
    .line 43
    invoke-direct {p1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->e:Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->e:Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->e:Landroid/view/ViewPropertyAnimator;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->H2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const/high16 v4, 0x3f800000    # 1.0f

    .line 103
    .line 104
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 113
    .line 114
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const-wide/16 v0, 0xc8

    .line 144
    .line 145
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 150
    .line 151
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 164
    .line 165
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    :cond_2
    return-void
.end method
