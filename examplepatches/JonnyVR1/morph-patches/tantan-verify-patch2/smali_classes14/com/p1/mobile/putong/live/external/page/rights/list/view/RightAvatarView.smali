.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/c5m;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public h:Lv/VText;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/VText;

.field public k:Lv/VButton;

.field public l:Ll/d9d0;

.field public m:Ll/o9d0;


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
    new-instance p1, Ll/o9d0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/o9d0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    .line 10
    .line 11
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

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/o9d0;

    invoke-direct {p1}, Ll/o9d0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/o9d0;

    invoke-direct {p1}, Ll/o9d0;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c9d0;->a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x41f00000    # 30.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    div-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->j:Lv/VText;

    .line 15
    .line 16
    const/high16 v1, 0x41c00000    # 24.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    sub-int/2addr v0, v1

    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->l:Ll/d9d0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/o9d0;->g(Ll/d9d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->l:Ll/d9d0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/o9d0;->g(Ll/d9d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Ll/d9d0;Ll/j9d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->l:Ll/d9d0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/o9d0;->o(Ll/d9d0;Ll/j9d0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic getCommonIconView()Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/c5m;->getCommonIconView()Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    move-result-object p0

    return-object p0
.end method

.method public getCraftButton()Lv/VButton;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->k:Lv/VButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDescLayout()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDynamicIcon()Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightArrowView()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->e:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightContentView()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightDescView()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->j:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightDurationView()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->c:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightIconView()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightLockIconView()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->d:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightTitleView()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->h:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->b()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightAvatarView;->m:Ll/o9d0;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/o9d0;->d(Ll/c5m;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
