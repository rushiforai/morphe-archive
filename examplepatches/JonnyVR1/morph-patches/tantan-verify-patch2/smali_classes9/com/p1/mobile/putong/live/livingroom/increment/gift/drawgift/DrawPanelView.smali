.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Bitmap;

.field public b:Landroid/graphics/Canvas;

.field public c:Landroid/graphics/Paint;

.field public d:I

.field public e:I

.field public f:F

.field public g:F

.field public h:F

.field public i:Landroid/graphics/Bitmap;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public k:Landroid/graphics/Rect;

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePosition;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePosition;",
            ">;>;"
        }
    .end annotation
.end field

.field public n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public o:I

.field public p:I

.field public q:Landroid/animation/ValueAnimator;

.field public r:Landroid/graphics/RectF;

.field public s:Z

.field public t:I

.field public u:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41f00000    # 30.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 38
    .line 39
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/vwt;->f4()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41f00000    # 30.0f

    .line 54
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 56
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 57
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    const/4 p1, 0x0

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 60
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p1

    invoke-virtual {p1}, Ll/vwt;->f4()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 62
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41f00000    # 30.0f

    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 65
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 66
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    const/4 p1, 0x0

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    const/4 p1, 0x1

    .line 68
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 69
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object p1

    invoke-virtual {p1}, Ll/vwt;->f4()I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o()V

    return-void
.end method

.method public static synthetic a(FFFLcom/p1/mobile/putong/live/base/data/BLivePosition;)V
    .locals 1

    .line 1
    iget v0, p3, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 2
    .line 3
    mul-float/2addr v0, p0

    .line 4
    add-float/2addr v0, p1

    .line 5
    iput v0, p3, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 6
    .line 7
    iget p1, p3, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 8
    .line 9
    mul-float/2addr p1, p0

    .line 10
    add-float/2addr p1, p2

    .line 11
    iput p1, p3, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    return-object p0
.end method

.method private getGiftList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePosition;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final f(IIZI)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 8
    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->X4:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    int-to-float p1, p1

    .line 43
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 44
    .line 45
    const/high16 v1, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float v2, v0, v1

    .line 48
    .line 49
    cmpg-float v2, p1, v2

    .line 50
    .line 51
    if-lez v2, :cond_3

    .line 52
    .line 53
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d:I

    .line 54
    .line 55
    int-to-float v2, v2

    .line 56
    div-float v3, v0, v1

    .line 57
    .line 58
    sub-float/2addr v2, v3

    .line 59
    cmpl-float v2, p1, v2

    .line 60
    .line 61
    if-ltz v2, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    int-to-float p2, p2

    .line 65
    div-float v2, v0, v1

    .line 66
    .line 67
    cmpg-float v2, p2, v2

    .line 68
    .line 69
    if-lez v2, :cond_3

    .line 70
    .line 71
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e:I

    .line 72
    .line 73
    int-to-float v2, v2

    .line 74
    div-float/2addr v0, v1

    .line 75
    sub-float/2addr v2, v0

    .line 76
    cmpl-float v0, p2, v2

    .line 77
    .line 78
    if-ltz v0, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u(ZI)V

    .line 82
    .line 83
    .line 84
    const/4 p3, 0x1

    .line 85
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->k(FFZ)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_0
    return-void
.end method

.method public final g(FF)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 7
    .line 8
    iput p2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getDrawParam()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->getGiftList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e:I

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->imgUrl:Ljava/lang/String;

    .line 24
    .line 25
    return-object v0
.end method

