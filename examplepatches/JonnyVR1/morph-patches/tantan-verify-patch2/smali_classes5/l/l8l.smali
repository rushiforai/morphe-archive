.class public Ll/l8l;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l8l$c;
    }
.end annotation


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public final l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/l4g0;

.field public final n:Ljava/lang/Runnable;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:Ljava/lang/String;

.field public final r:I

.field public final s:Ljava/lang/String;

.field public final t:Ljava/lang/String;

.field public final u:Ljava/lang/String;

.field public final v:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/l8l$c;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/l8l$c;->a(Ll/l8l$c;)Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/agc0;->c:I

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ll/l8l$c;->a(Ll/l8l$c;)Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/l8l;->l:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-static {p1}, Ll/l8l$c;->j(Ll/l8l$c;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/l8l;->o:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Ll/l8l$c;->i(Ll/l8l$c;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/l8l;->p:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Ll/l8l$c;->f(Ll/l8l$c;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/l8l;->q:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Ll/l8l$c;->e(Ll/l8l$c;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Ll/l8l;->r:I

    .line 39
    .line 40
    invoke-static {p1}, Ll/l8l$c;->c(Ll/l8l$c;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/l8l;->s:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1}, Ll/l8l$c;->b(Ll/l8l$c;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/l8l;->t:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p1}, Ll/l8l$c;->h(Ll/l8l$c;)Ljava/lang/Runnable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/l8l;->n:Ljava/lang/Runnable;

    .line 57
    .line 58
    invoke-static {p1}, Ll/l8l$c;->g(Ll/l8l$c;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p1}, Ll/l8l$c;->d(Ll/l8l$c;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Ll/l8l;->v:Ljava/lang/String;

    .line 69
    .line 70
    const/4 p1, 0x0

    .line 71
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public synthetic constructor <init>(Ll/l8l$c;Ll/m8l;)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Ll/l8l;-><init>(Ll/l8l$c;)V

    return-void
.end method

.method public static synthetic A(Ll/l8l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8l;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/l8l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l8l;->G()V

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
    iget-object v1, p0, Ll/l8l;->f:Lv/VLinear;

    .line 6
    .line 7
    new-instance v2, Ll/i8l;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/i8l;-><init>(Ll/l8l;)V

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
    new-instance v1, Ll/l8l$b;

    .line 58
    .line 59
    invoke-direct {v1, p0, v0}, Ll/l8l$b;-><init>(Ll/l8l;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

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
    iget-object v0, p0, Ll/l8l;->l:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/l8l;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Ll/l8l;->g:Lv/VImage;

    .line 24
    .line 25
    new-instance v1, Ll/j8l;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/j8l;-><init>(Ll/l8l;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/l8l;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    new-instance v1, Ll/k8l;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/k8l;-><init>(Ll/l8l;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/l8l;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 44
    .line 45
    iget-object v1, p0, Ll/l8l;->o:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/l8l;->j:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p0, Ll/l8l;->p:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/l8l;->q:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object v2, p0, Ll/l8l;->h:Lv/VDraweeView;

    .line 64
    .line 65
    new-instance v3, Ll/l8l$a;

    .line 66
    .line 67
    invoke-direct {v3, p0}, Ll/l8l$a;-><init>(Ll/l8l;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2, v0, v3}, Ll/fsb0;->M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    iget v0, p0, Ll/l8l;->r:I

    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    iget-object v1, p0, Ll/l8l;->h:Lv/VDraweeView;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/l8l;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 84
    .line 85
    iget-object v1, p0, Ll/l8l;->s:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 91
    .line 92
    sget v1, Ll/dbc0;->Q4:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    iget-object v1, p0, Ll/l8l;->t:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 111
    .line 112
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/l8l;->k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    .line 120
    :catch_0
    :cond_2
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
    iget-object p0, p0, Ll/l8l;->f:Lv/VLinear;

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
    iget-object p1, p0, Ll/l8l;->n:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/l8l;->n:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Ll/l8l;->v:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/l8l;->v:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic J(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/l8l;->m:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "HomeCommonBottomSheetDialog_"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, v0, p0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic K(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "HomeCommonBottomSheetDialog_"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p1, v0, p0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic x(Ll/l8l;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8l;->K(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/l8l;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8l;->J(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z(Ll/l8l;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8l;->H(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/n8l;->b(Ll/l8l;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-direct {p0}, Ll/l8l;->F()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/l8l;->u:Ljava/lang/String;

    .line 16
    .line 17
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/l8l;->m:Ll/l4g0;

    .line 28
    .line 29
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    new-instance p1, Ll/g8l;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/g8l;-><init>(Ll/l8l;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/h8l;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ll/h8l;-><init>(Ll/l8l;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/l8l;->E()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
