.class public Ll/hnh;
.super Ll/elh;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hnh$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/elh<",
        "Ll/zmh;",
        ">;"
    }
.end annotation


# instance fields
.field public o:Lv/navigationbar/VNavigationBar;

.field public p:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

.field public q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

.field public r:Landroid/widget/TextView;

.field public s:Lv/VPager;

.field public t:Ll/zmh;

.field public final u:Lcom/p1/mobile/android/app/Act;

.field public final v:Ljava/lang/String;

.field public final w:Ljava/lang/String;

.field public final x:Ljava/lang/String;

.field public y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/elh;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "e_activity_friend"

    .line 5
    .line 6
    iput-object v0, p0, Ll/hnh;->v:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "e_activity_all"

    .line 9
    .line 10
    iput-object v0, p0, Ll/hnh;->w:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "p_activity"

    .line 13
    .line 14
    iput-object v0, p0, Ll/hnh;->x:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/hnh;->y:Ljava/util/List;

    .line 22
    .line 23
    iput-object p1, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J(Ll/hnh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hnh;->V()V

    return-void
.end method

.method public static synthetic K(Ll/hnh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnh;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/hnh;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnh;->U(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic M(Ll/hnh;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnh;->X(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N(Ll/hnh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnh;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/h80;Landroid/view/View;IIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic P(Ll/hnh;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnh;->y:Ljava/util/List;

    return-object p0
.end method

.method private T(I)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->i:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/hdc0;->Q1:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/TextView;

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    const-string v2, "\u5168\u90e8"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v2, "\u597d\u53cb\u6d88\u606f"

    .line 28
    .line 29
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    const-string v2, "#cc000000"

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const-string v2, "#66000000"

    .line 38
    .line 39
    :goto_1
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    const/4 v2, 0x0

    .line 61
    :goto_2
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-virtual {p0, p1}, Ll/hnh;->S(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-object v0
.end method

.method private synthetic V()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnh;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->S0:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/fnh;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/fnh;-><init>(Ll/hnh;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Ll/k3h;->K0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 48
    .line 49
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "unread_message_num"

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_all_read"

    .line 68
    .line 69
    const-string v0, "p_activity"

    .line 70
    .line 71
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/inh;->b(Ll/hnh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R(Ll/zmh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hnh;->t:Ll/zmh;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/elh;->l(Ll/umh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x2

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, 0x40000000    # 2.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p1, 0x40200000    # 2.5f

    .line 13
    .line 14
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 19
    .line 20
    return-object p0
.end method

.method public final synthetic U(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/high16 p1, 0x40e00000    # 7.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p1, 0x40400000    # 3.0f

    .line 13
    .line 14
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic X(Ljava/lang/Boolean;)V
    .locals 1

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
    goto :goto_1

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iget-object v0, p0, Ll/hnh;->y:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/hnh;->y:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->P4()V

    .line 26
    .line 27
    .line 28
    add-int/lit8 p1, p1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/tfj0$a;

    .line 3
    .line 4
    const-string v0, "e_red_flower_explain"

    .line 5
    .line 6
    const-string v1, "p_activity"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/v4h;

    .line 12
    .line 13
    iget-object p0, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/v4h;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/v4h;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hnh;->t:Ll/zmh;

    .line 2
    .line 3
    new-instance v1, Ll/gnh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/gnh;-><init>(Ll/hnh;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/umh;->S1(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/data/FeedFlower;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnh;->r:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/tfj0$a;

    .line 11
    .line 12
    const-string v1, "e_red_flower_explain"

    .line 13
    .line 14
    const-string v2, "p_activity"

    .line 15
    .line 16
    invoke-static {v1, v2, v0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/hnh;->r:Landroid/widget/TextView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/hnh;->r:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget p1, p1, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 32
    .line 33
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v2, "\u5c0f\u7ea2\u82b1 %d"

    .line 42
    .line 43
    invoke-static {v1, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/hnh;->r:Landroid/widget/TextView;

    .line 51
    .line 52
    new-instance v0, Ll/enh;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/enh;-><init>(Ll/hnh;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zmh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hnh;->R(Ll/zmh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hnh;->Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/hnh;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 6
    .line 7
    new-instance v0, Ll/anh;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/anh;-><init>(Ll/hnh;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;->setAction(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/hnh;->o:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/hnh;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget v0, Ll/k9c0;->p0:I

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/hnh;->r()V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/hnh;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 43
    .line 44
    iput-object p2, p0, Ll/elh;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 45
    .line 46
    return-object p1
.end method

.method public bridge synthetic l(Ll/umh;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zmh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hnh;->R(Ll/zmh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hnh;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hnh;->o:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hnh;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/hnh;->o:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->f5:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/owi;->m:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iget-object v3, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 41
    .line 42
    iget-object v3, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i0:I

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object v3, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sget v4, Ll/k9c0;->r:I

    .line 66
    .line 67
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 75
    .line 76
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 82
    .line 83
    const/high16 v3, 0x41600000    # 14.0f

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 89
    .line 90
    sget v3, Ll/qa00;->j:I

    .line 91
    .line 92
    const/high16 v4, 0x40e00000    # 7.0f

    .line 93
    .line 94
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-virtual {v0, v3, v5, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 106
    .line 107
    iget-object v3, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    sget v4, Ll/lbc0;->f4:I

    .line 114
    .line 115
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/hnh;->o:Lv/navigationbar/VNavigationBar;

    .line 123
    .line 124
    iget-object v3, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 125
    .line 126
    new-array v4, v1, [Landroid/view/View;

    .line 127
    .line 128
    aput-object v3, v4, v2

    .line 129
    .line 130
    invoke-virtual {v0, v4}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/elh;->c:Landroid/widget/TextView;

    .line 134
    .line 135
    new-instance v3, Ll/bnh;

    .line 136
    .line 137
    invoke-direct {v3, p0}, Ll/bnh;-><init>(Ll/hnh;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    :cond_0
    new-instance v0, Ll/hnh$a;

    .line 144
    .line 145
    invoke-direct {v0, p0}, Ll/hnh$a;-><init>(Ll/hnh;)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 149
    .line 150
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 155
    .line 156
    .line 157
    iget-object v3, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 158
    .line 159
    new-instance v4, Ll/cnh;

    .line 160
    .line 161
    invoke-direct {v4, v0}, Ll/cnh;-><init>(Ll/h80;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 168
    .line 169
    new-instance v4, Ll/hnh$b;

    .line 170
    .line 171
    invoke-direct {v4, p0}, Ll/hnh$b;-><init>(Ll/hnh;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 175
    .line 176
    .line 177
    iget-object v3, p0, Ll/hnh;->s:Lv/VPager;

    .line 178
    .line 179
    new-instance v4, Ll/hnh$c;

    .line 180
    .line 181
    invoke-direct {v4, p0, v0}, Ll/hnh$c;-><init>(Ll/hnh;Ll/h80;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3, v4}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 185
    .line 186
    .line 187
    iget-object v3, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 188
    .line 189
    iget-object v4, p0, Ll/hnh;->s:Lv/VPager;

    .line 190
    .line 191
    invoke-virtual {v3, v4, v2}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;Z)V

    .line 192
    .line 193
    .line 194
    iget-object v3, p0, Ll/hnh;->t:Ll/zmh;

    .line 195
    .line 196
    iget-object v4, v3, Ll/umh;->a:Ljava/lang/String;

    .line 197
    .line 198
    iget-boolean v3, v3, Ll/umh;->e:Z

    .line 199
    .line 200
    invoke-static {v1, v4, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->S4(ILjava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iget-object v3, p0, Ll/hnh;->t:Ll/zmh;

    .line 205
    .line 206
    iget-object v4, v3, Ll/umh;->a:Ljava/lang/String;

    .line 207
    .line 208
    iget-boolean v3, v3, Ll/umh;->e:Z

    .line 209
    .line 210
    const/4 v5, 0x2

    .line 211
    invoke-static {v5, v4, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;->S4(ILjava/lang/String;Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedPhotoAlbumActivitiesFrag;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    iget-object v4, p0, Ll/hnh;->y:Ljava/util/List;

    .line 216
    .line 217
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Ll/hnh;->y:Ljava/util/List;

    .line 221
    .line 222
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    new-instance v1, Ll/hnh$d;

    .line 226
    .line 227
    iget-object v3, p0, Ll/hnh;->u:Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-direct {v1, p0, v3}, Ll/hnh$d;-><init>(Ll/hnh;Landroidx/fragment/app/FragmentManager;)V

    .line 234
    .line 235
    .line 236
    iget-object v3, p0, Ll/hnh;->s:Lv/VPager;

    .line 237
    .line 238
    invoke-virtual {v3, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 239
    .line 240
    .line 241
    iget-object v1, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 242
    .line 243
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    :goto_0
    iget-object v3, p0, Ll/hnh;->q:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/tab/FeedActivitiesTabLayout;

    .line 248
    .line 249
    if-ge v2, v1, :cond_3

    .line 250
    .line 251
    invoke-virtual {v3, v2}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v4

    .line 259
    if-eqz v4, :cond_2

    .line 260
    .line 261
    invoke-direct {p0, v2}, Ll/hnh;->T(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    if-nez v2, :cond_1

    .line 273
    .line 274
    const-string v4, "e_activity_friend"

    .line 275
    .line 276
    goto :goto_1

    .line 277
    :cond_1
    const-string v4, "e_activity_all"

    .line 278
    .line 279
    :goto_1
    invoke-virtual {v0, v3, v4, v2}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 280
    .line 281
    .line 282
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 283
    .line 284
    goto :goto_0

    .line 285
    :cond_3
    new-instance p0, Ll/dnh;

    .line 286
    .line 287
    invoke-direct {p0, v0}, Ll/dnh;-><init>(Ll/h80;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 291
    .line 292
    .line 293
    return-void
.end method

.method public y(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hnh;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumInterestedHeaderView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Ll/elh;->y(Ljava/util/List;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->X0:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
