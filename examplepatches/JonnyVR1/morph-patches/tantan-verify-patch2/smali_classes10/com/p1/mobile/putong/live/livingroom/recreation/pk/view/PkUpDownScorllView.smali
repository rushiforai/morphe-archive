.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

.field public c:F

.field public d:F

.field public e:Z

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/animation/Animator;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 25
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->c:F

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->d:F

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g:Ljava/util/List;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->m()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->k()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->j(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/za80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->i:Ll/y20;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->i:Ll/y20;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->c:F

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->setX(F)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 13
    .line 14
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->d:F

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/view/View;->setY(F)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 20
    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 32
    .line 33
    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 37
    .line 38
    const/4 p2, 0x1

    .line 39
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/n9c0;->p1:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->a:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Ll/n9c0;->p1:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->a:Landroid/widget/TextView;

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    const/high16 v2, 0x41600000    # 14.0f

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->a:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b:Landroid/widget/ImageView;

    .line 55
    .line 56
    sget v1, Ll/obc0;->k5:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b:Landroid/widget/ImageView;

    .line 64
    .line 65
    sget v0, Ll/obc0;->k5:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final m()V
    .locals 21

    move-object/from16 v0, p0

    .line 1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f()V

    .line 2
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g:Ljava/util/List;

    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 4
    iget v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x0

    if-ne v3, v4, :cond_0

    .line 5
    iput v5, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    .line 6
    :cond_0
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g:Ljava/util/List;

    iget v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz v1, :cond_b

    if-nez v3, :cond_1

    goto/16 :goto_8

    .line 7
    :cond_1
    iget-boolean v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    if-eqz v4, :cond_2

    .line 8
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 9
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 10
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 12
    :cond_2
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 14
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 16
    :goto_0
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    const/high16 v3, 0x41c00000    # 24.0f

    const/4 v4, 0x0

    if-eqz v1, :cond_3

    move v1, v4

    goto :goto_1

    :cond_3
    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v1

    int-to-float v1, v1

    .line 17
    :goto_1
    iget-boolean v6, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    if-eqz v6, :cond_4

    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    goto :goto_2

    :cond_4
    move v6, v4

    .line 18
    :goto_2
    iget-boolean v7, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v7, :cond_5

    move v9, v8

    goto :goto_3

    :cond_5
    move v9, v4

    :goto_3
    if-eqz v7, :cond_6

    move v10, v4

    goto :goto_4

    :cond_6
    move v10, v8

    :goto_4
    if-eqz v7, :cond_7

    .line 19
    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v7

    int-to-float v7, v7

    goto :goto_5

    :cond_7
    move v7, v4

    .line 20
    :goto_5
    iget-boolean v11, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    if-eqz v11, :cond_8

    move v3, v4

    goto :goto_6

    :cond_8
    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    .line 21
    :goto_6
    iget-boolean v11, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    if-eqz v11, :cond_9

    move v12, v4

    goto :goto_7

    :cond_9
    move v12, v8

    :goto_7
    if-eqz v11, :cond_a

    move v4, v8

    .line 22
    :cond_a
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    new-instance v19, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct/range {v19 .. v19}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    const/4 v8, 0x2

    new-array v11, v8, [F

    aput v1, v11, v5

    aput v6, v11, v2

    .line 23
    const-string v14, "translationY"

    const-wide/16 v15, 0xfa0

    const-wide/16 v17, 0x12c

    move-object/from16 v20, v11

    invoke-static/range {v13 .. v20}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v1

    .line 24
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    new-instance v19, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct/range {v19 .. v19}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    new-array v6, v8, [F

    aput v9, v6, v5

    aput v10, v6, v2

    .line 25
    const-string v14, "alpha"

    move-object/from16 v20, v6

    invoke-static/range {v13 .. v20}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v6

    .line 26
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    new-instance v19, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct/range {v19 .. v19}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    new-array v9, v8, [F

    aput v7, v9, v5

    aput v3, v9, v2

    .line 27
    const-string v14, "translationY"

    move-object/from16 v20, v9

    invoke-static/range {v13 .. v20}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v3

    .line 28
    iget-object v13, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    new-instance v19, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct/range {v19 .. v19}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    new-array v7, v8, [F

    aput v12, v7, v5

    aput v4, v7, v2

    .line 29
    const-string v14, "alpha"

    move-object/from16 v20, v7

    invoke-static/range {v13 .. v20}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    move-result-object v2

    .line 30
    new-instance v4, Ll/va80;

    invoke-direct {v4, v0}, Ll/va80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V

    invoke-static {v2, v4}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 31
    filled-new-array {v1, v6}, [Landroid/animation/Animator;

    move-result-object v1

    .line 32
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v1

    filled-new-array {v3, v2}, [Landroid/animation/Animator;

    move-result-object v2

    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v2

    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    move-result-object v1

    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    .line 33
    new-instance v2, Ll/wa80;

    invoke-direct {v2, v0}, Ll/wa80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V

    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->h:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    :cond_b
    :goto_8
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->c:F

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->d:F

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 24
    .line 25
    new-instance v1, Ll/xa80;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/xa80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkScorllItemView;

    .line 34
    .line 35
    new-instance v1, Ll/ya80;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/ya80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setBroadCastInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->g:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->e:Z

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->f:I

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkUpDownScorllView;->m()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
