.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;


# direct methods
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

.method public static synthetic a(ILcom/p1/mobile/putong/app/PutongAct;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/tfj0$a;

    .line 3
    .line 4
    const-string v0, "e_add_new_photo"

    .line 5
    .line 6
    const-string v1, "p_moment_post"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 9
    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    rsub-int/lit8 p0, p0, 0x9

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithInstaPicker(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p1}, Ll/cn40;->e0(Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->a:Landroid/view/View;

    .line 6
    .line 7
    new-instance p3, Ll/nq20;

    .line 8
    .line 9
    invoke-direct {p3, p2, p1}, Ll/nq20;-><init>(ILcom/p1/mobile/putong/app/PutongAct;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/hdc0;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->a:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/hdc0;->r1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->b:Landroid/widget/ImageView;

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
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->h:I

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
    sget v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->h:I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->b:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/j4h;->h()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->a:Landroid/view/View;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->b:Landroid/widget/ImageView;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionIndicatorView;->b:Landroid/widget/ImageView;

    .line 71
    .line 72
    sget v0, Ll/lbc0;->N3:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method
