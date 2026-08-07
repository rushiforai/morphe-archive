.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagExpandedLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomExpandedBasicInfoView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/view/CardLabelShowView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aj4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagExpandedLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagExpandedLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagExpandedLayout;->g:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->setMostLine(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomTagExpandedLayout;->g:Lcom/p1/mobile/putong/core/view/CardLabelShowView;

    .line 14
    .line 15
    const-string v0, "#FB26B8"

    .line 16
    .line 17
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "#F63074"

    .line 22
    .line 23
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e(II)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
