.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;
    }
.end annotation


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VPager;

.field public i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public final n:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->n:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->i2()V

    return-void
.end method

.method public static synthetic b2(ZLl/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "profile"

    .line 13
    .line 14
    :goto_0
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 15
    .line 16
    invoke-static {v0}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/4 v2, 0x1

    .line 44
    if-ne p1, v2, :cond_2

    .line 45
    .line 46
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    sget-object p1, Lcom/facebook/imagepipeline/common/Priority;->LOW:Lcom/facebook/imagepipeline/common/Priority;

    .line 50
    .line 51
    :goto_1
    invoke-virtual {v1, v0, p1, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic d2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->n:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    return-object p0
.end method

.method public static bridge synthetic e2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    return-object p0
.end method

.method private synthetic h2(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->p2()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->c:Lv/VDraweeView;

    .line 7
    .line 8
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkQyVTU2TzQ1RElNMlZQNkhYUUpXUDJJRVFaSlRZVDEyIiwidyI6NzUwLCJoIjoxNjI0LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzJ9.png"

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->r()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    const/4 v1, -0x1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p1, v0, v1, v2, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;->q(Lcom/p1/mobile/putong/data/User;IZZ)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->W(Lcom/p1/mobile/putong/data/User;IZ)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private synthetic k2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n2(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->p0(Ljava/util/Collection;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/r66;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Ll/r66;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    if-nez p2, :cond_1

    .line 34
    .line 35
    const-string p0, ""

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const-string p0, "profile"

    .line 39
    .line 40
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->HIGH:Lcom/facebook/imagepipeline/common/Priority;

    .line 51
    .line 52
    invoke-virtual {p2, p1, v0, p0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private p2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/n66;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/n66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->n:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->n:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->s(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v1, 0x1

    .line 57
    if-gt v0, v1, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->d:Landroid/widget/ImageView;

    .line 66
    .line 67
    new-instance v1, Ll/o66;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/o66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "e_spotlight_msg_button"

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->pageId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l:Landroid/widget/TextView;

    .line 85
    .line 86
    new-instance v1, Ll/p66;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/p66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method


# virtual methods
.method public g2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/s66;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic i2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->n2(Lcom/p1/mobile/putong/data/User;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->g2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m66;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/m66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->o2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m2(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_spotlight_msg_button"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/a0g;->M(Lcom/p1/mobile/putong/data/User;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ec:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    new-instance v2, Ll/q66;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/q66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0, v1, v2}, Ll/zsb;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final o2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, "#4cf2aa7e"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->iq:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget v2, Lcom/p1/mobile/putong/core/R$string;->v3:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->l:Landroid/widget/TextView;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 36
    .line 37
    .line 38
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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_spotlight_profile"

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 v0, 0x400

    .line 12
    .line 13
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/zsb;->f()Ll/zsb;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/zsb;->e()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    new-instance p1, Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 29
    .line 30
    .line 31
    :try_start_0
    const-string v0, "tooltips_trigger_mode"

    .line 32
    .line 33
    const-string v1, "active"

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    const-string v0, "user_id"

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->m:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
