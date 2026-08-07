.class public Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;
.super Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VRelative;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VLinear;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroidx/legacy/widget/Space;

.field public m:Landroid/view/View;

.field public n:Lv/VDraweeView;

.field public o:Lv/VFrame;

.field public p:Lv/VDraweeView;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Landroid/view/View;

.field public final t:I

.field public u:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41c80000    # 25.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->t:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->u:Z

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41c80000    # 25.0f

    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->t:I

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->u:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41c80000    # 25.0f

    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->t:I

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->u:Z

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method private setContentAlpha(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v0, v0, v1

    .line 7
    .line 8
    if-gez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->g:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->n:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->o:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->o:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->g:Lv/VLinear;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->g:Lv/VLinear;

    .line 36
    .line 37
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->h:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->h:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->s:Landroid/view/View;

    .line 80
    .line 81
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public e(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 28
    .line 29
    .line 30
    float-to-double v0, p1

    .line 31
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 32
    .line 33
    sub-double/2addr v0, v2

    .line 34
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 35
    .line 36
    mul-double/2addr v0, v2

    .line 37
    double-to-float v0, v0

    .line 38
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->setContentAlpha(Ljava/lang/Float;)V

    .line 43
    .line 44
    .line 45
    sget v0, Ll/qa00;->L:I

    .line 46
    .line 47
    sget v1, Ll/qa00;->t:I

    .line 48
    .line 49
    sub-int v1, v0, v1

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    mul-float/2addr v1, p1

    .line 53
    float-to-int p1, v1

    .line 54
    sub-int/2addr v0, p1

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->e:Lv/VRelative;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public getAnimLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eu3;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Ll/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    cmpg-float p2, p2, v0

    .line 10
    .line 11
    if-gez p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->h:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 28
    .line 29
    const-string p1, "audio_tab_id"

    .line 30
    .line 31
    const-string p2, "NA"

    .line 32
    .line 33
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string p1, "index"

    .line 38
    .line 39
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string p1, "anchorId"

    .line 44
    .line 45
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string p1, "liveId"

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->liveID:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string p0, "topic_id"

    .line 58
    .line 59
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string p0, "audio_room_label"

    .line 64
    .line 65
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    const-string p0, "audio_card_type"

    .line 70
    .line 71
    const-string p1, "quickchat_bubble"

    .line 72
    .line 73
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    filled-new-array/range {v0 .. v6}, [Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "e_live_audio_room_enter"

    .line 82
    .line 83
    const-string p2, "p_quickchat"

    .line 84
    .line 85
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->t:I

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p0, p0}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->o:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->n()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    new-instance v1, Ll/du3;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/du3;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final n()V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v2, "https://auto.tancdn.com/v1/raw/da7629b4-7950-490a-a9fc-bfb139befa7f10.pdf"

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 31
    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->u:Z

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v0, v2, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stepToFrame(FZ)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k:Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 61
    .line 62
    move-object v2, v0

    .line 63
    check-cast v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->h:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 66
    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->h:Lcom/p1/mobile/putong/core/data/ChatRoomBubble;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->liveID:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    invoke-static {v3, v4}, Ll/i6c0;->b(J)Ll/bkj0;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j:Landroid/widget/TextView;

    .line 89
    .line 90
    iget v4, v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->chatUserNum:I

    .line 91
    .line 92
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const-string v5, "\u804a\u5929\u5ba4\u00b7%s\u4eba\u5728\u7ebf"

    .line 101
    .line 102
    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->k:Landroid/widget/TextView;

    .line 110
    .line 111
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->theme:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->e:Lv/VRelative;

    .line 117
    .line 118
    iget-object v4, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v4, Ljava/lang/Integer;

    .line 121
    .line 122
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 127
    .line 128
    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->e:Lv/VRelative;

    .line 130
    .line 131
    sget v4, Ll/qa00;->t:I

    .line 132
    .line 133
    invoke-static {v3, v4}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->s:Landroid/view/View;

    .line 137
    .line 138
    const-string v4, "#C9C5FF"

    .line 139
    .line 140
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->s:Landroid/view/View;

    .line 148
    .line 149
    sget v4, Ll/qa00;->h:I

    .line 150
    .line 151
    invoke-static {v3, v4}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 152
    .line 153
    .line 154
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->g:Lv/VLinear;

    .line 155
    .line 156
    iget-object v4, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 157
    .line 158
    check-cast v4, Ljava/lang/Integer;

    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->g:Lv/VLinear;

    .line 168
    .line 169
    sget v4, Ll/qa00;->r:I

    .line 170
    .line 171
    invoke-static {v3, v4}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 172
    .line 173
    .line 174
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->h:Lv/VDraweeView;

    .line 175
    .line 176
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->h:Lv/VDraweeView;

    .line 180
    .line 181
    sget v4, Ll/qa00;->f:I

    .line 182
    .line 183
    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 184
    .line 185
    .line 186
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->h:Lv/VDraweeView;

    .line 187
    .line 188
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v0, Ljava/lang/Integer;

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    invoke-virtual {v3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->n:Lv/VDraweeView;

    .line 200
    .line 201
    const/4 v3, 0x0

    .line 202
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->m:Landroid/view/View;

    .line 206
    .line 207
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    iget-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->avatars:Ljava/util/List;

    .line 211
    .line 212
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->o:Lv/VFrame;

    .line 217
    .line 218
    if-eqz v4, :cond_3

    .line 219
    .line 220
    invoke-static {v5, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_3
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->o(Ljava/util/List;)V

    .line 228
    .line 229
    .line 230
    :goto_1
    const-string p0, "audio_tab_id"

    .line 231
    .line 232
    const-string v0, "NA"

    .line 233
    .line 234
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    const-string p0, "index"

    .line 239
    .line 240
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    const-string p0, "anchorId"

    .line 245
    .line 246
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    const-string p0, "liveId"

    .line 251
    .line 252
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/ChatRoomBubble;->liveID:Ljava/lang/String;

    .line 253
    .line 254
    invoke-static {p0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    const-string p0, "topic_id"

    .line 259
    .line 260
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    const-string p0, "audio_room_label"

    .line 265
    .line 266
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 267
    .line 268
    .line 269
    move-result-object v8

    .line 270
    const-string p0, "audio_card_type"

    .line 271
    .line 272
    const-string v0, "quickchat_bubble"

    .line 273
    .line 274
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 275
    .line 276
    .line 277
    move-result-object v9

    .line 278
    filled-new-array/range {v3 .. v9}, [Ll/pf60;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    const-string v0, "e_live_audio_room_enter"

    .line 283
    .line 284
    const-string v1, "p_quickchat"

    .line 285
    .line 286
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 287
    .line 288
    .line 289
    return-void
.end method

.method public final o(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->r:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->q:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->p:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->r:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->q:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->p:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->r:Lv/VDraweeView;

    .line 61
    .line 62
    if-ne v0, v2, :cond_1

    .line 63
    .line 64
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->q:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->r:Lv/VDraweeView;

    .line 85
    .line 86
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->q:Lv/VDraweeView;

    .line 90
    .line 91
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->p:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->l(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->r:Lv/VDraweeView;

    .line 110
    .line 111
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->q:Lv/VDraweeView;

    .line 115
    .line 116
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->p:Lv/VDraweeView;

    .line 120
    .line 121
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/CRBubbleItemView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
