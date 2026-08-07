.class public Ll/u3x;
.super Ll/pej0;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public A:[Landroid/view/View;

.field public B:I

.field public C:Z

.field public final D:I

.field public E:Z

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Ll/l4g0;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Lv/VImage;

.field public p:Lv/VImage;

.field public q:Landroid/widget/LinearLayout;

.field public r:Landroid/widget/LinearLayout;

.field public s:Landroid/widget/LinearLayout;

.field public t:Landroid/widget/LinearLayout;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/LinearLayout;

.field public w:Landroid/widget/LinearLayout;

.field public x:Landroid/widget/LinearLayout;

.field public y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Purpose;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public z:[Lv/VImage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2
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
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Ll/u3x;->B:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/u3x;->C:Z

    .line 11
    .line 12
    const/4 v1, 0x7

    .line 13
    iput v1, p0, Ll/u3x;->D:I

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/u3x;->E:Z

    .line 16
    .line 17
    iput-object p1, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iput-object p2, p0, Ll/u3x;->g:Ljava/lang/String;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string p2, "p_dating_purpose_popup"

    .line 34
    .line 35
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Ll/u3x;->h:Ll/l4g0;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic A(Ll/u3x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u3x;->H()V

    return-void
.end method

.method public static synthetic C(Ll/u3x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u3x;->K()V

    return-void
.end method

.method public static synthetic D(Ll/u3x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u3x;->L(Landroid/view/View;)V

    return-void
.end method

.method private G()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const v1, 0x1020002

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/adc0;->q2:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Ll/dbc0;->co:I

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/u3x$b;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/u3x$b;-><init>(Ll/u3x;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/s3x;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/s3x;-><init>(Landroid/view/Window;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->datingPurposePopup:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-boolean p1, p0, Ll/u3x;->C:Z

    .line 17
    .line 18
    xor-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    iput-boolean p1, p0, Ll/u3x;->C:Z

    .line 21
    .line 22
    invoke-direct {p0}, Ll/u3x;->N()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private M()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private N()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u3x;->m:Lv/VImage;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/u3x;->C:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x43340000    # 180.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    :goto_1
    iget-object v1, p0, Ll/u3x;->A:[Landroid/view/View;

    .line 16
    .line 17
    array-length v2, v1

    .line 18
    if-ge v0, v2, :cond_1

    .line 19
    .line 20
    aget-object v1, v1, v0

    .line 21
    .line 22
    iget-boolean v2, p0, Ll/u3x;->C:Z

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-boolean v0, p0, Ll/u3x;->C:Z

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    sget v0, Ll/adc0;->q2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x3

    .line 47
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public static synthetic x(Ll/u3x;Ll/pf60;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u3x;->I(Ll/pf60;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic y(Ll/u3x;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3x;->J(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public E(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/u3x;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/u3x;->E:Z

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    new-instance v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 55
    .line 56
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_3

    .line 67
    .line 68
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 71
    .line 72
    new-instance v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 73
    .line 74
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 78
    .line 79
    :cond_3
    iget-object v1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Ll/pf60;

    .line 86
    .line 87
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 92
    .line 93
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast v2, Lcom/p1/mobile/putong/data/Purpose;

    .line 96
    .line 97
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iput-object v2, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 102
    .line 103
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v1, Lcom/p1/mobile/putong/data/Purpose;

    .line 106
    .line 107
    const-string v2, "marriage"

    .line 108
    .line 109
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_5

    .line 114
    .line 115
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 120
    .line 121
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 130
    .line 131
    new-instance v2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 132
    .line 133
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 137
    .line 138
    :cond_4
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 141
    .line 142
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 143
    .line 144
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v2, Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    iput-object v2, v1, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->expectedTime:Ljava/util/List;

    .line 153
    .line 154
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 155
    .line 156
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 157
    .line 158
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    if-nez v0, :cond_6

    .line 167
    .line 168
    :goto_0
    return-void

    .line 169
    :cond_6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p0, v0}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    new-instance v1, Ll/p3x;

    .line 182
    .line 183
    invoke-direct {v1, p0, p1}, Ll/p3x;-><init>(Ll/u3x;Ll/pf60;)V

    .line 184
    .line 185
    .line 186
    new-instance p1, Ll/q3x;

    .line 187
    .line 188
    invoke-direct {p1, p0}, Ll/q3x;-><init>(Ll/u3x;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/u3x;->z:[Lv/VImage;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    iget v2, p0, Ll/u3x;->B:I

    .line 10
    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    sget v2, Ll/dbc0;->Vd:I

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    sget v2, Ll/dbc0;->Ud:I

    .line 17
    .line 18
    :goto_1
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return-void
.end method

.method public final synthetic H()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/y5x;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I(Ll/pf60;Ll/uxj0;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/u3x;->E:Z

    .line 3
    .line 4
    invoke-static {}, Ll/gra;->e2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Purpose;

    .line 13
    .line 14
    const-string v0, "marriage"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p2, Ll/t3x;

    .line 27
    .line 28
    invoke-direct {p2, p0}, Ll/t3x;-><init>(Ll/u3x;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/u3x;->dismiss()V

    .line 36
    .line 37
    .line 38
    if-nez p2, :cond_1

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v0, p0, Ll/u3x;->y:Ljava/util/List;

    .line 49
    .line 50
    iget v1, p0, Ll/u3x;->B:I

    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ll/pf60;

    .line 57
    .line 58
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Lcom/p1/mobile/putong/data/Purpose;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {p1, v0}, Ll/baj;->N(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    iget-object p1, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-static {p1}, Ll/baj;->b0(Lcom/p1/mobile/android/app/Act;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v0, p0, Ll/u3x;->g:Ljava/lang/String;

    .line 86
    .line 87
    sget-object v1, Ll/baj;->h:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-static {}, Ll/baj;->s()Landroid/util/Pair;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v1, Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, p1}, Ll/baj;->Y(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 110
    .line 111
    .line 112
    if-nez p2, :cond_2

    .line 113
    .line 114
    invoke-static {p1}, Ll/baj;->J(Lcom/p1/mobile/putong/data/User;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_2

    .line 119
    .line 120
    iget-object p0, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    iget-object p1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast p1, Ljava/lang/String;

    .line 125
    .line 126
    iget-object p2, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast p2, Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p0, p1, p2}, Ll/baj;->Z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_2
    return-void
.end method

.method public final synthetic J(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/u3x;->E:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Hm:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic K()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u3x;->h:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u3x;->h:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/agc0;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/o3x;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/o3x;-><init>(Ll/u3x;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/u3x;->B:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/u3x;->F()V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Ll/u3x;->B:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/u3x;->E(I)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->datingPurposePopup:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/u3x;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/kec0;->a7:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Ll/u3x;->M()V

    .line 28
    .line 29
    .line 30
    sget p1, Ll/adc0;->A1:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/u3x$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/u3x$a;-><init>(Ll/u3x;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    sget p1, Ll/adc0;->db:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lv/VText;

    .line 51
    .line 52
    sget v0, Ll/adc0;->Tc:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VText;

    .line 59
    .line 60
    sget v1, Ll/adc0;->Uc:I

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lv/VText;

    .line 67
    .line 68
    sget v3, Ll/adc0;->Vc:I

    .line 69
    .line 70
    invoke-virtual {p0, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lv/VText;

    .line 75
    .line 76
    sget v4, Ll/adc0;->Wc:I

    .line 77
    .line 78
    invoke-virtual {p0, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lv/VText;

    .line 83
    .line 84
    sget v5, Ll/adc0;->Xc:I

    .line 85
    .line 86
    invoke-virtual {p0, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    check-cast v5, Lv/VText;

    .line 91
    .line 92
    const/4 v6, 0x3

    .line 93
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    const/4 v8, 0x1

    .line 98
    invoke-virtual {p1, v7, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 99
    .line 100
    .line 101
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {v0, p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 106
    .line 107
    .line 108
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {v1, p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 113
    .line 114
    .line 115
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v3, p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 120
    .line 121
    .line 122
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {v4, p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 127
    .line 128
    .line 129
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v5, p1, v8}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 134
    .line 135
    .line 136
    sget p1, Ll/adc0;->Kc:I

    .line 137
    .line 138
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lv/VImage;

    .line 143
    .line 144
    iput-object p1, p0, Ll/u3x;->i:Lv/VImage;

    .line 145
    .line 146
    sget p1, Ll/adc0;->Lc:I

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    check-cast p1, Lv/VImage;

    .line 153
    .line 154
    iput-object p1, p0, Ll/u3x;->j:Lv/VImage;

    .line 155
    .line 156
    sget p1, Ll/adc0;->Mc:I

    .line 157
    .line 158
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    check-cast p1, Lv/VImage;

    .line 163
    .line 164
    iput-object p1, p0, Ll/u3x;->k:Lv/VImage;

    .line 165
    .line 166
    sget p1, Ll/adc0;->Nc:I

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lv/VImage;

    .line 173
    .line 174
    iput-object p1, p0, Ll/u3x;->l:Lv/VImage;

    .line 175
    .line 176
    sget p1, Ll/adc0;->Sc:I

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    check-cast p1, Lv/VImage;

    .line 183
    .line 184
    iput-object p1, p0, Ll/u3x;->m:Lv/VImage;

    .line 185
    .line 186
    sget p1, Ll/adc0;->Rc:I

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Landroid/widget/LinearLayout;

    .line 193
    .line 194
    iput-object p1, p0, Ll/u3x;->x:Landroid/widget/LinearLayout;

    .line 195
    .line 196
    sget p1, Ll/adc0;->Oc:I

    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    check-cast p1, Lv/VImage;

    .line 203
    .line 204
    iput-object p1, p0, Ll/u3x;->n:Lv/VImage;

    .line 205
    .line 206
    sget p1, Ll/adc0;->Pc:I

    .line 207
    .line 208
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    check-cast p1, Lv/VImage;

    .line 213
    .line 214
    iput-object p1, p0, Ll/u3x;->o:Lv/VImage;

    .line 215
    .line 216
    sget p1, Ll/adc0;->Qc:I

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    check-cast p1, Lv/VImage;

    .line 223
    .line 224
    iput-object p1, p0, Ll/u3x;->p:Lv/VImage;

    .line 225
    .line 226
    const/4 v0, 0x7

    .line 227
    new-array v1, v0, [Lv/VImage;

    .line 228
    .line 229
    iput-object v1, p0, Ll/u3x;->z:[Lv/VImage;

    .line 230
    .line 231
    iget-object v3, p0, Ll/u3x;->i:Lv/VImage;

    .line 232
    .line 233
    aput-object v3, v1, v2

    .line 234
    .line 235
    iget-object v3, p0, Ll/u3x;->j:Lv/VImage;

    .line 236
    .line 237
    aput-object v3, v1, v8

    .line 238
    .line 239
    iget-object v3, p0, Ll/u3x;->k:Lv/VImage;

    .line 240
    .line 241
    const/4 v4, 0x2

    .line 242
    aput-object v3, v1, v4

    .line 243
    .line 244
    iget-object v3, p0, Ll/u3x;->l:Lv/VImage;

    .line 245
    .line 246
    aput-object v3, v1, v6

    .line 247
    .line 248
    iget-object v3, p0, Ll/u3x;->n:Lv/VImage;

    .line 249
    .line 250
    const/4 v5, 0x4

    .line 251
    aput-object v3, v1, v5

    .line 252
    .line 253
    iget-object v3, p0, Ll/u3x;->o:Lv/VImage;

    .line 254
    .line 255
    const/4 v7, 0x5

    .line 256
    aput-object v3, v1, v7

    .line 257
    .line 258
    const/4 v3, 0x6

    .line 259
    aput-object p1, v1, v3

    .line 260
    .line 261
    sget p1, Ll/adc0;->Cc:I

    .line 262
    .line 263
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    check-cast p1, Landroid/widget/LinearLayout;

    .line 268
    .line 269
    iput-object p1, p0, Ll/u3x;->q:Landroid/widget/LinearLayout;

    .line 270
    .line 271
    sget p1, Ll/adc0;->Dc:I

    .line 272
    .line 273
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    check-cast p1, Landroid/widget/LinearLayout;

    .line 278
    .line 279
    iput-object p1, p0, Ll/u3x;->r:Landroid/widget/LinearLayout;

    .line 280
    .line 281
    sget p1, Ll/adc0;->Ec:I

    .line 282
    .line 283
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    check-cast p1, Landroid/widget/LinearLayout;

    .line 288
    .line 289
    iput-object p1, p0, Ll/u3x;->s:Landroid/widget/LinearLayout;

    .line 290
    .line 291
    sget p1, Ll/adc0;->Fc:I

    .line 292
    .line 293
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    check-cast p1, Landroid/widget/LinearLayout;

    .line 298
    .line 299
    iput-object p1, p0, Ll/u3x;->t:Landroid/widget/LinearLayout;

    .line 300
    .line 301
    sget p1, Ll/adc0;->Gc:I

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    check-cast p1, Landroid/widget/LinearLayout;

    .line 308
    .line 309
    iput-object p1, p0, Ll/u3x;->u:Landroid/widget/LinearLayout;

    .line 310
    .line 311
    sget p1, Ll/adc0;->Hc:I

    .line 312
    .line 313
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    check-cast p1, Landroid/widget/LinearLayout;

    .line 318
    .line 319
    iput-object p1, p0, Ll/u3x;->v:Landroid/widget/LinearLayout;

    .line 320
    .line 321
    sget p1, Ll/adc0;->Ic:I

    .line 322
    .line 323
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    check-cast p1, Landroid/widget/LinearLayout;

    .line 328
    .line 329
    iput-object p1, p0, Ll/u3x;->w:Landroid/widget/LinearLayout;

    .line 330
    .line 331
    new-array v1, v0, [Landroid/view/View;

    .line 332
    .line 333
    iput-object v1, p0, Ll/u3x;->A:[Landroid/view/View;

    .line 334
    .line 335
    iget-object v9, p0, Ll/u3x;->q:Landroid/widget/LinearLayout;

    .line 336
    .line 337
    aput-object v9, v1, v2

    .line 338
    .line 339
    iget-object v9, p0, Ll/u3x;->r:Landroid/widget/LinearLayout;

    .line 340
    .line 341
    aput-object v9, v1, v8

    .line 342
    .line 343
    iget-object v8, p0, Ll/u3x;->s:Landroid/widget/LinearLayout;

    .line 344
    .line 345
    aput-object v8, v1, v4

    .line 346
    .line 347
    iget-object v4, p0, Ll/u3x;->t:Landroid/widget/LinearLayout;

    .line 348
    .line 349
    aput-object v4, v1, v6

    .line 350
    .line 351
    iget-object v4, p0, Ll/u3x;->u:Landroid/widget/LinearLayout;

    .line 352
    .line 353
    aput-object v4, v1, v5

    .line 354
    .line 355
    iget-object v4, p0, Ll/u3x;->v:Landroid/widget/LinearLayout;

    .line 356
    .line 357
    aput-object v4, v1, v7

    .line 358
    .line 359
    aput-object p1, v1, v3

    .line 360
    .line 361
    move p1, v2

    .line 362
    :goto_0
    if-ge p1, v0, :cond_0

    .line 363
    .line 364
    iget-object v1, p0, Ll/u3x;->A:[Landroid/view/View;

    .line 365
    .line 366
    aget-object v1, v1, p1

    .line 367
    .line 368
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 369
    .line 370
    .line 371
    iget-object v1, p0, Ll/u3x;->A:[Landroid/view/View;

    .line 372
    .line 373
    aget-object v1, v1, p1

    .line 374
    .line 375
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 380
    .line 381
    .line 382
    add-int/lit8 p1, p1, 0x1

    .line 383
    .line 384
    goto :goto_0

    .line 385
    :cond_0
    iget-object p1, p0, Ll/u3x;->x:Landroid/widget/LinearLayout;

    .line 386
    .line 387
    new-instance v0, Ll/r3x;

    .line 388
    .line 389
    invoke-direct {v0, p0}, Ll/r3x;-><init>(Ll/u3x;)V

    .line 390
    .line 391
    .line 392
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 393
    .line 394
    .line 395
    new-instance p1, Ljava/util/ArrayList;

    .line 396
    .line 397
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .line 399
    .line 400
    iput-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 401
    .line 402
    const-string v0, "thinking"

    .line 403
    .line 404
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    const-string v1, ""

    .line 409
    .line 410
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 418
    .line 419
    const-string v0, "friend"

    .line 420
    .line 421
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 433
    .line 434
    const-string v0, "date"

    .line 435
    .line 436
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 448
    .line 449
    const-string v0, "relationship"

    .line 450
    .line 451
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 463
    .line 464
    const-string v0, "marriage"

    .line 465
    .line 466
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    const-string v3, "in_one_year"

    .line 471
    .line 472
    invoke-static {v1, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 480
    .line 481
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    const-string v3, "in_two_years"

    .line 486
    .line 487
    invoke-static {v1, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    iget-object p1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 495
    .line 496
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    const-string v3, "at_right_time"

    .line 501
    .line 502
    invoke-static {v1, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 510
    .line 511
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 512
    .line 513
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 514
    .line 515
    .line 516
    move-result-object p1

    .line 517
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 518
    .line 519
    if-eqz v1, :cond_2

    .line 520
    .line 521
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 522
    .line 523
    if-eqz v1, :cond_2

    .line 524
    .line 525
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 526
    .line 527
    if-eqz v1, :cond_2

    .line 528
    .line 529
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 530
    .line 531
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 532
    .line 533
    .line 534
    move-result v1

    .line 535
    if-nez v1, :cond_2

    .line 536
    .line 537
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 538
    .line 539
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 540
    .line 541
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 542
    .line 543
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 544
    .line 545
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object p1

    .line 549
    check-cast p1, Lcom/p1/mobile/putong/data/Purpose;

    .line 550
    .line 551
    :goto_1
    iget-object v1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 552
    .line 553
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 554
    .line 555
    .line 556
    move-result v1

    .line 557
    if-ge v2, v1, :cond_2

    .line 558
    .line 559
    iget-object v1, p0, Ll/u3x;->y:Ljava/util/List;

    .line 560
    .line 561
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    check-cast v1, Ll/pf60;

    .line 566
    .line 567
    iget-object v3, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 568
    .line 569
    check-cast v3, Lcom/p1/mobile/putong/data/Purpose;

    .line 570
    .line 571
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 572
    .line 573
    .line 574
    move-result v3

    .line 575
    if-eqz v3, :cond_1

    .line 576
    .line 577
    iput v2, p0, Ll/u3x;->B:I

    .line 578
    .line 579
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 580
    .line 581
    check-cast v1, Lcom/p1/mobile/putong/data/Purpose;

    .line 582
    .line 583
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Purpose;

    .line 584
    .line 585
    .line 586
    move-result-object v3

    .line 587
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 588
    .line 589
    .line 590
    move-result v1

    .line 591
    if-eqz v1, :cond_1

    .line 592
    .line 593
    invoke-direct {p0}, Ll/u3x;->N()V

    .line 594
    .line 595
    .line 596
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 597
    .line 598
    goto :goto_1

    .line 599
    :cond_2
    invoke-virtual {p0}, Ll/u3x;->F()V

    .line 600
    .line 601
    .line 602
    invoke-direct {p0}, Ll/u3x;->N()V

    .line 603
    .line 604
    .line 605
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u3x;->h:Ll/l4g0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/u3x;->g:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v2, Ll/baj;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const-string v1, "active"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "passive"

    .line 20
    .line 21
    :goto_0
    const-string v2, "tooltips_trigger_mode"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "dating_purpose_popup_from"

    .line 28
    .line 29
    iget-object v3, p0, Ll/u3x;->g:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/u3x;->h:Ll/l4g0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/u3x;->h:Ll/l4g0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/u3x;->G()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
