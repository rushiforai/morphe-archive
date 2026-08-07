.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static i:I


# instance fields
.field public a:F

.field public b:Z

.field public c:Landroid/graphics/Paint;

.field public d:I

.field public e:I

.field public f:Landroid/graphics/RectF;

.field public g:Landroid/graphics/RectF;

.field public h:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x420c0000    # 35.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->i:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40400000    # 3.0f

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
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a:F

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->b:Z

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->f:Landroid/graphics/RectF;

    .line 22
    .line 23
    new-instance p1, Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->g:Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget v0, Ll/gac0;->a:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->h:F

    .line 41
    .line 42
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

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x40400000    # 3.0f

    .line 44
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a:F

    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->b:Z

    .line 46
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->f:Landroid/graphics/RectF;

    .line 47
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->g:Landroid/graphics/RectF;

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Ll/gac0;->a:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->h:F

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

    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x40400000    # 3.0f

    .line 50
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a:F

    const/4 p1, 0x0

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->b:Z

    .line 52
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->f:Landroid/graphics/RectF;

    .line 53
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->g:Landroid/graphics/RectF;

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Ll/gac0;->a:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->h:F

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->c:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->e:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->c:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->b:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->f:Landroid/graphics/RectF;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->d:I

    .line 15
    .line 16
    int-to-float v1, v1

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->g:Landroid/graphics/RectF;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->f:Landroid/graphics/RectF;

    .line 29
    .line 30
    iget v2, v1, Landroid/graphics/RectF;->left:F

    .line 31
    .line 32
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a:F

    .line 33
    .line 34
    add-float/2addr v2, v3

    .line 35
    iget v4, v1, Landroid/graphics/RectF;->top:F

    .line 36
    .line 37
    add-float/2addr v4, v3

    .line 38
    iget v5, v1, Landroid/graphics/RectF;->right:F

    .line 39
    .line 40
    sub-float/2addr v5, v3

    .line 41
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 42
    .line 43
    sub-float/2addr v1, v3

    .line 44
    invoke-virtual {v0, v2, v4, v5, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->g:Landroid/graphics/RectF;

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->h:F

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->c:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public setColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public setLikedWidth(I)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->i:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->d:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->b:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->h:F

    .line 2
    .line 3
    return-void
.end method

.method public setWidthOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->a:F

    .line 2
    .line 3
    return-void
.end method
