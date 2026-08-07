.class public Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/newui/main/view/LinearLayoutFixedLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public i:Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;

.field public j:Lv/VImage;

.field public k:Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VDraweeView;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public q:Lv/VLinear;

.field public r:Lv/VDraweeView;

.field public s:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public t:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public u:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public v:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;->v:Z

    .line 6
    .line 7
    return-void
.end method

.method private varargs setUsTagBg([Landroid/view/View;)V
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_1

    .line 4
    .line 5
    aget-object v1, p1, v0

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v2, Ll/dbc0;->U2:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fn4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentViewV2;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
