.class public Ll/zta0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zta0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tta0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public f:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public final h:Landroid/content/Context;

.field public final i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

.field public j:Ll/tta0;

.field public k:I

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/zta0;->k:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/zta0;->l:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/zta0;->h:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 13
    .line 14
    return-void
.end method

.method private synthetic A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Ll/zta0;->E(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/zta0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zta0;->C(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/zta0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zta0;->B(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Ll/zta0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/zta0;->A(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ljava/lang/Object;I)V

    return-void
.end method

.method public static synthetic d(Ll/zta0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zta0;->z()V

    return-void
.end method

.method public static synthetic e(Ll/zta0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zta0;->F()V

    return-void
.end method

.method public static bridge synthetic f(Ll/zta0;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    return-void
.end method

.method public static bridge synthetic i(Ll/zta0;Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->f:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    return-void
.end method

.method public static bridge synthetic j(Ll/zta0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->a:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic k(Ll/zta0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->c:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic l(Ll/zta0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic m(Ll/zta0;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    return-void
.end method

.method public static bridge synthetic n(Ll/zta0;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->b:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zta0;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 13
    .line 14
    new-instance v0, Ll/uta0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/uta0;-><init>(Ll/zta0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setOnItemSelectedListener(Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker$a;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/zta0;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 23
    .line 24
    iget-object v0, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/xra;->f()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p0, p1}, Ll/zta0;->H(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/zta0;->a:Landroid/widget/TextView;

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 69
    .line 70
    invoke-static {v0}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    iget-object v1, p0, Ll/zta0;->b:Landroid/widget/TextView;

    .line 81
    .line 82
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/zta0;->c:Lv/VFrame;

    .line 86
    .line 87
    const/high16 v1, 0x41d80000    # 27.0f

    .line 88
    .line 89
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Ll/zta0;->b:Landroid/widget/TextView;

    .line 97
    .line 98
    const-string p1, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 99
    .line 100
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    :cond_1
    return-void
.end method

.method public final synthetic B(Ll/uxj0;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 28
    .line 29
    iget-boolean v3, v2, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 30
    .line 31
    iput-boolean v3, v1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    iput-boolean p1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/zta0;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->f()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic C(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zta0;->h:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zta0;->j:Ll/tta0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/tta0;->h0(I)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v1, p0, Ll/zta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Ll/zta0;->k:I

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-ne p1, v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget-object p0, p0, Ll/zta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 47
    .line 48
    const/4 v0, -0x1

    .line 49
    if-ne p1, v0, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move v2, p1

    .line 53
    :goto_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p0, p0, Ll/zta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final F()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 26
    .line 27
    const-string v3, ""

    .line 28
    .line 29
    iput-object v3, v2, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 30
    .line 31
    const-string v3, "default"

    .line 32
    .line 33
    invoke-static {v3}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iput-object v3, v2, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 38
    .line 39
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "student"

    .line 58
    .line 59
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 92
    .line 93
    invoke-virtual {v2, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v1, Ll/xta0;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/xta0;-><init>(Ll/zta0;)V

    .line 104
    .line 105
    .line 106
    new-instance v2, Ll/yta0;

    .line 107
    .line 108
    invoke-direct {v2, p0}, Ll/yta0;-><init>(Ll/zta0;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    :cond_1
    return-void
.end method

.method public G(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zta0;->j:Ll/tta0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tta0;->g0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Ll/zta0;->c:Lv/VFrame;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v1, 0x1

    .line 21
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setData(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, -0x1

    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    move p1, v3

    .line 33
    :cond_1
    iput p1, p0, Ll/zta0;->k:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 38
    .line 39
    .line 40
    iget p1, p0, Ll/zta0;->k:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/zta0;->E(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zta0;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zta0;->f:Lcom/p1/mobile/putong/core/newui/home/HomeErrorNetView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/zta0;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->g()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tta0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zta0;->q(Ll/tta0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zta0;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zta0$a;->a(Ll/zta0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Ll/tta0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zta0;->j:Ll/tta0;

    .line 2
    .line 3
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->h2:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->i2:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/vta0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/vta0;-><init>(Ll/zta0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/zta0;->y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->d2:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v2, Ll/wta0;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/wta0;-><init>(Ll/zta0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zta0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public v()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zta0;->j:Ll/tta0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tta0;->g0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v2, p0, Ll/zta0;->k:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-lez v2, :cond_2

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    const-string v4, "\u5b66\u751f"

    .line 29
    .line 30
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    :cond_0
    iget p0, p0, Ll/zta0;->k:I

    .line 43
    .line 44
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, "Student"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_2

    .line 63
    .line 64
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 97
    .line 98
    const-string v0, "verified"

    .line 99
    .line 100
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    return p0

    .line 105
    :cond_2
    return v3
.end method

.method public w(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/zta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->getSelectItem()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 24
    .line 25
    const-string v2, "\u6682\u4e0d\u900f\u9732"

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const-string v4, ""

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    move-object v3, v4

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object v3, v0

    .line 38
    :goto_0
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "\u5b66\u751f"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v3, 0x1

    .line 47
    const/4 v5, 0x0

    .line 48
    if-nez v1, :cond_3

    .line 49
    .line 50
    const-string v1, "Student"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 62
    .line 63
    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 66
    .line 67
    iput-boolean v3, p1, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 68
    .line 69
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    move-object p0, v4

    .line 76
    :cond_2
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 82
    .line 83
    iput-boolean v3, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 86
    .line 87
    iput-boolean v5, p0, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 88
    .line 89
    return-void
.end method

.method public x()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zta0;->i:Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public y()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zta0;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    .line 2
    .line 3
    iget v1, p0, Ll/zta0;->k:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;->setSelectedItemPosition(I)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ll/zta0;->k:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/zta0;->E(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
