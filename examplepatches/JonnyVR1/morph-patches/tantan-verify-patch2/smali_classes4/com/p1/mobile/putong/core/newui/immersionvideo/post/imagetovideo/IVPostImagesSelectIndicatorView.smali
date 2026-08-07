.class public Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static c:I = 0x20

.field public static d:I = 0x2

.field public static e:I

.field public static f:I


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->c:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int/2addr v0, v1

    .line 13
    sput v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->e:I

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->d:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    mul-int/lit8 v1, v1, 0x3

    .line 23
    .line 24
    sub-int/2addr v0, v1

    .line 25
    div-int/lit8 v0, v0, 0x3

    .line 26
    .line 27
    sput v0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->f:I

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$c;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$c;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v0, Ll/r8m;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/r8m;-><init>(Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectAct$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->s:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->a:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/adc0;->sa:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/widget/ImageView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->b:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->f:I

    .line 29
    .line 30
    const/high16 v2, 0x40c00000    # 6.0f

    .line 31
    .line 32
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    sub-int/2addr v1, v3

    .line 37
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 38
    .line 39
    sget v1, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->f:I

    .line 40
    .line 41
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    sub-int/2addr v1, v2

    .line 46
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/immersionvideo/post/imagetovideo/IVPostImagesSelectIndicatorView;->b:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
