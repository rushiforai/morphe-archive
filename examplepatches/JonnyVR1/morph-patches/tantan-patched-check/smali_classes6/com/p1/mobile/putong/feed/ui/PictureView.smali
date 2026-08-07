.class public Lcom/p1/mobile/putong/feed/ui/PictureView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lv/VTexturePlayer$b;


# static fields
.field public static C:J


# instance fields
.field public A:I

.field public B:F

.field public a:Lv/VDraweeView;

.field public b:Lv/VFrame_ColorFilter;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VProgressBar;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VTexturePlayer;

.field public k:Lv/VTexturePlayer$b;

.field public l:Lcom/p1/mobile/putong/data/Media;

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:I

.field public r:Ljava/lang/String;

.field public s:J

.field public t:J

.field public u:Z

.field public v:Ll/kcg0;

.field public w:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public x:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public y:I

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->q:I

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->t:J

    .line 12
    .line 13
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->w:Lrx/subjects/a;

    .line 20
    .line 21
    new-instance p1, Ll/tp70;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/tp70;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->x:Ll/y20;

    .line 27
    .line 28
    sget p1, Ll/hdc0;->q1:I

    .line 29
    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->y:I

    .line 31
    .line 32
    const p1, 0x3e4ccccd    # 0.2f

    .line 33
    .line 34
    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    .line 36
    .line 37
    const/16 p1, 0x7d0

    .line 38
    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    .line 40
    .line 41
    const/high16 p1, -0x40800000    # -1.0f

    .line 42
    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->B:F

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->q:I

    const-wide/16 p1, -0x1

    .line 48
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    .line 49
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->t:J

    .line 50
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->w:Lrx/subjects/a;

    .line 51
    new-instance p1, Ll/tp70;

    invoke-direct {p1, p0}, Ll/tp70;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->x:Ll/y20;

    .line 52
    sget p1, Ll/hdc0;->q1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->y:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    const/16 p1, 0x7d0

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->B:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->q:I

    const-wide/16 p1, -0x1

    .line 58
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    .line 59
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->t:J

    .line 60
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->w:Lrx/subjects/a;

    .line 61
    new-instance p1, Ll/tp70;

    invoke-direct {p1, p0}, Ll/tp70;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->x:Ll/y20;

    .line 62
    sget p1, Ll/hdc0;->q1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->y:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 63
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    const/16 p1, 0x7d0

    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->B:F

    return-void
.end method

