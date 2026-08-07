.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Ll/jad0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;Ll/jad0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->j0(Ll/jad0;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lad0;->a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j0(Ll/jad0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p2, p1, Ll/jad0;->b:Z

    .line 2
    .line 3
    xor-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    iput-boolean p2, p1, Ll/jad0;->b:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->l0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k0(Ll/jad0;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->h:Ll/jad0;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->e:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v1, p1, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->avatar:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "context_right_act"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->f:Lv/VText;

    .line 15
    .line 16
    iget-object v1, p1, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->l0()V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/kad0;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Ll/kad0;-><init>(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;Ll/jad0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final l0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->g:Lv/VImage;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->h:Ll/jad0;

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/jad0;->b:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget p0, Ll/nbc0;->d:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p0, Ll/nbc0;->c:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipAnchorItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
