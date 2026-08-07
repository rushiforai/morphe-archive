.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Ljava/lang/String;


# direct methods
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->g(Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jz10;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final d(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->Z0:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->x0:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->w0:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final e(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "local"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "fav"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    const-string p0, "hot"

    .line 19
    .line 20
    return-object p0
.end method

.method public f(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/iz10;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/iz10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic g(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->e(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicCenterAct;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->a:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->d(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->a:Landroid/widget/TextView;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string p1, "#ff3a00"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p1, "#7c7c7c"

    .line 34
    .line 35
    :goto_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicMiddleBarView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