.method private synthetic A()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic C(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->A()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/PictureView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->z(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/cbl0;->u(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/PictureView;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/PictureView;->C(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/ui/PictureView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->r:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/ui/PictureView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/ui/PictureView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->x:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/ui/PictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    return-wide v0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/ui/PictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->t:J

    return-wide v0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/feed/ui/PictureView;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->t:J

    return-void
.end method

.method private p()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private q(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->y:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 24
    .line 25
    if-eq v2, p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, 0x4

    .line 32
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method

.method private s()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lv/VTexturePlayer;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p0}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 21
    .line 22
    sget v2, Ll/hdc0;->R1:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/high16 v3, 0x40000000    # 2.0f

    .line 40
    .line 41
    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const/4 v4, 0x0

    .line 67
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0, v0, v1, v2, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/4 v1, -0x1

    .line 86
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method private t(Lcom/p1/mobile/putong/data/Video;)F
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 35
    .line 36
    if-lez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 47
    .line 48
    int-to-float p0, p0

    .line 49
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 50
    .line 51
    int-to-float p1, p1

    .line 52
    div-float/2addr p0, p1

    .line 53
    return p0

    .line 54
    :cond_2
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method private static x()Z
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Lcom/p1/mobile/putong/feed/ui/PictureView;->C:J

    .line 6
    .line 7
    sub-long v4, v0, v2

    .line 8
    .line 9
    const-wide/16 v6, 0x0

    .line 10
    .line 11
    cmp-long v2, v2, v6

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    const-wide/16 v2, 0x96

    .line 16
    .line 17
    cmp-long v2, v4, v2

    .line 18
    .line 19
    if-gez v2, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    sput-wide v0, Lcom/p1/mobile/putong/feed/ui/PictureView;->C:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method private synthetic z(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqi;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->w:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public D()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->p:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/high16 v1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/16 v1, 0xc8

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 31
    .line 32
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public E()V
    .locals 13

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->p:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-wide/16 v2, 0xc8

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->l:Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 37
    .line 38
    if-eqz v2, :cond_3

    .line 39
    .line 40
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->s()V

    .line 43
    .line 44
    .line 45
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    if-nez v2, :cond_0

    .line 49
    .line 50
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 51
    .line 52
    const-string v4, "raw"

    .line 53
    .line 54
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/wel0;

    .line 65
    .line 66
    new-instance v4, Ll/vel0;

    .line 67
    .line 68
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v5}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-direct {v4, v5}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-boolean v5, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->n:Z

    .line 78
    .line 79
    invoke-direct {v2, v4, v5, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 80
    .line 81
    .line 82
    const-string v4, "video/mp4"

    .line 83
    .line 84
    iput-object v4, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 85
    .line 86
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 87
    .line 88
    invoke-virtual {v2}, Ll/wel0;->m()[I

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 93
    .line 94
    .line 95
    iput-object v4, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 96
    .line 97
    iget-wide v4, v2, Ll/wel0;->b:J

    .line 98
    .line 99
    long-to-float v2, v4

    .line 100
    iput v2, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 101
    .line 102
    :cond_0
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->t(Lcom/p1/mobile/putong/data/Video;)F

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->n:Z

    .line 107
    .line 108
    if-eqz v4, :cond_1

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->formatSquare()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    :goto_0
    move-object v9, v4

    .line 115
    goto :goto_1

    .line 116
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    goto :goto_0

    .line 121
    :goto_1
    invoke-static {}, Ll/j4h;->e()Z

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 125
    .line 126
    .line 127
    move-result-wide v4

    .line 128
    iput-wide v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->s:J

    .line 129
    .line 130
    sget v4, Ll/c7y;->a:I

    .line 131
    .line 132
    invoke-static {}, Ll/j4h;->e()Z

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 137
    .line 138
    invoke-virtual {v6, v5}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 139
    .line 140
    .line 141
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 142
    .line 143
    new-instance v7, Lcom/p1/mobile/putong/feed/ui/PictureView$b;

    .line 144
    .line 145
    invoke-direct {v7, p0, v9, v4}, Lcom/p1/mobile/putong/feed/ui/PictureView$b;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v6, v7}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 149
    .line 150
    .line 151
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 152
    .line 153
    new-instance v7, Ll/vp70;

    .line 154
    .line 155
    invoke-direct {v7}, Ll/vp70;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6, v7}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 159
    .line 160
    .line 161
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 162
    .line 163
    new-instance v7, Ll/xp70;

    .line 164
    .line 165
    invoke-direct {v7, v9}, Ll/xp70;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-static {v7}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    invoke-virtual {v7, v8}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    iget v8, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 181
    .line 182
    const/4 v10, 0x0

    .line 183
    invoke-virtual {v6, v10, v7, v8}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 184
    .line 185
    .line 186
    move v6, v5

    .line 187
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 188
    .line 189
    invoke-static {v9}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v7

    .line 193
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    float-to-double v10, v2

    .line 198
    if-nez v6, :cond_2

    .line 199
    .line 200
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 201
    .line 202
    const-string v2, "http"

    .line 203
    .line 204
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-eqz v1, :cond_2

    .line 209
    .line 210
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 211
    .line 212
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-nez v1, :cond_2

    .line 217
    .line 218
    :goto_2
    move-object v6, v7

    .line 219
    move-wide v7, v10

    .line 220
    goto :goto_3

    .line 221
    :cond_2
    move v0, v3

    .line 222
    goto :goto_2

    .line 223
    :goto_3
    sget v11, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 224
    .line 225
    sget v12, Lcom/p1/mobile/putong/feed/R$string;->A4:I

    .line 226
    .line 227
    move v10, v0

    .line 228
    invoke-virtual/range {v5 .. v12}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 229
    .line 230
    .line 231
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0, v9}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    new-instance v1, Ll/zp70;

    .line 248
    .line 249
    invoke-direct {v1, p0, v9, v4}, Ll/zp70;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;Ljava/lang/String;I)V

    .line 250
    .line 251
    .line 252
    new-instance p0, Ll/bq70;

    .line 253
    .line 254
    invoke-direct {p0}, Ll/bq70;-><init>()V

    .line 255
    .line 256
    .line 257
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 262
    .line 263
    .line 264
    :cond_3
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->G(Lcom/p1/mobile/putong/data/Media;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 6

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->q:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->l:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x4

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->i(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->l:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 34
    .line 35
    const-string v3, "raw"

    .line 36
    .line 37
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const-string v3, "not supported yet"

    .line 42
    .line 43
    if-nez v0, :cond_6

    .line 44
    .line 45
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    .line 50
    .line 51
    if-nez v4, :cond_1

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    .line 63
    .line 64
    if-eqz v4, :cond_2

    .line 65
    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->l:Lcom/p1/mobile/putong/data/Media;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const/4 v4, 0x0

    .line 78
    :goto_0
    if-eqz v4, :cond_5

    .line 79
    .line 80
    if-ltz p2, :cond_3

    .line 81
    .line 82
    const/16 v3, 0x64

    .line 83
    .line 84
    if-ge p2, v3, :cond_3

    .line 85
    .line 86
    invoke-static {p2}, Ll/orb0;->w(I)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 93
    .line 94
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    iget-object v5, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v5, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p2, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    invoke-virtual {v0, v3, v4, v5, p2}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    if-nez v0, :cond_4

    .line 119
    .line 120
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    .line 121
    .line 122
    :cond_4
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 125
    .line 126
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->r:Ljava/lang/String;

    .line 127
    .line 128
    new-instance v5, Lcom/p1/mobile/putong/feed/ui/PictureView$a;

    .line 129
    .line 130
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/feed/ui/PictureView$a;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p2, v0, v4, v3, v5}, Ll/fsb0;->F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    invoke-static {v3}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_6
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 142
    .line 143
    if-eqz p2, :cond_8

    .line 144
    .line 145
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p2, v0, v3}, Ll/fsb0;->k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :goto_1
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 157
    .line 158
    if-eqz p1, :cond_7

    .line 159
    .line 160
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_7
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_8
    invoke-static {v3}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-wide/16 v1, 0xc8

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 20
    .line 21
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x0

    .line 46
    cmpl-float v0, v0, v1

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-wide/16 v1, 0x190

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 67
    .line 68
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    :cond_0
    sget v0, Ll/hdc0;->q1:I

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 92
    .line 93
    invoke-interface {p0}, Lv/VTexturePlayer$b;->d()V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPictureBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->H0:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {p0}, Lv/VTexturePlayer$b;->h()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gq70;->a(Lcom/p1/mobile/putong/feed/ui/PictureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/ui/PictureView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->q:I

    .line 9
    .line 10
    if-ltz p1, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x64

    .line 13
    .line 14
    if-ge p1, v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->y:I

    .line 18
    .line 19
    sget v0, Ll/hdc0;->q1:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->E()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    sget v0, Ll/hdc0;->i1:I

    .line 28
    .line 29
    if-ne p1, v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->D()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_3
    sget v0, Ll/hdc0;->H0:I

    .line 36
    .line 37
    if-ne p1, v0, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->D()V

    .line 40
    .line 41
    .line 42
    :cond_4
    :goto_0
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v1, 0xc8

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->onPause()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x258

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 57
    .line 58
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/dq70;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/dq70;-><init>(Lcom/p1/mobile/putong/feed/ui/PictureView;)V

    .line 71
    .line 72
    .line 73
    const-wide/16 v1, 0x190

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 87
    .line 88
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onComplete()V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public onError(II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "play video error "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/16 v1, 0x64

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 50
    .line 51
    invoke-interface {p0, p1, p2}, Lv/VTexturePlayer$b;->onError(II)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->g:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/high16 v1, 0x40c00000    # 6.0f

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->g:Lv/VText;

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->p()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    sget v3, Ll/k9c0;->f0:I

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    int-to-float v3, v3

    .line 39
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->h:Lv/VImage;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->h:Lv/VImage;

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->p()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Ll/k9c0;->f0:I

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    int-to-float v3, v3

    .line 71
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->p()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    sget v2, Ll/k9c0;->f0:I

    .line 93
    .line 94
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    int-to-float v1, v1

    .line 103
    invoke-static {p0, v1}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->o:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->q1:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onPause()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    .line 14
    .line 15
    int-to-long v1, v1

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/hdc0;->i1:I

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 37
    .line 38
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onResume()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->B:F

    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public r(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->p:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    sget p1, Ll/hdc0;->q1:I

    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 65
    .line 66
    const/high16 v1, 0x3f800000    # 1.0f

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 73
    .line 74
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->u:Z

    .line 75
    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->v:Ll/kcg0;

    .line 79
    .line 80
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 81
    .line 82
    .line 83
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->u:Z

    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlayerListener(Lv/VTexturePlayer$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    neg-int v0, v0

    .line 33
    int-to-float v0, v0

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    cmpl-float v2, v2, v0

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    div-float v2, v1, p1

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    sub-int/2addr v0, v2

    .line 83
    int-to-float v0, v0

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    cmpl-float v2, v2, v0

    .line 91
    .line 92
    if-eqz v2, :cond_3

    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 97
    .line 98
    .line 99
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 100
    .line 101
    div-float v2, v1, p1

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_6

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_6

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    neg-int v0, v0

    .line 129
    int-to-float v0, v0

    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 131
    .line 132
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    cmpl-float v2, v2, v0

    .line 137
    .line 138
    if-eqz v2, :cond_5

    .line 139
    .line 140
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 141
    .line 142
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotX(F)V

    .line 143
    .line 144
    .line 145
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 146
    .line 147
    div-float/2addr v1, p1

    .line 148
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 149
    .line 150
    .line 151
    :cond_6
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public setScaleY(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v0, v2

    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-float v0, v0

    .line 46
    cmpl-float v2, v2, v0

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->f:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    div-float v2, v1, p1

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_4

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    sub-int/2addr v0, v2

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    int-to-float v0, v0

    .line 98
    cmpl-float v2, v2, v0

    .line 99
    .line 100
    if-eqz v2, :cond_3

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->i:Lv/VText;

    .line 108
    .line 109
    div-float v2, v1, p1

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 112
    .line 113
    .line 114
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 115
    .line 116
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_6

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_6

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 135
    .line 136
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    sub-int/2addr v0, v2

    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 142
    .line 143
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    int-to-float v0, v0

    .line 148
    cmpl-float v2, v2, v0

    .line 149
    .line 150
    if-eqz v2, :cond_5

    .line 151
    .line 152
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 153
    .line 154
    invoke-virtual {v2, v0}, Landroid/view/View;->setPivotY(F)V

    .line 155
    .line 156
    .line 157
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 158
    .line 159
    div-float/2addr v1, p1

    .line 160
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 161
    .line 162
    .line 163
    :cond_6
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public setTopRadius(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/wlj;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, p1, p1, v1, v1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->a:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/wlj;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/ui/PictureView;->v(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->w(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public w(ZZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->m:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->n:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->o:Z

    .line 6
    .line 7
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    cmpg-float v0, v0, v1

    .line 16
    .line 17
    if-gez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->j:Lv/VTexturePlayer;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v1, 0xc8

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 36
    .line 37
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->b:Lv/VFrame_ColorFilter;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->z:F

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->A:I

    .line 60
    .line 61
    int-to-long v1, v1

    .line 62
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 67
    .line 68
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    sget v0, Ll/hdc0;->i1:I

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PictureView;->q(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;->k:Lv/VTexturePlayer$b;

    .line 92
    .line 93
    invoke-interface {p0}, Lv/VTexturePlayer$b;->y()V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method
