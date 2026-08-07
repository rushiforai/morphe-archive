.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final f:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/FrameLayout$LayoutParams;

.field public e:Landroid/animation/ObjectAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->f:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b()V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->n5:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    sget v0, Ll/mdc0;->T:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 24
    .line 25
    sget v0, Ll/mdc0;->Z6:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 34
    .line 35
    sget v0, Ll/mdc0;->o2:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lv/VDraweeView;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->c:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->d:Landroid/widget/FrameLayout$LayoutParams;

    .line 52
    .line 53
    return-void
.end method

.method public c(Ljava/lang/String;Z)V
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/raw/6e048cca-cfbb-433a-b787-d1c79ee8b71210.so"

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const-string v1, "https://auto.tancdn.com/v1/raw/b944a22f-e2f8-47dc-ac97-aa2d8e47a6ef11.so"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->d(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->c:Lv/VDraweeView;

    .line 20
    .line 21
    sget p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->f:I

    .line 22
    .line 23
    int-to-float p2, p2

    .line 24
    const/4 v0, 0x3

    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v3, 0x0

    .line 29
    aput v3, v0, v1

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    aput p2, v0, v1

    .line 33
    .line 34
    const/4 p2, 0x2

    .line 35
    aput v3, v0, p2

    .line 36
    .line 37
    sget-object p2, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 38
    .line 39
    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    const-wide/16 v3, 0xa28

    .line 46
    .line 47
    invoke-virtual {p1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    new-instance p2, Landroid/view/animation/LinearInterpolator;

    .line 53
    .line 54
    invoke-direct {p2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 61
    .line 62
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->e:Landroid/animation/ObjectAnimator;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public d(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/high16 v0, 0x43020000    # 130.0f

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/high16 v0, 0x43200000    # 160.0f

    .line 7
    .line 8
    :goto_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    const/high16 p2, 0x41c80000    # 25.0f

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/high16 p2, 0x41200000    # 10.0f

    .line 18
    .line 19
    :goto_1
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->d:Landroid/widget/FrameLayout$LayoutParams;

    .line 24
    .line 25
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 26
    .line 27
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 28
    .line 29
    iput p2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->c:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->c:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-static {p1}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    xor-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    const-string p2, "context_single_room"

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/scrap/widget/ScrapTargetShowView;->c:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {p2, p0, p1, v0, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
