.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/d6m;


# static fields
.field public static final d:I

.field public static final e:I


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->f:I

    .line 2
    .line 3
    sput v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->d:I

    .line 4
    .line 5
    sget v0, Ll/qa00;->h:I

    .line 6
    .line 7
    sput v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->e:I

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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u6o;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    sget v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->d:I

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x3

    .line 12
    .line 13
    sub-int/2addr p2, v0

    .line 14
    sget v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->e:I

    .line 15
    .line 16
    mul-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    sub-int/2addr p2, v0

    .line 19
    div-int/lit8 p2, p2, 0x4

    .line 20
    .line 21
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    .line 23
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;I)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->c:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->iconUrl:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "context_square"

    .line 13
    .line 14
    invoke-static {v1, v0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    int-to-long p1, p2

    .line 18
    const-wide/16 v0, 0x2d

    .line 19
    .line 20
    mul-long v4, p1, v0

    .line 21
    .line 22
    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    .line 23
    .line 24
    invoke-direct {v8}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x2

    .line 28
    new-array v9, p1, [F

    .line 29
    .line 30
    fill-array-data v9, :array_0

    .line 31
    .line 32
    .line 33
    const-string v3, "alpha"

    .line 34
    .line 35
    const-wide/16 v6, 0x32

    .line 36
    .line 37
    move-object v2, p0

    .line 38
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    nop

    .line 47
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareMenuItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
