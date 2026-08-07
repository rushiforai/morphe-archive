.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;
.super Lv/VRecyclerView;
.source "SourceFile"


# instance fields
.field public c:Ll/ds3;

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x42640000    # 57.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->d:I

    .line 11
    .line 12
    const/high16 p1, 0x41c80000    # 25.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->e:I

    .line 19
    .line 20
    invoke-static {}, Ll/bnl0;->y0()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    sub-int/2addr p1, v0

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    sub-int/2addr p1, v0

    .line 34
    div-int/lit8 p1, p1, 0x4

    .line 35
    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->f:I

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0, p1, p2}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42640000    # 57.0f

    .line 40
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->d:I

    const/high16 p1, 0x41c80000    # 25.0f

    .line 41
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->e:I

    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->f:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42640000    # 57.0f

    .line 44
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->d:I

    const/high16 p1, 0x41c80000    # 25.0f

    .line 45
    invoke-static {p1}, Ll/bnl0;->w(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->e:I

    .line 46
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->f:I

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->e:I

    return p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->f:I

    return p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->d:I

    return p0
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Ll/ds3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->c:Ll/ds3;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->L()Z

    move-result p0

    return p0
.end method

.method private init()V
    .locals 5

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x4

    .line 8
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 26
    .line 27
    .line 28
    const v1, -0x7f000001

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 32
    .line 33
    .line 34
    const/high16 v1, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Landroid/graphics/Rect;

    .line 45
    .line 46
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 47
    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v3, 0x6

    .line 51
    const-string v4, "height"

    .line 52
    .line 53
    invoke-virtual {v0, v4, v2, v3, v1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    int-to-float v1, v1

    .line 61
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;

    .line 62
    .line 63
    invoke-direct {v2, p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;FLandroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->c:Ll/ds3;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 72
    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method public final L()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->c:Ll/ds3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ds3;->y()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/dpt;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/dpt;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x1

    .line 17
    if-le p0, v0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public bridge synthetic getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->getAdapter()Ll/ds3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAdapter()Ll/ds3;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->c:Ll/ds3;

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ds3;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/ds3;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->c:Ll/ds3;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->init()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
