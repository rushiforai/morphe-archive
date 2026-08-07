.class public Ll/czf0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/czf0;->j:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic A(Ll/czf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/czf0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/czf0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/czf0;->J(Landroid/content/DialogInterface;)V

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
    iget-object v1, p0, Ll/czf0;->f:Lv/VLinear;

    .line 6
    .line 7
    new-instance v2, Ll/yyf0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/yyf0;-><init>(Ll/czf0;)V

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
    new-instance v1, Ll/czf0$a;

    .line 58
    .line 59
    invoke-direct {v1, p0, v0}, Ll/czf0$a;-><init>(Ll/czf0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

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
    .locals 4

    .line 1
    iget-object v0, p0, Ll/czf0;->j:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/czf0;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Ll/czf0;->g:Lv/VImage;

    .line 24
    .line 25
    new-instance v1, Ll/azf0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/azf0;-><init>(Ll/czf0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/czf0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    new-instance v1, Ll/bzf0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/bzf0;-><init>(Ll/czf0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object p0, p0, Ll/czf0;->h:Lv/VDraweeView;

    .line 46
    .line 47
    const/high16 v1, 0x433c0000    # 188.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/high16 v2, 0x43530000    # 211.0f

    .line 54
    .line 55
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    const-string v3, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlJISTdVTENZNTZHWEFWTENVR1VMN0YyQUJKTzVNUjE0IiwidyI6NTY0LCJoIjo2MzMsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMDMzNDI2MDAyODg5ODQxOTY5fQ.webp"

    .line 60
    .line 61
    invoke-virtual {v0, p0, v3, v1, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 62
    .line 63
    .line 64
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
    iget-object p1, p0, Ll/czf0;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "homepage_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/n3x;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "e_marriage_event_popup_enter"

    .line 9
    .line 10
    const-string v0, "p_marriage_event_popup"

    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 16
    .line 17
    .line 18
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
    const/4 v0, 0x1

    .line 6
    const-string v1, "SpringFestivalActivitiesBottomSheetDialog"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic y(Ll/czf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/czf0;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/czf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/czf0;->G()V

    return-void
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dzf0;->b(Ll/czf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic G()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/czf0;->f:Lv/VLinear;

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

.method public final synthetic J(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/czf0;->k:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    const-string v0, "SpringFestivalActivitiesBottomSheetDialog"

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/czf0;->F()V

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
    const-string v0, "p_marriage_event_popup"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/czf0;->k:Ll/l4g0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/wyf0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/wyf0;-><init>(Ll/czf0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/xyf0;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/xyf0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/czf0;->E()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->f1()Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->q4:Ll/vxd0;

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SpringFestivalMarriageActivitiesConfig;->version:I

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
