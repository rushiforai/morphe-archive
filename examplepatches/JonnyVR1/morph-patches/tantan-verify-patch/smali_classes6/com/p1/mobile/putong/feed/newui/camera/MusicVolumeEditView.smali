.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/SeekBar;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/SeekBar;

.field public g:Landroid/widget/TextView;

.field public h:Ll/kz10;

.field public i:Ll/x20;

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q120;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/p120;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/p120;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 19
    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 26
    .line 27
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$a;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->i:Ll/x20;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->i:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public i(II)V
    .locals 0

    .line 1
    mul-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    .line 4
    .line 5
    mul-int/lit8 p2, p2, 0x2

    .line 6
    .line 7
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 15
    .line 16
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->d:Landroid/widget/TextView;

    .line 22
    .line 23
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    .line 24
    .line 25
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->g:Landroid/widget/TextView;

    .line 33
    .line 34
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public j(ZLcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 20
    .line 21
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    .line 26
    .line 27
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 35
    .line 36
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->j:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->c:Landroid/widget/SeekBar;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->g:Landroid/widget/TextView;

    .line 47
    .line 48
    if-nez p2, :cond_1

    .line 49
    .line 50
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 63
    .line 64
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 69
    .line 70
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 78
    .line 79
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->k:I

    .line 80
    .line 81
    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->g()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->i:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
