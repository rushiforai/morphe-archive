.class public Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/t6m;


# instance fields
.field public d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/view/View;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->h0(Landroid/content/Context;)V

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->h0(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->h0(Landroid/content/Context;)V

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
    sget v0, Ll/iec0;->b:I

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->e:Landroid/view/View;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->f:Landroid/view/View;

    .line 36
    .line 37
    sget p1, Ll/xcc0;->p:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->g:Landroid/view/View;

    .line 44
    .line 45
    sget v0, Ll/qa00;->i:I

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    sget p1, Ll/xcc0;->m:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lv/VImage;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->h:Lv/VImage;

    .line 59
    .line 60
    sget p1, Ll/xcc0;->o:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lv/VImage;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->i:Lv/VImage;

    .line 69
    .line 70
    sget p1, Ll/xcc0;->l:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/widget/TextView;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->j:Landroid/widget/TextView;

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public c()Ll/ma5;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->g:Landroid/view/View;

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
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->g:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCloseButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviewSurface()Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->d:Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSwitchCameraButton()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getTakePictureButton()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->h:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->i:Lv/VImage;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
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
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/widget/TTCameraAvatarAndEmblemView;->j:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
