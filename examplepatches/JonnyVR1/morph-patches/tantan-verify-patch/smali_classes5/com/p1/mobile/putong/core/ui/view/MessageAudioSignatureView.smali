.class public Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VImage;

.field public c:Lcom/sunshine/engine/bone/StageView;

.field public d:Lcom/p1/mobile/putong/data/AudioSignature;

.field public e:Lcom/p1/mobile/android/media/AudioPlayer;

.field public f:Ll/kcg0;

.field public g:Z

.field public h:Ll/z4z;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
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

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->c(Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    return-void
.end method

.method public static b(F)I
    .locals 1

    .line 1
    const/high16 v0, 0x41e80000    # 29.0f

    .line 2
    .line 3
    cmpl-float v0, p0, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0x1e

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method


# virtual methods
.method public final synthetic c(Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->preparing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->g:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->h:Ll/z4z;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/jxy;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->d:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->b(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->a:Lv/VText;

    .line 24
    .line 25
    invoke-direct {p1, v0, v2}, Ll/jxy;-><init>(ILandroid/widget/TextView;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->h:Ll/z4z;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/z4z;->a()V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->b:Lv/VImage;

    .line 34
    .line 35
    sget v0, Ll/ibc0;->a7:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->c:Lcom/sunshine/engine/bone/StageView;

    .line 41
    .line 42
    const/high16 p1, 0x3f800000    # 1.0f

    .line 43
    .line 44
    const/16 v0, 0x3e8

    .line 45
    .line 46
    invoke-virtual {p0, v1, p1, v0}, Lcom/sunshine/engine/bone/StageView;->h(FFI)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 51
    .line 52
    if-eq p1, v0, :cond_2

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 55
    .line 56
    if-ne p1, v0, :cond_4

    .line 57
    .line 58
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->g:Z

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 63
    .line 64
    if-ne p1, v0, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->h:Ll/z4z;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/z4z;->stop()V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->h:Ll/z4z;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->c:Lcom/sunshine/engine/bone/StageView;

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Lcom/sunshine/engine/bone/StageView;->setPercent(F)V

    .line 77
    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->g:Z

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->b:Lv/VImage;

    .line 83
    .line 84
    sget v0, Ll/ibc0;->b7:I

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->a:Lv/VText;

    .line 90
    .line 91
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->d:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 96
    .line 97
    iget p0, p0, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 98
    .line 99
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->b(F)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string v1, "%d s"

    .line 112
    .line 113
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/android/media/AudioPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->e:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/AudioPlayer;->obs()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/kxy;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/kxy;-><init>(Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->f:Ll/kcg0;

    .line 45
    .line 46
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->e:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/AudioPlayer;->destroy()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->e:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageAudioSignatureView;->f:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
