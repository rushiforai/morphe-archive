.class public Ll/kfm0;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Lv/VSwitchButton;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public j:Z

.field public k:Ll/l4g0;

.field public l:Landroid/view/View;

.field public m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;IZ)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Ll/kfm0;->j:Z

    .line 6
    .line 7
    new-instance p2, Ll/kfm0$a;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/kfm0$a;-><init>(Ll/kfm0;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/kfm0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 13
    .line 14
    iput-boolean p3, p0, Ll/kfm0;->j:Z

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ll/kfm0;->v(Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic q(Ll/kfm0;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfm0;->y(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic r(Ll/kfm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfm0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/kfm0;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfm0;->i:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private v(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/kfm0;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "p_my_visitor_setting"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "p_moment_visitor_set"

    .line 21
    .line 22
    :goto_0
    const-class v0, Landroid/app/Dialog;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/kfm0;->k:Ll/l4g0;

    .line 33
    .line 34
    const-string v0, "is_full"

    .line 35
    .line 36
    const-string v1, "0"

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 51
    .line 52
    .line 53
    sget p1, Ll/pec0;->X1:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/4 v0, -0x1

    .line 67
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 68
    .line 69
    const/4 v0, -0x2

    .line 70
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 71
    .line 72
    const/16 v0, 0x11

    .line 73
    .line 74
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    sget p1, Ll/ddc0;->C:I

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lv/VImage;

    .line 90
    .line 91
    iput-object p1, p0, Ll/kfm0;->a:Lv/VImage;

    .line 92
    .line 93
    sget p1, Ll/ddc0;->m:I

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lv/VImage;

    .line 100
    .line 101
    iput-object p1, p0, Ll/kfm0;->b:Lv/VImage;

    .line 102
    .line 103
    sget p1, Ll/ddc0;->H:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lv/VSwitchButton;

    .line 110
    .line 111
    iput-object p1, p0, Ll/kfm0;->c:Lv/VSwitchButton;

    .line 112
    .line 113
    sget p1, Ll/ddc0;->g:I

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Landroid/widget/TextView;

    .line 120
    .line 121
    iput-object p1, p0, Ll/kfm0;->d:Landroid/widget/TextView;

    .line 122
    .line 123
    sget p1, Ll/ddc0;->F:I

    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Landroid/widget/TextView;

    .line 130
    .line 131
    iput-object p1, p0, Ll/kfm0;->e:Landroid/widget/TextView;

    .line 132
    .line 133
    sget p1, Ll/ddc0;->I:I

    .line 134
    .line 135
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Landroid/widget/TextView;

    .line 140
    .line 141
    iput-object p1, p0, Ll/kfm0;->f:Landroid/widget/TextView;

    .line 142
    .line 143
    sget p1, Ll/ddc0;->w:I

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Ll/kfm0;->l:Landroid/view/View;

    .line 150
    .line 151
    invoke-direct {p0}, Ll/kfm0;->w()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Ll/kfm0;->u()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method private w()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/kfm0;->d:Landroid/widget/TextView;

    .line 16
    .line 17
    const-string v1, "\u6211\u7684\u8bbf\u5ba2\u8bbe\u7f6e"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/kfm0;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    const-string v1, "\u5173\u95ed\u540e\uff0c\u65e0\u6cd5\u67e5\u770b\u8c01\u770b\u4e86\u4f60\uff1b\u540c\u65f6\uff0c\u4f60\u67e5\u770b\u4ed6\u4eba\u65f6\u4e0d\u4f1a\u7559\u4e0b\u8bb0\u5f55\u3002"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/kfm0;->f:Landroid/widget/TextView;

    .line 30
    .line 31
    const-string v1, "\u5f00\u542f\u6211\u7684\u8bbf\u5ba2"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/rs9;->i()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object p0, p0, Ll/kfm0;->l:Landroid/view/View;

    .line 43
    .line 44
    sget v0, Ll/qa00;->E:I

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kfm0;->g:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/kfm0;->g:Ll/y20;

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/kfm0;->j:Z

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/kfm0;->k:Ll/l4g0;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/kfm0;->k:Ll/l4g0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 33
    .line 34
    .line 35
    :cond_1
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
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/kfm0;->i:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 17
    .line 18
    iget-object v1, p0, Ll/kfm0;->h:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/gbc0;->k:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/kfm0;->i:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    const/4 v1, 0x3

    .line 36
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/kfm0;->i:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 40
    .line 41
    iget-object v1, p0, Ll/kfm0;->m:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/kfm0;->k:Ll/l4g0;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/kfm0;->k:Ll/l4g0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public t(Ll/y20;)Ll/kfm0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/kfm0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kfm0;->g:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kfm0;->a:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ifm0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ifm0;-><init>(Ll/kfm0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/kfm0;->c:Lv/VSwitchButton;

    .line 12
    .line 13
    new-instance v1, Ll/jfm0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/jfm0;-><init>(Ll/kfm0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lv/VSwitchButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kfm0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/kfm0;->j:Z

    .line 2
    .line 3
    xor-int/lit8 p2, p1, 0x1

    .line 4
    .line 5
    iput-boolean p2, p0, Ll/kfm0;->j:Z

    .line 6
    .line 7
    iget-object p2, p0, Ll/kfm0;->b:Lv/VImage;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/gbc0;->M5:I

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget p1, Ll/gbc0;->L5:I

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Y9()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iget-boolean p1, p0, Ll/kfm0;->j:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const-string p1, "e_moment_visitor_set_on"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    const-string p1, "e_moment_visitor_set_off"

    .line 44
    .line 45
    :goto_1
    const-string p2, "p_moment_visitor_set"

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-boolean p0, p0, Ll/kfm0;->j:Z

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "open"

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    const-string p0, "close"

    .line 58
    .line 59
    :goto_2
    const-string p1, "action"

    .line 60
    .line 61
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {p0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "e_my_visitor_setting_status"

    .line 70
    .line 71
    const-string p2, "p_my_visitor_setting"

    .line 72
    .line 73
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
