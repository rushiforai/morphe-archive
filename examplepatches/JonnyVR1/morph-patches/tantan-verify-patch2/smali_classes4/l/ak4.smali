.class public Ll/ak4;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VFrame;

.field public g:Lv/VFrame;

.field public h:Lv/VDraweeView;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public l:Lv/VImage;

.field public final m:Lcom/p1/mobile/android/app/Act;

.field public final n:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/ak4;->m:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p2, p0, Ll/ak4;->n:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A(Ll/ak4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ak4;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    const-string v1, "CardCertificationDialog"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
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
    iget-object v1, p0, Ll/ak4;->f:Lv/VFrame;

    .line 6
    .line 7
    new-instance v2, Ll/vj4;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/vj4;-><init>(Ll/ak4;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 31
    .line 32
    .line 33
    const v1, 0x1020002

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/odc0;->p:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/FrameLayout;

    .line 47
    .line 48
    sget v1, Ll/tbc0;->a0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/ak4$a;

    .line 58
    .line 59
    invoke-direct {v1, p0, v0}, Ll/ak4$a;-><init>(Ll/ak4;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ak4;->m:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/ak4;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Ll/ak4;->l:Lv/VImage;

    .line 24
    .line 25
    new-instance v1, Ll/yj4;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/yj4;-><init>(Ll/ak4;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ak4;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    new-instance v1, Ll/zj4;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/zj4;-><init>(Ll/ak4;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/ak4;->n:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v1, p0, Ll/ak4;->h:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ak4;->n:Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-virtual {v0, v1, p0, v2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 67
    .line 68
    .line 69
    :cond_0
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
    iget-object p0, p0, Ll/ak4;->f:Lv/VFrame;

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
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "CardCertificationDialog"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic y(Ll/ak4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ak4;->G()V

    return-void
.end method

.method public static synthetic z(Ll/ak4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ak4;->H(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bk4;->b(Ll/ak4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ak4;->F()V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/wj4;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/wj4;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/xj4;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/xj4;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ak4;->E()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
