.class public Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/m1k;->a(Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/NewGiftWall;)V
    .locals 5

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->count:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->c:Lv/VText;

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "%d"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->c:Lv/VText;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->a:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 42
    .line 43
    const/high16 v3, 0x42780000    # 62.0f

    .line 44
    .line 45
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->b:Landroid/widget/TextView;

    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 66
    .line 67
    invoke-static {p0}, Ll/i1k;->c(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Z

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/act/GiftWallOptItemVIew;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
