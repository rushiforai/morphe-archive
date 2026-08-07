.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;
.super Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;
.source "SourceFile"


# instance fields
.field public l:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

.field public m:Landroid/widget/FrameLayout;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VSlider;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getHideAimHeight()I
    .locals 1

    .line 1
    const/high16 p0, 0x42500000    # 52.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x41f00000    # 30.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/2addr p0, v0

    .line 14
    const/high16 v0, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/2addr p0, v0

    .line 21
    return p0
.end method

.method public getShowAnimHeight()I
    .locals 1

    .line 1
    const/high16 p0, 0x42500000    # 52.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x41f00000    # 30.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/2addr p0, v0

    .line 14
    const/high16 v0, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/2addr p0, v0

    .line 21
    return p0
.end method

.method public k(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;->t(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;->l:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;->m:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;->n:Landroid/widget/TextView;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->c:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;->o:Lv/VSlider;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->d:Lv/VSlider;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->l()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xl40;->b(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUiHiddenNearByView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
