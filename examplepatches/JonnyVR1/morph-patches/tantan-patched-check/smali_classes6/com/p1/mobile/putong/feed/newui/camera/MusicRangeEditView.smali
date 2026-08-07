.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

.field public d:Ll/kz10;

.field public e:Ll/x20;

.field public f:I

.field public g:I

.field public h:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public i:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v020;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

    .line 2
    .line 3
    new-instance v1, Ll/s020;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/s020;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;->setListener(Ll/z20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/t020;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/t020;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->a:Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/u020;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u020;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic f(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 22
    .line 23
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 26
    .line 27
    invoke-interface {p1, p2, p0}, Ll/kz10;->a(II)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic g(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 14
    .line 15
    invoke-interface {p1, v0, v1}, Ll/kz10;->a(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e:Ll/x20;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e:Ll/x20;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/x20;->call()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->j:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 4
    .line 5
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->k:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d:Ll/kz10;

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->j:I

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->k:I

    .line 22
    .line 23
    invoke-interface {p1, v0, v1}, Ll/kz10;->a(II)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e:Ll/x20;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e:Ll/x20;

    .line 39
    .line 40
    invoke-interface {p0}, Ll/x20;->call()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;J)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->h:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->i:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 7
    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;->setStartTime(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

    .line 16
    .line 17
    iget p2, p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;->setMusicLength(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

    .line 23
    .line 24
    long-to-int p1, p3

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;->setVideoLength(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->h:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->i:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->f:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->j:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->g:I

    .line 15
    .line 16
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->k:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MusicRangeSeekView;->setStartTime(I)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicRangeEditView;->e:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
