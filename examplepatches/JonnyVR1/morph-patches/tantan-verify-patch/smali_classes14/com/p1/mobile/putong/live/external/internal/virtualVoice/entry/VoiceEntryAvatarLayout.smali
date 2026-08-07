.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field private multipleChatIconView:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

.field private tagGroup:Landroid/widget/FrameLayout;

.field private tagView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    invoke-virtual {p0, p2}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget p2, Ll/xec0;->V1:I

    .line 13
    .line 14
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    sget p1, Ll/ldc0;->w:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->multipleChatIconView:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 26
    .line 27
    sget p1, Ll/ldc0;->N1:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/widget/FrameLayout;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    sget p1, Ll/ldc0;->M1:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Landroid/widget/TextView;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagView:Landroid/widget/TextView;

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public h0(Ljava/util/List;F)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;F)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->multipleChatIconView:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->setRadius(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->multipleChatIconView:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->p0(Ljava/util/List;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public i0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagView:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagView:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/16 p1, 0x8

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Path;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Landroid/graphics/RectF;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getX()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/view/View;->getY()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/view/View;->getX()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    int-to-float v5, v5

    .line 46
    add-float/2addr v4, v5

    .line 47
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {v5}, Landroid/view/View;->getY()F

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->tagGroup:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    int-to-float p0, p0

    .line 60
    add-float/2addr v5, p0

    .line 61
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 62
    .line 63
    .line 64
    sget p0, Ll/qa00;->e:I

    .line 65
    .line 66
    int-to-float v2, p0

    .line 67
    int-to-float p0, p0

    .line 68
    sget-object v3, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 71
    .line 72
    .line 73
    sget-object p0, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    .line 74
    .line 75
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method
