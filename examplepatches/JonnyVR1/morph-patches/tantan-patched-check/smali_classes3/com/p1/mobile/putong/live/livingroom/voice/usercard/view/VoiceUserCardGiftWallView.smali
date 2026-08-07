.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:I

.field public j:Landroid/animation/Animator;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->i:I

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->n:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->i:I

    .line 17
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->n:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->i:I

    .line 20
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->n:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->j:Landroid/animation/Animator;

    return-object p0
.end method


# virtual methods
.method public getCurrentGiftLayout()Lv/VLinear;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->m:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->g:Lv/VLinear;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->h:Lv/VLinear;

    .line 11
    .line 12
    return-object p0
.end method

.method public getCurrentTitleView()Lv/VText;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->m:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->d:Lv/VText;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->e:Lv/VText;

    .line 11
    .line 12
    return-object p0
.end method

.method public getOtherGiftLayout()Lv/VLinear;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->m:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->h:Lv/VLinear;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->g:Lv/VLinear;

    .line 11
    .line 12
    return-object p0
.end method

.method public getOtherGroup()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->m:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->l:Landroid/view/View;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object v1
.end method

.method public getOtherTitleView()Lv/VText;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->m:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->e:Lv/VText;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->d:Lv/VText;

    .line 11
    .line 12
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->N6:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->d:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->O6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->d8:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->f:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->i2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VLinear;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->g:Lv/VLinear;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->j2:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VLinear;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->h:Lv/VLinear;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->u2:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->k:Landroid/view/View;

    .line 61
    .line 62
    sget v0, Ll/mdc0;->v2:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardGiftWallView;->l:Landroid/view/View;

    .line 69
    .line 70
    return-void
.end method
