.class public Ll/tvp0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/l4g0;

.field public n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

.field public final p:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tvp0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tvp0$a;-><init>(Ll/tvp0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tvp0;->p:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/tvp0;->G(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Ll/tvp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tvp0;->L(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic D(Ll/tvp0;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvp0;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private F()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_offline_message"

    .line 2
    .line 3
    return-object p0
.end method

.method private G(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object v0, p0, Ll/tvp0;->l:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/tvp0;->E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private H()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tvp0;->o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/tvp0;->j:Landroid/widget/TextView;

    .line 10
    .line 11
    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 12
    .line 13
    iget-object v2, p0, Ll/tvp0;->o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 14
    .line 15
    iget v2, v2, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->msgCnt:I

    .line 16
    .line 17
    const/16 v3, 0x63

    .line 18
    .line 19
    if-le v2, v3, :cond_0

    .line 20
    .line 21
    const-string v2, "99+"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :goto_0
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-string v3, "\u5728\u4f60\u79bb\u5f00\u671f\u95f4\u6709%s\u6761\u65b0\u6d88\u606f"

    .line 33
    .line 34
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/tvp0;->i:Lv/VDraweeView;

    .line 44
    .line 45
    const-string v2, "https://auto.tancdn.com/v1/raw/a43d2362-81b1-471b-bbce-c82629ccde9614.webp"

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/tvp0;->h:Landroid/widget/ImageView;

    .line 51
    .line 52
    new-instance v1, Ll/qvp0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/qvp0;-><init>(Ll/tvp0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/tvp0;->g:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    new-instance v1, Ll/rvp0;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/rvp0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/tvp0;->k:Landroid/widget/TextView;

    .line 71
    .line 72
    new-instance v1, Ll/svp0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/svp0;-><init>(Ll/tvp0;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
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

.method private synthetic J(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_open_wechat_notification"

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tvp0;->F()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/tvp0;->o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/tvp0;->o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->wechatLaunch:Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    sget-object v0, Ll/c70;->INSTANCE:Ll/c70;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->userName:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/WechatMicroProgramLaunchInfo;->path:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1, p1}, Ll/c70;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic K(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tvp0;->m:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic L(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->l5:Ll/byd0;

    .line 6
    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object p1, p1, Ll/dkb;->m5:Ll/vxd0;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p1, v0}, Ll/vxd0;->a(I)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/dkb;->la()Lrx/c;

    .line 33
    .line 34
    .line 35
    const-string p1, "e_open_wechat_notification"

    .line 36
    .line 37
    invoke-direct {p0}, Ll/tvp0;->F()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic x(Ll/tvp0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tvp0;->K(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/tvp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tvp0;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/tvp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tvp0;->J(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uvp0;->b(Ll/tvp0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/core/data/WechatNotifySetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tvp0;->o:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/al80;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/pej0;->h(Ll/al80;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public show()V
    .locals 3

    .line 1
    sget v0, Ll/vcc0;->E:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, -0x1

    .line 14
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/tvp0;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/tvp0;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    iget-object v1, p0, Ll/tvp0;->p:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Ll/tvp0;->H()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/tvp0;->m:Ll/l4g0;

    .line 44
    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    invoke-direct {p0}, Ll/tvp0;->F()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Ll/tvp0;->m:Ll/l4g0;

    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Ll/tvp0;->m:Ll/l4g0;

    .line 64
    .line 65
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/ovp0;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/ovp0;-><init>(Ll/tvp0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/pvp0;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/pvp0;-><init>(Ll/tvp0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 82
    .line 83
    .line 84
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 85
    .line 86
    .line 87
    return-void
.end method
