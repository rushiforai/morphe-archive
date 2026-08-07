.class public Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/t6m;


# instance fields
.field public d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->h0(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->h0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->h0(Landroid/content/Context;)V

    return-void
.end method

.method private h0(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/iec0;->c:I

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 20
    .line 21
    sget p1, Ll/xcc0;->g:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->e:Landroid/view/View;

    .line 28
    .line 29
    sget p1, Ll/xcc0;->a:I

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->f:Landroid/view/View;

    .line 36
    .line 37
    sget p1, Ll/xcc0;->f:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->g:Landroid/view/View;

    .line 44
    .line 45
    sget p1, Ll/xcc0;->l:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Landroid/widget/TextView;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->h:Landroid/widget/TextView;

    .line 54
    .line 55
    sget p1, Ll/xcc0;->i:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->i:Landroid/view/View;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public c()Ll/ma5;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->i:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/ma5;->a(Landroid/view/View;Landroid/view/View;)Ll/ma5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCaptureContentAreaView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getCloseButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSwitchCameraButton()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->g:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTakePictureButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Landroid/view/View;
    .locals 0

    .line 1
    return-object p0
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
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraHandIdCardView;->h:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
