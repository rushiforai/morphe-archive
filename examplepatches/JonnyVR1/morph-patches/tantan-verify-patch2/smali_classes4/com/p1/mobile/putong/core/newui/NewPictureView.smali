.class public Lcom/p1/mobile/putong/core/newui/NewPictureView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lv/VTexturePlayer$b;
.implements Ll/eam;


# instance fields
.field public A:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public B:Z

.field public C:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public D:I

.field public E:F

.field public F:I

.field public G:F

.field public a:Lv/VDraweeView;

.field public b:Lv/VFrame_ColorFilter;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VProgressBar;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lv/VTexturePlayer;

.field public o:Lv/VTexturePlayer$b;

.field public p:Lcom/p1/mobile/putong/data/Media;

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:J

.field public w:J

.field public x:F

.field public y:Z

.field public z:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->t:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z:Lrx/subjects/a;

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->A:Lrx/subjects/a;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->B:Z

    .line 30
    .line 31
    new-instance p1, Ll/y940;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/y940;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->C:Ll/y20;

    .line 37
    .line 38
    sget p1, Ll/adc0;->qa:I

    .line 39
    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->D:I

    .line 41
    .line 42
    const p1, 0x3e4ccccd    # 0.2f

    .line 43
    .line 44
    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->E:F

    .line 46
    .line 47
    const/16 p1, 0x7d0

    .line 48
    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->F:I

    .line 50
    .line 51
    const/high16 p1, -0x40800000    # -1.0f

    .line 52
    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->G:F

    .line 54
    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->t:Ljava/lang/String;

    const-wide/16 p1, -0x1

    .line 58
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v:J

    .line 59
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

    .line 60
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z:Lrx/subjects/a;

    .line 61
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->A:Lrx/subjects/a;

    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->B:Z

    .line 63
    new-instance p1, Ll/y940;

    invoke-direct {p1, p0}, Ll/y940;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->C:Ll/y20;

    .line 64
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->D:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->E:F

    const/16 p1, 0x7d0

    .line 66
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->F:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->G:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 68
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 69
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->t:Ljava/lang/String;

    const-wide/16 p1, -0x1

    .line 70
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v:J

    .line 71
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

    .line 72
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z:Lrx/subjects/a;

    .line 73
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->A:Lrx/subjects/a;

    const/4 p1, 0x0

    .line 74
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->B:Z

    .line 75
    new-instance p1, Ll/y940;

    invoke-direct {p1, p0}, Ll/y940;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->C:Ll/y20;

    .line 76
    sget p1, Ll/adc0;->qa:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->D:I

    const p1, 0x3e4ccccd    # 0.2f

    .line 77
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->E:F

    const/16 p1, 0x7d0

    .line 78
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->F:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 79
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->G:F

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/Boolean;
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

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

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
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/NewPictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->u(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/newui/NewPictureView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->u:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/NewPictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

    return-wide v0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/newui/NewPictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v:J

    return-wide v0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/newui/NewPictureView;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->v:J

    return-void
.end method

.method private o()Lcom/p1/mobile/android/app/Act;
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

.method private synthetic u(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->A:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 7
    .line 8
    invoke-static {p0}, Ll/uqi;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->q(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    sget v0, Ll/adc0;->qa:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPictureBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->a:Lv/VDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->a:Lv/VDraweeView;

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
    sget v0, Ll/adc0;->F7:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {p0}, Lv/VTexturePlayer$b;->h()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ea40;->a(Lcom/p1/mobile/putong/core/newui/NewPictureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->D:I

    .line 2
    .line 3
    sget v0, Ll/adc0;->qa:I

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget v0, Ll/adc0;->t9:I

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    sget v0, Ll/adc0;->F7:I

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x()V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    invoke-static {}, Ll/asj0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v1}, Lv/VTexturePlayer;->v()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->onPause()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 24
    .line 25
    invoke-interface {v0}, Lv/VTexturePlayer$b;->onComplete()V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {v1}, Lv/VTexturePlayer;->v()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-wide/16 v1, 0xc8

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 54
    .line 55
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->onPause()V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/4 v1, 0x0

    .line 75
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-wide/16 v1, 0x258

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 86
    .line 87
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 95
    .line 96
    .line 97
    new-instance v0, Ll/da40;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/da40;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;)V

    .line 100
    .line 101
    .line 102
    const-wide/16 v1, 0x190

    .line 103
    .line 104
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 108
    .line 109
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 116
    .line 117
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onComplete()V

    .line 118
    .line 119
    .line 120
    :cond_2
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
    const-string v2, "NewPictureView play video error "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->q:Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/dbc0;->J2:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->h:Lv/VText;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->h:Lv/VText;

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/c9c0;->E1:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const/high16 v2, 0x41000000    # 8.0f

    .line 53
    .line 54
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    int-to-float v3, v3

    .line 59
    invoke-static {v1, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->g:Lv/VText;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v3, Ll/c9c0;->D1:I

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    int-to-float v2, v2

    .line 83
    invoke-static {v1, v2}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->j:Lv/VText;

    .line 91
    .line 92
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget v1, Ll/c9c0;->C1:I

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    const/high16 v1, 0x41400000    # 12.0f

    .line 103
    .line 104
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    int-to-float v1, v1

    .line 109
    invoke-static {p0, v1}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->r:Z

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->y:Z

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    int-to-float v0, p1

    .line 34
    const/high16 v1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    mul-float/2addr v0, v1

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 44
    .line 45
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 46
    .line 47
    int-to-float v2, v2

    .line 48
    div-float/2addr v0, v2

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 58
    .line 59
    int-to-float v2, v2

    .line 60
    mul-float/2addr v0, v2

    .line 61
    float-to-int v0, v0

    .line 62
    if-gt v0, p2, :cond_1

    .line 63
    .line 64
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-static {v0}, Ll/dox;->b(I)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    int-to-float p1, p2

    .line 77
    mul-float/2addr p1, v1

    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 85
    .line 86
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 87
    .line 88
    int-to-float v0, v0

    .line 89
    div-float/2addr p1, v0

    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 97
    .line 98
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 99
    .line 100
    int-to-float v0, v0

    .line 101
    mul-float/2addr p1, v0

    .line 102
    float-to-int p1, p1

    .line 103
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x:F

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    cmpl-float v0, v0, v1

    .line 119
    .line 120
    if-lez v0, :cond_3

    .line 121
    .line 122
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    int-to-float p2, p1

    .line 127
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x:F

    .line 128
    .line 129
    div-float/2addr p2, v0

    .line 130
    float-to-int p2, p2

    .line 131
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/adc0;->qa:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 21
    .line 22
    invoke-interface {p0}, Lv/VTexturePlayer$b;->onPause()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->E:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->F:I

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
    sget v0, Ll/adc0;->t9:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->G:F

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

.method public final p(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->D:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

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

.method public q(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->r(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->a:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->a:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->s:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 33
    .line 34
    const/4 v0, 0x4

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 45
    .line 46
    :cond_0
    sget p1, Ll/adc0;->qa:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 61
    .line 62
    const/high16 p1, 0x3f800000    # 1.0f

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final s()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->k(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 26
    .line 27
    sget v2, Ll/adc0;->Zd:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-lez v2, :cond_0

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/high16 v4, 0x40000000    # 2.0f

    .line 49
    .line 50
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    invoke-static {v5, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    const/4 v5, 0x0

    .line 76
    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 77
    .line 78
    .line 79
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 80
    .line 81
    invoke-virtual {p0, v2, v1, v0, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method

.method public setAdjustAspectRateByPictureSize(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->y:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAspectRateFitWidth(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->x:F

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPlayerListener(Lv/VTexturePlayer$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    cmpl-float v0, p1, v0

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    div-float/2addr v1, p1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setScaleY(F)V
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    cmpl-float v0, p1, v0

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    div-float/2addr v1, p1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/data/Video;)F
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 11
    .line 12
    int-to-float p0, p0

    .line 13
    mul-float/2addr p0, v0

    .line 14
    int-to-float p1, p1

    .line 15
    div-float/2addr p0, p1

    .line 16
    return p0
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

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

.method public x()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->s:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->E:F

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->F:I

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
    sget v0, Ll/adc0;->t9:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->o:Lv/VTexturePlayer$b;

    .line 92
    .line 93
    invoke-interface {p0}, Lv/VTexturePlayer$b;->y()V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public z()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->z:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->s:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-wide/16 v2, 0xc8

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->p:Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 44
    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->s()V

    .line 50
    .line 51
    .line 52
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 58
    .line 59
    const-string v4, "raw"

    .line 60
    .line 61
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Ll/wel0;

    .line 72
    .line 73
    new-instance v4, Ll/vel0;

    .line 74
    .line 75
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v5}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-direct {v4, v5}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->r:Z

    .line 85
    .line 86
    invoke-direct {v2, v4, v5, v3}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 87
    .line 88
    .line 89
    const-string v4, "video/mp4"

    .line 90
    .line 91
    iput-object v4, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 92
    .line 93
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 94
    .line 95
    invoke-virtual {v2}, Ll/wel0;->m()[I

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 100
    .line 101
    .line 102
    iput-object v4, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 103
    .line 104
    iget-wide v4, v2, Ll/wel0;->b:J

    .line 105
    .line 106
    long-to-float v2, v4

    .line 107
    iput v2, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 108
    .line 109
    :cond_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/NewPictureView;->t(Lcom/p1/mobile/putong/data/Video;)F

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->r:Z

    .line 114
    .line 115
    if-eqz v4, :cond_1

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->formatSquare()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    :goto_0
    move-object v9, v4

    .line 122
    goto :goto_1

    .line 123
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    goto :goto_0

    .line 128
    :goto_1
    invoke-static {}, Ll/wcl0;->c()Z

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 133
    .line 134
    .line 135
    move-result-wide v5

    .line 136
    iput-wide v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->w:J

    .line 137
    .line 138
    sget v13, Ll/c7y;->a:I

    .line 139
    .line 140
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 141
    .line 142
    invoke-virtual {v5, v4}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 143
    .line 144
    .line 145
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 146
    .line 147
    new-instance v6, Ll/z940;

    .line 148
    .line 149
    invoke-direct {v6}, Ll/z940;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v5, v6}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 153
    .line 154
    .line 155
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 156
    .line 157
    new-instance v6, Ll/aa40;

    .line 158
    .line 159
    invoke-direct {v6, v9}, Ll/aa40;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v6}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 167
    .line 168
    .line 169
    move-result-object v7

    .line 170
    invoke-virtual {v6, v7}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    iget v7, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 175
    .line 176
    const/4 v8, 0x0

    .line 177
    invoke-virtual {v5, v8, v6, v7}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 181
    .line 182
    new-instance v6, Lcom/p1/mobile/putong/core/newui/NewPictureView$a;

    .line 183
    .line 184
    invoke-direct {v6, p0, v9, v13}, Lcom/p1/mobile/putong/core/newui/NewPictureView$a;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/String;I)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5, v6}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 188
    .line 189
    .line 190
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->n:Lv/VTexturePlayer;

    .line 191
    .line 192
    invoke-static {v9}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    float-to-double v7, v2

    .line 201
    if-nez v4, :cond_2

    .line 202
    .line 203
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 204
    .line 205
    const-string v2, "http"

    .line 206
    .line 207
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_2

    .line 212
    .line 213
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 214
    .line 215
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-nez v1, :cond_2

    .line 220
    .line 221
    move v10, v0

    .line 222
    goto :goto_2

    .line 223
    :cond_2
    move v10, v3

    .line 224
    :goto_2
    sget v11, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 225
    .line 226
    sget v12, Lcom/p1/mobile/putong/core/R$string;->uk:I

    .line 227
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
    new-instance v1, Ll/ba40;

    .line 248
    .line 249
    invoke-direct {v1, p0, v9, v13}, Ll/ba40;-><init>(Lcom/p1/mobile/putong/core/newui/NewPictureView;Ljava/lang/String;I)V

    .line 250
    .line 251
    .line 252
    new-instance p0, Ll/ca40;

    .line 253
    .line 254
    invoke-direct {p0}, Ll/ca40;-><init>()V

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
