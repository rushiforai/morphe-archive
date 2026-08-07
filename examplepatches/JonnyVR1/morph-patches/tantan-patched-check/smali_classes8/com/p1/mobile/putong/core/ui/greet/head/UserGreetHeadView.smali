.class public Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/tul;


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Landroid/view/View$OnClickListener;

.field public C:Ljava/lang/String;

.field public D:Z

.field public c:Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

.field public d:Lv/VFrame;

.field public e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lv/VLinear;

.field public k:Lv/VFrame;

.field public l:Lv/VDraweeView;

.field public m:Lv/VImage;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Lv/VImage;

.field public q:Lv/VFrame;

.field public r:Lv/VDraweeView;

.field public s:Lv/VImage;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

.field public x:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;

.field public y:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->z:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->z:Z

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->z:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    return-void
.end method

.method public static synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->a0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->Z(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->B:Landroid/view/View$OnClickListener;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->B:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->B:Landroid/view/View$OnClickListener;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->B:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public M(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->x:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateFourView;->h(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

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

.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oek0;->a(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p3, "moment_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p3, "e_moment"

    .line 14
    .line 15
    const-string v0, "p_kankan_chat_popup"

    .line 16
    .line 17
    invoke-static {p3, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v5, ""

    .line 33
    .line 34
    const/4 v6, 0x2

    .line 35
    const-string v3, "from_greet_act"

    .line 36
    .line 37
    const/4 v4, -0x1

    .line 38
    move-object v2, p2

    .line 39
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic a0(Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v5, ""

    .line 14
    .line 15
    const/4 v6, 0x2

    .line 16
    const-string v3, "from_greet_act"

    .line 17
    .line 18
    const/4 v4, -0x1

    .line 19
    move-object v2, p1

    .line 20
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b(Landroid/view/View;Lv/VImage;Lv/VText;I)V
    .locals 4

    .line 1
    int-to-float v0, p4

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr v0, v1

    .line 5
    sget v2, Ll/qa00;->t:I

    .line 6
    .line 7
    int-to-float v3, v2

    .line 8
    div-float/2addr v0, v3

    .line 9
    sub-float v0, v1, v0

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sub-int/2addr p4, v2

    .line 17
    int-to-float p4, p4

    .line 18
    mul-float/2addr p4, v1

    .line 19
    int-to-float v2, v2

    .line 20
    div-float/2addr p4, v2

    .line 21
    invoke-static {p4, v3}, Ljava/lang/Math;->max(FF)F

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    invoke-static {p4, v1}, Ljava/lang/Math;->min(FF)F

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    invoke-virtual {p1, p4}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, p4}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p4}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->g:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/data/Audio;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "%s\'\'"

    .line 18
    .line 19
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->d:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->g:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->A:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/qa00;->K:I

    .line 29
    .line 30
    invoke-virtual {p2, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->A:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-static {p1}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const/16 v3, 0x50

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {p2, v1, v2, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 57
    .line 58
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->n0(Lcom/p1/mobile/putong/data/User;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->g:Lv/VText;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VFrame;",
            "Lv/VDraweeView;",
            "Lv/VImage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-le p0, p5, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p4, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    const/16 p5, 0x50

    .line 25
    .line 26
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    invoke-virtual {p1, p2, p4, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 31
    .line 32
    .line 33
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 34
    .line 35
    invoke-static {p3, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 8
    .line 9
    const/4 v7, 0x1

    .line 10
    if-lez v6, :cond_0

    .line 11
    .line 12
    move v1, v7

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    if-lez v6, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->k:Lv/VFrame;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->l:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->m:Lv/VImage;

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    move-object v0, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move-object v0, p0

    .line 33
    :goto_1
    const/4 p0, 0x2

    .line 34
    if-le v6, p0, :cond_2

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->n:Lv/VFrame;

    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->o:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->p:Lv/VImage;

    .line 41
    .line 42
    const/4 v5, 0x1

    .line 43
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->q:Lv/VFrame;

    .line 47
    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->r:Lv/VDraweeView;

    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->s:Lv/VImage;

    .line 51
    .line 52
    const/4 v5, 0x2

    .line 53
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 54
    .line 55
    .line 56
    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_4

    .line 61
    .line 62
    invoke-static {}, Ll/guy;->N()Ll/guy;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p2, v1, p1}, Ll/guy;->K(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-nez p2, :cond_4

    .line 83
    .line 84
    iget-object p2, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 85
    .line 86
    invoke-static {p2, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p2, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_3

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    check-cast p2, Landroid/util/Pair;

    .line 114
    .line 115
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast p2, Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    :cond_4
    return-void
.end method

.method public n(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 13
    .line 14
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 18
    .line 19
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    move p3, v0

    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 49
    .line 50
    xor-int/lit8 v1, p3, 0x1

    .line 51
    .line 52
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    if-eqz p3, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->y:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->y:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->v(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->y:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;

    .line 72
    .line 73
    new-instance p1, Ll/lek0;

    .line 74
    .line 75
    invoke-direct {p1}, Ll/lek0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->A:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->d:Lv/VFrame;

    .line 16
    .line 17
    new-instance v1, Ll/jek0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/jek0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->g:Lv/VText;

    .line 26
    .line 27
    new-instance v1, Ll/kek0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/kek0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->h2()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v1}, Ll/r97;->e()Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    sget v1, Ll/ibc0;->G:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    sget v1, Ll/ibc0;->H:I

    .line 89
    .line 90
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 91
    .line 92
    .line 93
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_3

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 121
    .line 122
    sget v0, Ll/ibc0;->n0:I

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->f:Lv/VImage;

    .line 129
    .line 130
    sget v0, Ll/ibc0;->f6:I

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 133
    .line 134
    .line 135
    :cond_4
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    if-eqz v3, :cond_0

    .line 6
    .line 7
    iget-object v3, p3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v3, ""

    .line 11
    .line 12
    :goto_0
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->C:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->z:Z

    .line 15
    .line 16
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    if-nez v3, :cond_1

    .line 20
    .line 21
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    .line 26
    .line 27
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 31
    .line 32
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 36
    .line 37
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 41
    .line 42
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 46
    .line 47
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-interface {v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/4 v7, 0x1

    .line 59
    if-eqz v3, :cond_4

    .line 60
    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 62
    .line 63
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_2

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-interface {v4, p5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ib(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-nez v4, :cond_3

    .line 78
    .line 79
    :cond_2
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    .line 80
    .line 81
    if-eqz v4, :cond_3

    .line 82
    .line 83
    move v4, v7

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move v4, v6

    .line 86
    :goto_1
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-interface {v3, p5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ib(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_4

    .line 98
    .line 99
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-eqz v2, :cond_4

    .line 104
    .line 105
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->w:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    .line 106
    .line 107
    invoke-static {v2, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->w:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    .line 111
    .line 112
    invoke-virtual {v2, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->w:Lcom/p1/mobile/putong/core/ui/greet/GreetMessageMomentNewView;

    .line 116
    .line 117
    new-instance v3, Ll/mek0;

    .line 118
    .line 119
    invoke-direct {v3, p0, p3, p2}, Ll/mek0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    instance-of v2, v2, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 131
    .line 132
    if-eqz v2, :cond_5

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->W()Lcom/p1/mobile/putong/app/PutongAct;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->i2()Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-nez v2, :cond_5

    .line 145
    .line 146
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 147
    .line 148
    new-instance v3, Ll/nek0;

    .line 149
    .line 150
    invoke-direct {v3, p0, p2}, Ll/nek0;-><init>(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_9

    .line 161
    .line 162
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 163
    .line 164
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_9

    .line 169
    .line 170
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Audio;

    .line 177
    .line 178
    if-eqz v1, :cond_6

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->u:Lv/VText;

    .line 181
    .line 182
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 186
    .line 187
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Lcom/p1/mobile/putong/data/Audio;

    .line 192
    .line 193
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->b0(Lcom/p1/mobile/putong/data/Audio;)V

    .line 194
    .line 195
    .line 196
    goto :goto_2

    .line 197
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->j:Lv/VLinear;

    .line 198
    .line 199
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->k:Lv/VFrame;

    .line 203
    .line 204
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->l:Lv/VDraweeView;

    .line 205
    .line 206
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->m:Lv/VImage;

    .line 207
    .line 208
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 209
    .line 210
    const/4 v5, 0x0

    .line 211
    move-object v0, p0

    .line 212
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->n:Lv/VFrame;

    .line 216
    .line 217
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->o:Lv/VDraweeView;

    .line 218
    .line 219
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->p:Lv/VImage;

    .line 220
    .line 221
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 222
    .line 223
    const/4 v5, 0x1

    .line 224
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 225
    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->q:Lv/VFrame;

    .line 228
    .line 229
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->r:Lv/VDraweeView;

    .line 230
    .line 231
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->s:Lv/VImage;

    .line 232
    .line 233
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 234
    .line 235
    const/4 v5, 0x2

    .line 236
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->c0(Lv/VFrame;Lv/VDraweeView;Lv/VImage;Ljava/util/List;I)V

    .line 237
    .line 238
    .line 239
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 240
    .line 241
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->t:Lv/VText;

    .line 246
    .line 247
    const/4 v3, 0x3

    .line 248
    if-le v1, v3, :cond_7

    .line 249
    .line 250
    invoke-static {v2, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->t:Lv/VText;

    .line 254
    .line 255
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 256
    .line 257
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    sub-int/2addr v2, v3

    .line 262
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    const-string v3, "+%s"

    .line 271
    .line 272
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_7
    invoke-static {v2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 281
    .line 282
    .line 283
    :goto_2
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 284
    .line 285
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-nez v1, :cond_8

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 292
    .line 293
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 294
    .line 295
    .line 296
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->v:Lv/VText;

    .line 297
    .line 298
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    .line 302
    .line 303
    :cond_8
    return-void

    .line 304
    :cond_9
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v1

    .line 308
    if-eqz v1, :cond_a

    .line 309
    .line 310
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 311
    .line 312
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    if-nez v1, :cond_a

    .line 317
    .line 318
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 319
    .line 320
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 321
    .line 322
    .line 323
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 324
    .line 325
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 328
    .line 329
    .line 330
    return-void

    .line 331
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 332
    .line 333
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->i:Lv/VText;

    .line 337
    .line 338
    const-string v1, "\u5185\u5bb9\u5df2\u5220\u9664"

    .line 339
    .line 340
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    .line 342
    .line 343
    return-void
.end method

.method public setMomentId(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->C:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->C:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->h:Lv/VLinear;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->D:Z

    .line 32
    .line 33
    :cond_2
    :goto_0
    return-void
.end method

.method public setOnAvatarClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->B:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setShowGreetLayout(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->z:Z

    .line 2
    .line 3
    return-void
.end method
