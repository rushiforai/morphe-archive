.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VLinear_FillerMeasure;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/view/View;


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
    invoke-static {p0, p1}, Ll/oqh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;->d:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;->k:Landroid/view/View;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
