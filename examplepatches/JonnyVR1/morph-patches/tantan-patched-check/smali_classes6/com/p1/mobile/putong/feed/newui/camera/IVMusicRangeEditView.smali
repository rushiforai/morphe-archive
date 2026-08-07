.class public Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/ImageView;

.field public f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Ll/kz10;

.field public j:Ll/x20;

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public p:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;


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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->g(Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a8m;->a(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

    .line 2
    .line 3
    new-instance v1, Ll/w7m;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w7m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setListener(Ll/z20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->e:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/x7m;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/x7m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->a:Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/y7m;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/y7m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->c:Landroid/widget/ImageView;

    .line 32
    .line 33
    new-instance v1, Ll/z7m;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/z7m;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic g(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->k:I

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->l:I

    .line 12
    .line 13
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 14
    .line 15
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->k:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->e:Landroid/widget/ImageView;

    .line 18
    .line 19
    if-eq p1, p2, :cond_0

    .line 20
    .line 21
    sget p1, Ll/lbc0;->D5:I

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget p1, Ll/lbc0;->E5:I

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 41
    .line 42
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->k:I

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->l:I

    .line 45
    .line 46
    invoke-interface {p1, p2, p0}, Ll/kz10;->a(II)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->k:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 4
    .line 5
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->l:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->n:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->n:I

    .line 22
    .line 23
    invoke-interface {p1, v0, v1}, Ll/kz10;->a(II)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 23
    .line 24
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->n:I

    .line 27
    .line 28
    invoke-interface {p1, v0, p0}, Ll/kz10;->a(II)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->i:Ll/kz10;

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->n:I

    .line 14
    .line 15
    invoke-interface {p1, v0, v1}, Ll/kz10;->a(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 27
    .line 28
    invoke-interface {p0}, Ll/x20;->call()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;J)V
    .locals 6

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->o:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->p:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->n:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->d:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v2, p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->d:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-static {v1}, Ll/bnl0;->z(Landroid/widget/TextView;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->h:Landroid/widget/TextView;

    .line 23
    .line 24
    iget-wide v2, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 25
    .line 26
    const-wide/16 v4, 0x3e8

    .line 27
    .line 28
    div-long/2addr v2, v4

    .line 29
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v2, "\u5df2\u9009\u53d6%s\u79d2\u97f3\u9891"

    .line 38
    .line 39
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setStartTime(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

    .line 52
    .line 53
    iget p2, p2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->length:I

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setMusicLength(I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

    .line 59
    .line 60
    long-to-int p1, p3

    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setVideoLength(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->o:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->p:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->m:I

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/IVMusicRangeSeekView;->setStartTime(I)V

    .line 15
    .line 16
    .line 17
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicRangeEditView;->j:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
