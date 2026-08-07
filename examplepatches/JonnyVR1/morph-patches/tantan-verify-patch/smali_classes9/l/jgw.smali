.class public Ll/jgw;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public l:Ll/l4g0;

.field public final m:Ljava/lang/Runnable;

.field public final n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/egc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/jgw;->k:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p2, p0, Ll/jgw;->m:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput-object p3, p0, Ll/jgw;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A(Ll/jgw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jgw;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/jgw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jgw;->H(Landroid/view/View;)V

    return-void
.end method

.method private E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/jgw;->f:Lv/VLinear;

    .line 12
    .line 13
    new-instance v2, Ll/egw;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/egw;-><init>(Ll/jgw;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x3

    .line 26
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 37
    .line 38
    .line 39
    const v1, 0x1020002

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/odc0;->p:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget v1, Ll/tbc0;->a0:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/jgw$a;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Ll/jgw$a;-><init>(Ll/jgw;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jgw;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/jgw;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/zyf0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/zyf0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/pej0;->v(Ll/pej0$a;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/jgw;->h:Lv/VDraweeView;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhVQlVJRERCNlRKN1VPSEoyWVlQVlRDTEdLRDRCNDE0IiwidyI6ODg1LCJoIjo3NjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5OTAwNDg3NzYzMTA4MDgyNzcyfQ.png"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IllCUlE1SFgyS0dBN05NSFpITlZIUFlDNlEzM0JYTjE0IiwidyI6ODg1LCJoIjo3NjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDc3NzkwNDMxMzYyOTI3MzQyOH0.png"

    .line 45
    .line 46
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/jgw;->h:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-static {}, Ll/bnl0;->y0()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/high16 v2, 0x42a00000    # 80.0f

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    sub-int/2addr v1, v2

    .line 62
    mul-int/lit16 v1, v1, 0x100

    .line 63
    .line 64
    div-int/lit16 v1, v1, 0x127

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/jgw;->g:Lv/VImage;

    .line 70
    .line 71
    new-instance v1, Ll/ggw;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/ggw;-><init>(Ll/jgw;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/jgw;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 80
    .line 81
    new-instance v1, Ll/hgw;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/hgw;-><init>(Ll/jgw;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/jgw;->j:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 90
    .line 91
    new-instance v1, Ll/igw;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/igw;-><init>(Ll/jgw;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Ll/xra;->w()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    iget-object p0, p0, Ll/jgw;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    :cond_1
    return-void
.end method

.method private synthetic G()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/jgw;->f:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jgw;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    const-string p1, "e_upload_video"

    .line 7
    .line 8
    const-string v0, "p_highqualityphoto_guide_popup"

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jgw;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    const-string p1, "e_upload_photos"

    .line 7
    .line 8
    const-string v0, "p_highqualityphoto_guide_popup"

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic K(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jgw;->l:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic x(Ll/jgw;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jgw;->K(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/jgw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jgw;->G()V

    return-void
.end method

.method public static synthetic z(Ll/jgw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jgw;->I(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kgw;->b(Ll/jgw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jgw;->F()V

    .line 5
    .line 6
    .line 7
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "p_highqualityphoto_guide_popup"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/jgw;->l:Ll/l4g0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/fgw;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/fgw;-><init>(Ll/jgw;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jgw;->E()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
