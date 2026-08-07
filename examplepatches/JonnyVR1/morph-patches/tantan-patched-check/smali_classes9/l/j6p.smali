.class public Ll/j6p;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VIcon;

.field public i:Landroid/view/View;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Ll/l4g0;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/lang/String;


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
    const-string v0, "p_edit_profile_save_drainage_notice"

    .line 5
    .line 6
    iput-object v0, p0, Ll/j6p;->q:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/j6p;->E(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic A(Ll/j6p;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j6p;->G(Landroid/view/View;)V

    return-void
.end method

.method private E(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Ll/j6p;->C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private F()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/j6p;->l:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j6p;->D()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/j6p;->h:Lv/VIcon;

    .line 13
    .line 14
    new-instance v1, Ll/g6p;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/g6p;-><init>(Ll/j6p;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/j6p;->m:Lv/VText;

    .line 23
    .line 24
    new-instance v1, Ll/h6p;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h6p;-><init>(Ll/j6p;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/j6p;->n:Lv/VText;

    .line 33
    .line 34
    new-instance v1, Ll/i6p;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/i6p;-><init>(Ll/j6p;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_edit_drainage_alert_cancel_btn"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_save_drainage_notice"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_edit_drainage_alert_submit_btn"

    .line 2
    .line 3
    const-string v0, "p_edit_profile_save_drainage_notice"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/j6p;->p:Ll/y20;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic J(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j6p;->o:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic x(Ll/j6p;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j6p;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/j6p;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j6p;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/j6p;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j6p;->J(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k6p;->b(Ll/j6p;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final D()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "zh-TW"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x2

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "zh-CN"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x1

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "id-ID"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x0

    .line 49
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 50
    .line 51
    .line 52
    const-string p0, "https://auto.tancdn.com/v1/raw/4dd7e1eb-c1d2-4c27-93ba-e8a237a8bb5814.webp"

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_0
    const-string p0, "https://auto.tancdn.com/v1/raw/2751fa70-454b-4c09-adc0-1bc0d355b24d14.webp"

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_1
    const-string p0, "https://auto.tancdn.com/v1/raw/5f30b78d-ac36-40c1-afdc-f1d428ee54ed14.webp"

    .line 59
    .line 60
    return-object p0

    .line 61
    :pswitch_2
    const-string p0, "https://auto.tancdn.com/v1/raw/d2c74a5a-72a0-4785-8d3d-55348728304f14.webp"

    .line 62
    .line 63
    return-object p0

    .line 64
    nop

    .line 65
    :sswitch_data_0
    .sparse-switch
        0x5f5cb0d -> :sswitch_2
        0x6e72b6a -> :sswitch_1
        0x6e72d82 -> :sswitch_0
    .end sparse-switch

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public K(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/uxj0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j6p;->p:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Ll/j6p;->F()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/j6p;->o:Ll/l4g0;

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    const-class v0, Ll/j6p;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "p_edit_profile_save_drainage_notice"

    .line 48
    .line 49
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/j6p;->o:Ll/l4g0;

    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/j6p;->o:Ll/l4g0;

    .line 56
    .line 57
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/f6p;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/f6p;-><init>(Ll/j6p;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
