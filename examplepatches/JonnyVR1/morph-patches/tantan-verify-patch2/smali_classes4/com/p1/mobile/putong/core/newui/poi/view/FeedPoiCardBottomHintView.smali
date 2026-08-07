.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static final c:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

.field public b:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42340000    # 45.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->c:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hph;->a(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(F)I
    .locals 1

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->c:I

    .line 2
    .line 3
    int-to-float v0, p0

    .line 4
    mul-float/2addr v0, p1

    .line 5
    float-to-int p1, v0

    .line 6
    sub-int/2addr p1, p0

    .line 7
    return p1
.end method

.method public c(F)I
    .locals 1

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->c:I

    .line 2
    .line 3
    int-to-float v0, p0

    .line 4
    mul-float/2addr v0, p1

    .line 5
    float-to-int p1, v0

    .line 6
    sub-int/2addr p0, p1

    .line 7
    return p0
.end method

.method public d(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->b:Landroid/widget/ImageView;

    .line 5
    .line 6
    sget p1, Ll/dbc0;->dk:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x2

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->b:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget p1, Ll/dbc0;->ck:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
