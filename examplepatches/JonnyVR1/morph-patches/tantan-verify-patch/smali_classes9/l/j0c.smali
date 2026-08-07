.class public Ll/j0c;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/j0c;Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j0c;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V

    return-void
.end method


# virtual methods
.method public final L3(J)V
    .locals 1

    .line 1
    new-instance v0, Ll/j0c$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j0c$b;-><init>(Ll/j0c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j0c;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/mdc0;->A2:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v1, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/mdc0;->L0:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lv/VText;

    .line 28
    .line 29
    iget-object p0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget v2, Ll/mdc0;->D0:I

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lv/VText;

    .line 42
    .line 43
    const-string v2, "context_livingAct"

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->icon:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->color:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_0

    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 63
    .line 64
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->color:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->count:I

    .line 77
    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->count:I

    .line 85
    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v2, "x%s"

    .line 95
    .line 96
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    const/16 v0, 0x8

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 107
    .line 108
    .line 109
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->content:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public O3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->displayTime:I

    .line 6
    .line 7
    if-gtz v0, :cond_1

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_1
    iget-object v1, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    if-nez v1, :cond_5

    .line 14
    .line 15
    int-to-long v0, v0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/j0c;->L3(J)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/yec0;->p0:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 58
    .line 59
    const/16 v2, 0x1a

    .line 60
    .line 61
    if-lt v1, v2, :cond_2

    .line 62
    .line 63
    const/16 v1, 0x7f6

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    const/16 v1, 0x7d5

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_0
    iget-object v1, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_4

    .line 81
    .line 82
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_4

    .line 89
    .line 90
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->eid:Ljava/lang/String;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;->pid:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ll/j0c;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveCustomToast;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 103
    .line 104
    .line 105
    :cond_4
    const/4 p1, 0x0

    .line 106
    invoke-virtual {v0, p1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 107
    .line 108
    .line 109
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 110
    .line 111
    invoke-direct {v1, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const/16 v2, 0x8

    .line 122
    .line 123
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 124
    .line 125
    const/high16 v2, 0x43610000    # 225.0f

    .line 126
    .line 127
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 132
    .line 133
    const/high16 v2, 0x42880000    # 68.0f

    .line 134
    .line 135
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 142
    .line 143
    .line 144
    const/4 v1, 0x0

    .line 145
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 149
    .line 150
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 154
    .line 155
    new-instance v0, Ll/j0c$a;

    .line 156
    .line 157
    invoke-direct {v0, p0}, Ll/j0c$a;-><init>(Ll/j0c;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 161
    .line 162
    .line 163
    :cond_5
    :goto_1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CustomToastEvent:Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CustomToastEvent;->showCustomToast()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/h0c;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h0c;-><init>(Ll/j0c;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/i0c;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/i0c;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method
