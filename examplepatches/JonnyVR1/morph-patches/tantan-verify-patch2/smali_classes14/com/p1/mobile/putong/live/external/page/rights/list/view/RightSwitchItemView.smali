.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;

.field public e:Lv/VText;

.field public f:Lv/VSwitch;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Ll/ycd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/j9d0;Ll/ycd0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/j9d0;->d(Ll/ycd0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/add0;->a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/ycd0;Ll/j9d0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->i:Ll/ycd0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->f:Lv/VSwitch;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ycd0;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->g:Landroid/view/View;

    .line 13
    .line 14
    new-instance v0, Ll/zcd0;

    .line 15
    .line 16
    invoke-direct {v0, p2, p1}, Ll/zcd0;-><init>(Ll/j9d0;Ll/ycd0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public k0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->f:Lv/VSwitch;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->i:Ll/ycd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ycd0;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightSwitchItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
