.class public Ll/sa3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/qa3;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/vcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vcj<",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p3, p4}, Ll/ra3;->a(IZ)Ll/qa3;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    iput-object p3, p0, Ll/sa3;->a:Ll/qa3;

    .line 11
    .line 12
    invoke-interface {p3, p1, p2}, Ll/qa3;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/CharSequence;IIIZ)Landroid/view/View;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/sa3;->d:Ll/vcj;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    iget-object p0, v0, Ll/sa3;->d:Ll/vcj;

    .line 19
    .line 20
    iget-object v0, v0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p4

    .line 34
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p5

    .line 38
    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object p6

    .line 42
    invoke-interface/range {p0 .. p6}, Ll/vcj;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Landroid/view/View;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sa3;->a:Ll/qa3;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qa3;->b()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sa3;->a:Ll/qa3;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qa3;->e()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/y20;Ll/vcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;",
            "Ll/vcj<",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sa3;->c:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sa3;->d:Ll/vcj;

    .line 4
    .line 5
    return-void
.end method

.method public e(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sa3;->c:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/sa3;->c:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Landroid/view/View;I)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/sa3;->b()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sa3;->b()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->setCenterIconWidth(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public g(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/sa3;->b()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lv/VImage;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sa3;->b()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public h(Lcom/sunshine/engine/particle/SceneView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sa3;->a:Ll/qa3;

    .line 2
    .line 3
    instance-of v0, p0, Ll/wm3;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/wm3;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/wm3;->j(Lcom/sunshine/engine/particle/SceneView;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public i()Landroid/view/View;
    .locals 7

    .line 1
    sget v1, Ll/gbc0;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->g:I

    .line 6
    .line 7
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/16 v5, 0xfa0

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    const/16 v4, 0xe

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    invoke-virtual/range {v0 .. v6}, Ll/sa3;->a(ILjava/lang/CharSequence;IIIZ)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public j(I)Landroid/view/View;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->k:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/sa3;->b:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget v1, Ll/f9c0;->h:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {p1, v0, v1}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    sget v3, Ll/gbc0;->e6:I

    .line 35
    .line 36
    const-string p1, "#d3d2cc"

    .line 37
    .line 38
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    const/4 v7, -0x1

    .line 43
    const/4 v8, 0x0

    .line 44
    const/16 v6, 0x14

    .line 45
    .line 46
    move-object v2, p0

    .line 47
    invoke-virtual/range {v2 .. v8}, Ll/sa3;->a(ILjava/lang/CharSequence;IIIZ)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sa3;->a:Ll/qa3;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p0, v0}, Ll/qa3;->c(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l(Ljava/lang/CharSequence;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sa3;->a:Ll/qa3;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-interface {v0, v1}, Ll/qa3;->c(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/sa3;->a:Ll/qa3;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/qa3;->d(Ljava/lang/CharSequence;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
