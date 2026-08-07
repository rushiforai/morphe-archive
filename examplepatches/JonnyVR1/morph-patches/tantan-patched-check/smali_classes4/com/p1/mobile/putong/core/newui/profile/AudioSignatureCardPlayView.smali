.class public Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;
.super Lv/VRelative;
.source "SourceFile"


# static fields
.field public static t:Ljava/lang/String; = ""


# instance fields
.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lcom/sunshine/engine/particle/SceneView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Z

.field public j:Ll/kcg0;

.field public k:Ll/kcg0;

.field public l:Lcom/p1/mobile/android/media/AudioPlayer;

.field public m:Z

.field public n:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/lang/String;

.field public p:Lcom/p1/mobile/putong/data/AudioSignature;

.field public q:Z

.field public r:Landroid/view/View$OnClickListener;

.field public s:Ll/qrb;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->m:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->n:Lrx/subjects/a;

    .line 12
    .line 13
    const-string p2, ""

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->o:Ljava/lang/String;

    .line 16
    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->q:Z

    .line 18
    .line 19
    new-instance p1, Ll/gd1;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/gd1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r:Landroid/view/View$OnClickListener;

    .line 25
    .line 26
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/adc0;->nc:I

    .line 6
    .line 7
    const-string v1, "\u5bf9\u65b9\u6dfb\u52a0\u4e86\u8bed\u97f3\u7b7e\u540d\uff0c\u9644\u8fd1\u7684\u4eba\u4f18\u5148\u770b\u5230 ta\uff01"

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->q:Z

    .line 12
    .line 13
    if-eqz p0, :cond_5

    .line 14
    .line 15
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget v0, Ll/adc0;->j5:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->q:Z

    .line 24
    .line 25
    if-eqz p0, :cond_5

    .line 26
    .line 27
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget v0, Ll/adc0;->A1:I

    .line 32
    .line 33
    if-ne p1, v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->d:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    const/4 p1, 0x4

    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    sget v0, Ll/adc0;->N:I

    .line 43
    .line 44
    if-ne p1, v0, :cond_5

    .line 45
    .line 46
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->i:Z

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->l:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->finish()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_4

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->l:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->p:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AudioSignature;->url:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/media/AudioPlayer;->play(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 73
    .line 74
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 75
    .line 76
    .line 77
    :cond_5
    return-void
.end method

.method public static getFirstSuggestedUserId()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Ljava/util/Random;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->L(Ljava/util/Random;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->I(Lcom/p1/mobile/android/media/AudioPlayer$State;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->B(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->d:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->h:Lv/VText;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r:Landroid/view/View$OnClickListener;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r:Landroid/view/View$OnClickListener;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->e:Lv/VImage;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r:Landroid/view/View$OnClickListener;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->g:Lv/VText;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r:Landroid/view/View$OnClickListener;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static setFirstSuggestedUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->H(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jd1;->a(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->preparing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->i:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->n:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->g:Lv/VText;

    .line 17
    .line 18
    sget v0, Ll/dbc0;->Fs:I

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->s:Ll/qrb;

    .line 24
    .line 25
    if-nez p1, :cond_3

    .line 26
    .line 27
    new-instance p1, Ll/ld1;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->p:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 30
    .line 31
    iget v0, v0, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 32
    .line 33
    invoke-static {v0}, Ll/fd1;->a(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->g:Lv/VText;

    .line 38
    .line 39
    invoke-direct {p1, v0, v1}, Ll/ld1;-><init>(ILandroid/widget/TextView;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->s:Ll/qrb;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/qrb;->a()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 49
    .line 50
    if-eq p1, v0, :cond_1

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 53
    .line 54
    if-ne p1, v0, :cond_3

    .line 55
    .line 56
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->i:Z

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 61
    .line 62
    if-ne p1, v0, :cond_2

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->s:Ll/qrb;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/qrb;->stop()V

    .line 67
    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->s:Ll/qrb;

    .line 71
    .line 72
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->i:Z

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->g:Lv/VText;

    .line 75
    .line 76
    sget v0, Ll/dbc0;->Es:I

    .line 77
    .line 78
    invoke-virtual {p1, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->g:Lv/VText;

    .line 82
    .line 83
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->p:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 88
    .line 89
    iget p0, p0, Lcom/p1/mobile/putong/data/AudioSignature;->duration:F

    .line 90
    .line 91
    invoke-static {p0}, Ll/fd1;->a(F)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string v1, "%d s"

    .line 104
    .line 105
    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    return-void
.end method

.method public final synthetic L(Ljava/util/Random;Ljava/lang/Long;)V
    .locals 1

    .line 1
    const/4 p2, 0x5

    .line 2
    invoke-virtual {p1, p2}, Ljava/util/Random;->nextInt(I)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    add-int/lit8 p1, p1, 0x11

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->h:Lv/VText;

    .line 9
    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    int-to-float p1, p1

    .line 15
    const/high16 v0, 0x41200000    # 10.0f

    .line 16
    .line 17
    div-float/2addr p1, v0

    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "%sx"

    .line 27
    .line 28
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 4

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->l:Lcom/p1/mobile/android/media/AudioPlayer;

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
    new-instance v1, Ll/hd1;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/hd1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;)V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->k:Ll/kcg0;

    .line 45
    .line 46
    new-instance v0, Ljava/util/Random;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 49
    .line 50
    .line 51
    const-wide/16 v1, 0x1

    .line 52
    .line 53
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 54
    .line 55
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Ll/id1;

    .line 72
    .line 73
    invoke-direct {v2, p0, v0}, Ll/id1;-><init>(Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;Ljava/util/Random;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->j:Ll/kcg0;

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 87
    .line 88
    const-string v1, "animations/boost/config.xml"

    .line 89
    .line 90
    const-string v2, "animations/boost/pic"

    .line 91
    .line 92
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->f:Lcom/sunshine/engine/particle/SceneView;

    .line 100
    .line 101
    const/4 v0, 0x1

    .line 102
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/AnimView;->b(Z)Lcom/sunshine/engine/base/AnimView;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->l:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/AudioPlayer;->destroy()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->l:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->k:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->j:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/AudioSignatureCardPlayView;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