.method public h()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->clear()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u(ZI)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final j(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePosition;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k(FFZ)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr v0, v1

    .line 6
    float-to-int v0, v0

    .line 7
    int-to-float v0, v0

    .line 8
    sub-float v1, p1, v0

    .line 9
    .line 10
    sub-float v2, p2, v0

    .line 11
    .line 12
    add-float v3, p1, v0

    .line 13
    .line 14
    add-float/2addr v0, p2

    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->r:Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-virtual {v4, v1, v2, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->b:Landroid/graphics/Canvas;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->k:Landroid/graphics/Rect;

    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->r:Landroid/graphics/RectF;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 31
    .line 32
    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f:F

    .line 34
    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->g:F

    .line 36
    .line 37
    if-eqz p3, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->g(FF)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->p:I

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ll/vwt;->k4()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    mul-int/2addr v1, v2

    .line 31
    filled-new-array {v0, v1}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    int-to-long v1, v1

    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d:I

    .line 47
    .line 48
    int-to-float v1, v0

    .line 49
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 50
    .line 51
    div-float/2addr v1, v2

    .line 52
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e:I

    .line 53
    .line 54
    int-to-float v4, v3

    .line 55
    iget v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 56
    .line 57
    div-float/2addr v4, v5

    .line 58
    cmpl-float v6, v1, v4

    .line 59
    .line 60
    const/high16 v7, 0x40000000    # 2.0f

    .line 61
    .line 62
    if-lez v6, :cond_1

    .line 63
    .line 64
    int-to-float v0, v0

    .line 65
    mul-float/2addr v2, v4

    .line 66
    sub-float/2addr v0, v2

    .line 67
    div-float/2addr v0, v7

    .line 68
    int-to-float v1, v3

    .line 69
    mul-float/2addr v5, v4

    .line 70
    sub-float/2addr v1, v5

    .line 71
    div-float/2addr v1, v7

    .line 72
    move v2, v1

    .line 73
    move v1, v4

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    int-to-float v0, v0

    .line 76
    mul-float/2addr v2, v1

    .line 77
    sub-float/2addr v0, v2

    .line 78
    div-float/2addr v0, v7

    .line 79
    int-to-float v2, v3

    .line 80
    mul-float/2addr v5, v1

    .line 81
    sub-float/2addr v2, v5

    .line 82
    div-float/2addr v2, v7

    .line 83
    :goto_0
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 84
    .line 85
    new-instance v4, Ll/fce;

    .line 86
    .line 87
    invoke-direct {v4, v1, v0, v2}, Ll/fce;-><init>(FFF)V

    .line 88
    .line 89
    .line 90
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    new-instance v1, Ll/gce;

    .line 96
    .line 97
    invoke-direct {v1, p0, p1}, Ll/gce;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 109
    .line 110
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;

    .line 111
    .line 112
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final m(FF)V
    .locals 10

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->g:F

    .line 5
    .line 6
    sub-float/2addr p2, v0

    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->n(FF)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 12
    .line 13
    float-to-double v2, v2

    .line 14
    div-double v2, v0, v2

    .line 15
    .line 16
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    float-to-double v4, p1

    .line 21
    div-double/2addr v4, v0

    .line 22
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 23
    .line 24
    float-to-double v6, p1

    .line 25
    mul-double/2addr v4, v6

    .line 26
    float-to-double v6, p2

    .line 27
    div-double/2addr v6, v0

    .line 28
    float-to-double p1, p1

    .line 29
    mul-double/2addr v6, p1

    .line 30
    const/4 p1, 0x1

    .line 31
    move p2, p1

    .line 32
    :goto_0
    int-to-long v0, p2

    .line 33
    cmp-long v0, v0, v2

    .line 34
    .line 35
    if-gez v0, :cond_0

    .line 36
    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f:F

    .line 38
    .line 39
    float-to-double v0, v0

    .line 40
    add-double/2addr v0, v4

    .line 41
    double-to-float v0, v0

    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->g:F

    .line 43
    .line 44
    float-to-double v8, v1

    .line 45
    add-double/2addr v8, v6

    .line 46
    double-to-float v1, v8

    .line 47
    float-to-int v0, v0

    .line 48
    float-to-int v1, v1

    .line 49
    invoke-virtual {p0, v0, v1, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f(IIZI)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 p2, p2, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-void
.end method

.method public final n(FF)D
    .locals 0

    .line 1
    mul-float/2addr p1, p1

    .line 2
    mul-float/2addr p2, p2

    .line 3
    add-float/2addr p1, p2

    .line 4
    float-to-double p0, p1

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public final o()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 13
    .line 14
    const-string v1, "#D81B60"

    .line 15
    .line 16
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 24
    .line 25
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/high16 v1, 0x40000000    # 2.0f

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->r:Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->x()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->c:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e:I

    .line 7
    .line 8
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    if-eq p1, v1, :cond_2

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    if-eq p1, v3, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m(FF)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->w()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    if-nez p1, :cond_4

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->p()V

    .line 42
    .line 43
    .line 44
    :cond_4
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f:F

    .line 45
    .line 46
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->g:F

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    float-to-int p1, v0

    .line 54
    float-to-int v0, v2

    .line 55
    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->f(IIZI)V

    .line 56
    .line 57
    .line 58
    :goto_0
    return v1
.end method

.method public final p()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->d:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->e:I

    .line 4
    .line 5
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Canvas;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->b:Landroid/graphics/Canvas;

    .line 21
    .line 22
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->p:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic s(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->x()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->setGiftBitmap(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setGiftBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h:F

    .line 2
    .line 3
    float-to-int v1, v0

    .line 4
    float-to-int v0, v0

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p1, v1, v0, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    new-instance p1, Landroid/graphics/Rect;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->k:Landroid/graphics/Rect;

    .line 30
    .line 31
    return-void
.end method

.method public setGiftUrl(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "context_livingAct"

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/izs;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/dce;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/dce;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/ece;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/ece;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setNumberChageListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->n:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->x()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final u(ZI)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 4
    .line 5
    add-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 10
    .line 11
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->t:I

    .line 12
    .line 13
    if-ge p2, p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->s:Z

    .line 17
    .line 18
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->n:Ll/y20;

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->o:I

    .line 23
    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 12
    .line 13
    .line 14
    move v0, v1

    .line 15
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getGiftNum()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v0, v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getItem(I)Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->p:I

    .line 26
    .line 27
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v4}, Ll/vwt;->k4()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    mul-int/2addr v4, v0

    .line 36
    sub-int/2addr v3, v4

    .line 37
    if-ltz v3, :cond_1

    .line 38
    .line 39
    add-int/lit8 v3, v0, 0x1

    .line 40
    .line 41
    invoke-virtual {p0, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u(ZI)V

    .line 42
    .line 43
    .line 44
    iget v3, v2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 45
    .line 46
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 47
    .line 48
    invoke-virtual {p0, v3, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->k(FFZ)V

    .line 49
    .line 50
    .line 51
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    return-void
.end method

.method public final w()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->j(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final x()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/obc0;->h2:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->setGiftBitmap(Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public y()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    add-int/lit8 v1, v1, -0x1

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->a:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u(ZI)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->m:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    move v2, v1

    .line 49
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 83
    .line 84
    iget v5, v4, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 85
    .line 86
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 87
    .line 88
    invoke-virtual {p0, v5, v4, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->k(FFZ)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v2, v2, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->u(ZI)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 98
    .line 99
    .line 100
    return-void
.end method
