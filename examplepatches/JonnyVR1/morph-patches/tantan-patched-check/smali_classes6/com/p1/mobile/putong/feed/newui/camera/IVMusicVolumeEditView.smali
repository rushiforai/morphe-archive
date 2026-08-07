.class public Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/SeekBar;

.field public g:Ll/kz10;

.field public h:Ll/x20;

.field public i:I

.field public j:I


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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e8m;->a(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/b8m;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/b8m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/c8m;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/c8m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->c:Landroid/widget/ImageView;

    .line 22
    .line 23
    new-instance v1, Ll/d8m;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/d8m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 32
    .line 33
    const/16 v1, 0x64

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 46
    .line 47
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 30
    .line 31
    div-int/lit8 p0, p0, 0x2

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ll/kz10;->b(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 30
    .line 31
    div-int/lit8 p0, p0, 0x2

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ll/kz10;->b(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 34
    .line 35
    div-int/lit8 p0, p0, 0x2

    .line 36
    .line 37
    invoke-interface {p1, p0}, Ll/kz10;->b(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public l(ZLcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    .line 25
    .line 26
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 34
    .line 35
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->i:I

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setCurrentVolumeValue(I)V
    .locals 1

    .line 1
    mul-int/lit8 p1, p1, 0x2

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f:Landroid/widget/SeekBar;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e:Landroid/widget/TextView;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->j:I

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
