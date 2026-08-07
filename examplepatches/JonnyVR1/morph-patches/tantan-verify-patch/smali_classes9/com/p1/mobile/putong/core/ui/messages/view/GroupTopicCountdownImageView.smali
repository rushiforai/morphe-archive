.class public Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;
.super Lv/VImage;
.source "SourceFile"


# instance fields
.field public d:F

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Xfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->d:F

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->h()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->d:F

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->h()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->d:F

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->h()V

    return-void
.end method

.method private h()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->e:Landroid/graphics/Paint;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    .line 19
    .line 20
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 21
    .line 22
    invoke-direct {v2, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 23
    .line 24
    .line 25
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->f:Landroid/graphics/Xfermode;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lv/VImage;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->e:Landroid/graphics/Paint;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->f:Landroid/graphics/Xfermode;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 17
    .line 18
    .line 19
    int-to-float v7, v1

    .line 20
    int-to-float v0, v0

    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->d:F

    .line 22
    .line 23
    mul-float v8, v0, v1

    .line 24
    .line 25
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->e:Landroid/graphics/Paint;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x0

    .line 29
    move-object v4, p1

    .line 30
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->e:Landroid/graphics/Paint;

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupTopicCountdownImageView;->d:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
