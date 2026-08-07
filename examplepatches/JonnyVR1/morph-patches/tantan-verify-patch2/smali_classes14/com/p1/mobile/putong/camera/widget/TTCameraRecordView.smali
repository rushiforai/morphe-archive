.class public Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout;
.source "SourceFile"

# interfaces
.implements Ll/u6m;


# instance fields
.field public a:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

.field public b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "%ds"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->h:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->e(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const-string p2, "%ds"

    iput-object p2, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->h:Ljava/lang/String;

    .line 14
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->e(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p2, "%ds"

    iput-object p2, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->h:Ljava/lang/String;

    .line 17
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->e(Landroid/content/Context;)V

    return-void
.end method

.method private e(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/iec0;->f:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/xcc0;->h:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->a:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 20
    .line 21
    sget p1, Ll/xcc0;->l:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->d:Landroid/widget/TextView;

    .line 30
    .line 31
    const-string v0, "#c3ffffff"

    .line 32
    .line 33
    sget v1, Ll/qa00;->i:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/gc2;->b(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    sget p1, Ll/xcc0;->a:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->c:Landroid/view/View;

    .line 49
    .line 50
    sget p1, Ll/xcc0;->f:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->e:Landroid/view/View;

    .line 57
    .line 58
    sget p1, Ll/xcc0;->d:I

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 67
    .line 68
    sget p1, Ll/xcc0;->s:I

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Landroid/widget/TextView;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->f:Landroid/widget/TextView;

    .line 77
    .line 78
    sget p1, Ll/xcc0;->b:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Landroid/widget/TextView;

    .line 85
    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->g:Landroid/widget/TextView;

    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public a(J)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->f:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "%ds"

    .line 19
    .line 20
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 28
    .line 29
    const-wide/16 v1, 0x3e8

    .line 30
    .line 31
    mul-long/2addr p1, v1

    .line 32
    const/16 v1, 0x64

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1, p2}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->d(IJ)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->f:Landroid/widget/TextView;

    .line 38
    .line 39
    const/4 p2, 0x1

    .line 40
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->g:Landroid/widget/TextView;

    .line 44
    .line 45
    sget p1, Lcom/p1/mobile/putong/camera/R$string;->b:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->g:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/camera/R$string;->c:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->setProgress(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "%ds"

    .line 12
    .line 13
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public getCloseButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->c:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->a:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecordButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSwitchCameraButton()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/view/View;
    .locals 0

    .line 1
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->b:Lcom/p1/mobile/putong/camera/widget/CircleProgressView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/widget/CircleProgressView;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDescriptionText(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraRecordView;->d:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
