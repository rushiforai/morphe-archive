.class public Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public b:Lv/VText;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const-string v0, "dailySelectionAdCardViewClick"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C8(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    const-string v0, "selected_users_intro_card"

    .line 25
    .line 26
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qa(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "e_selected_users_intro_card"

    .line 30
    .line 31
    const-string p1, "p_suggest_users_home_view"

    .line 32
    .line 33
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l2c;->a(Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 3

    return-void

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Lc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->a:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 16
    .line 17
    const-string v1, "\u6bcf\u65e5\u7cbe\u9009"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/c17;->u0()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->c:Lv/VDraweeView;

    .line 31
    .line 32
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFENFRIUko2RzQ3NkVET1g1WEdGNzdIRzVGN0RCQTE0IiwidyI6OTkzLCJoIjo3OTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTA4OTE2NDk2MjM5NDY1Nzc5fQ.png"

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->c:Lv/VDraweeView;

    .line 41
    .line 42
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik4yUFlCSDRHQ1VaSEozVllITFlVWDY0NVUyT1pQTDE0IiwidyI6OTkzLCJoIjo3OTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjY2OTY5Nzk0MjEzNTU3NTMxfQ.png"

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->b:Lv/VText;

    .line 48
    .line 49
    invoke-static {}, Ll/c17;->u0()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const-string v0, "\u7537\u6027"

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const-string v0, "\u5973\u6027"

    .line 59
    .line 60
    :goto_1
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "\u5168\u5e73\u53f0\u7684\u4f18\u8d28%S\u90fd\u5728\u7b49\u4f60\uff0c\u53bb\u53d1\u73b0\u5fc3\u4eea\u7684\u4eba"

    .line 65
    .line 66
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 8
    .line 9
    new-instance v1, Ll/k2c;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/k2c;-><init>(Lcom/p1/mobile/putong/core/ui/home/view/DailySelectionAdCardView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
