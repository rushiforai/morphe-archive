.class public final Ll/ebn;
.super Ll/g6e;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g6e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->xf:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    sget v1, Ll/adc0;->F5:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Ll/adc0;->w5:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/ImageView;

    .line 27
    .line 28
    sget v3, Ll/adc0;->je:I

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/widget/TextView;

    .line 35
    .line 36
    sget v4, Ll/adc0;->f3:I

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Lv/VButton;

    .line 43
    .line 44
    sget v5, Ll/adc0;->kf:I

    .line 45
    .line 46
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Lv/VButton;

    .line 51
    .line 52
    sget-object v6, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    if-ne p1, v6, :cond_0

    .line 55
    .line 56
    const-string v7, "vip"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const-string v7, "see"

    .line 60
    .line 61
    :goto_0
    const-class v8, Lcom/p1/mobile/android/app/Dialog;

    .line 62
    .line 63
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    const-string v9, "p_privilege_activated"

    .line 68
    .line 69
    invoke-static {v9, v8}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    const-string v9, "productType"

    .line 74
    .line 75
    invoke-static {v9, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    const-string v9, "skuID"

    .line 80
    .line 81
    invoke-static {v9, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    filled-new-array {v7, p2}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {v8, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    new-instance v0, Ll/dbn;

    .line 101
    .line 102
    invoke-direct {v0, v8}, Ll/dbn;-><init>(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2, v0}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    new-instance v0, Ll/nan;

    .line 110
    .line 111
    invoke-direct {v0, v8}, Ll/nan;-><init>(Ll/l4g0;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, v0}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {p2}, Ll/jl80$a;->r0()Ll/jl80;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    if-ne p1, v6, :cond_1

    .line 123
    .line 124
    sget p1, Ll/dbc0;->sv:I

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 131
    .line 132
    .line 133
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Xs:I

    .line 134
    .line 135
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_1
    const/16 p1, 0x8

    .line 140
    .line 141
    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    sget p1, Ll/dbc0;->Ps:I

    .line 145
    .line 146
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const/high16 v0, 0x42c40000    # 98.0f

    .line 154
    .line 155
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 160
    .line 161
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 162
    .line 163
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ws:I

    .line 164
    .line 165
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 166
    .line 167
    .line 168
    :goto_1
    new-instance p1, Ll/oan;

    .line 169
    .line 170
    invoke-direct {p1, p2}, Ll/oan;-><init>(Ll/jl80;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    new-instance p1, Ll/pan;

    .line 177
    .line 178
    invoke-direct {p1, p0, p2}, Ll/pan;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)Lcom/p1/mobile/android/app/Dialog;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;)",
            "Lcom/p1/mobile/android/app/Dialog;"
        }
    .end annotation

    .line 1
    const-string v0, "p_download_data_submit_email_popup"

    .line 2
    .line 3
    const-string v1, "showEmailInputDlg"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget p1, Ll/kec0;->od:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance p1, Ll/man;

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ll/man;-><init>(Ll/l4g0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget p2, Ll/adc0;->r3:I

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lv/VEditText;

    .line 69
    .line 70
    new-instance p2, Ll/van;

    .line 71
    .line 72
    invoke-direct {p2, p1}, Ll/van;-><init>(Lv/VEditText;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    new-instance p2, Ll/wan;

    .line 79
    .line 80
    invoke-direct {p2, p0}, Ll/wan;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 84
    .line 85
    .line 86
    new-instance p2, Ll/xan;

    .line 87
    .line 88
    invoke-direct {p2, p5, p1, p0}, Ll/xan;-><init>(Ll/z20;Lv/VEditText;Lcom/p1/mobile/android/app/Dialog;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 92
    .line 93
    .line 94
    new-instance p1, Ll/yan;

    .line 95
    .line 96
    invoke-direct {p1, p0}, Ll/yan;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 103
    .line 104
    .line 105
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 106
    .line 107
    .line 108
    return-object p0
.end method

.method public static C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 7

    .line 1
    const-string v0, "p_get_privilege_failed"

    .line 2
    .line 3
    const-string v1, "showGPRestoreDlg"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v5, "anywhere"

    .line 10
    .line 11
    const-string v6, "pay_fail"

    .line 12
    .line 13
    const-string v1, "passive"

    .line 14
    .line 15
    const-string v2, "alert"

    .line 16
    .line 17
    const-string v3, "alert_special"

    .line 18
    .line 19
    const-string v4, "purchase_button"

    .line 20
    .line 21
    invoke-static/range {v1 .. v6}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/jl80$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    sget p0, Ll/dbc0;->Vt:I

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, p3}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ll/ran;

    .line 52
    .line 53
    invoke-direct {p1, v0}, Ll/ran;-><init>(Ll/l4g0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p4}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "p_privilege_renew_pending_dialog"

    .line 2
    .line 3
    const-string v1, "showSubsErrorDlg"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "dialog_show_from"

    .line 10
    .line 11
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p2}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget v1, Ll/kec0;->df:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {p2, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget v1, Ll/adc0;->P1:I

    .line 38
    .line 39
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2, p2}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    sget v2, Lcom/p1/mobile/putong/core/R$string;->y6:I

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    sget v2, Lcom/p1/mobile/putong/core/R$string;->v6:I

    .line 68
    .line 69
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    new-instance v2, Ll/san;

    .line 78
    .line 79
    invoke-direct {v2, v0}, Ll/san;-><init>(Ll/l4g0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    sget v0, Lcom/p1/mobile/putong/core/R$string;->w6:I

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget v2, Lcom/p1/mobile/putong/core/R$string;->x6:I

    .line 97
    .line 98
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    filled-new-array {v2}, [Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    const-string v3, "#d84d37"

    .line 111
    .line 112
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 117
    .line 118
    invoke-static {v0, v2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    new-instance v0, Ll/tan;

    .line 126
    .line 127
    invoke-direct {v0, p1, p0}, Ll/tan;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Ll/uan;

    .line 134
    .line 135
    invoke-direct {p0}, Ll/uan;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v2, "e_privilege_renew_update"

    .line 5
    .line 6
    const-string v3, "p_privilege_renew_pending_dialog"

    .line 7
    .line 8
    invoke-static {v2, v3, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/content/Intent;

    .line 12
    .line 13
    const-string v2, "https://play.google.com/store/account/subscriptions"

    .line 14
    .line 15
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "sku"

    .line 24
    .line 25
    invoke-virtual {v2, v3, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v2, "package"

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {p0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v2, "android.intent.action.VIEW"

    .line 44
    .line 45
    invoke-direct {v1, v2, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v1, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public static synthetic j()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_privilege_renew_giveup"

    .line 5
    .line 6
    const-string v2, "p_privilege_renew_pending_dialog"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic k(Ll/z20;Lv/VEditText;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 2

    .line 1
    const-string v0, "e_download_data_submit_email_button"

    .line 2
    .line 3
    const-string v1, "p_download_data_submit_email_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/qan;

    .line 27
    .line 28
    invoke-direct {v0, p2}, Ll/qan;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_privilege_activated_view_privilege_button"

    .line 5
    .line 6
    const-string v1, "p_privilege_activated"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipAct;

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic q(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_privilege_activated_done_button"

    .line 5
    .line 6
    const-string v1, "p_privilege_activated"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic t(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ll/x20;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_vip_upgrade_popup_purchase_button"

    .line 5
    .line 6
    const-string v2, "p_vip_upgrade_popup"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic x(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x5

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)Lcom/p1/mobile/android/app/Dialog;
    .locals 9

    .line 1
    const-string v0, "p_vip_upgrade_popup"

    .line 2
    .line 3
    const-string v1, "dialog"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v2, "passive"

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Ll/agc0;->F:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ll/kec0;->vd:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Lcom/p1/mobile/putong/core/R$string;->q:I

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Al:I

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget v3, Ll/dbc0;->d:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->x0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v2, Ll/zan;

    .line 84
    .line 85
    invoke-direct {v2, v0}, Ll/zan;-><init>(Ll/l4g0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B0(Landroid/content/DialogInterface$OnShowListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v2, Ll/abn;

    .line 93
    .line 94
    invoke-direct {v2, v0}, Ll/abn;-><init>(Ll/l4g0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    sget v2, Ll/adc0;->je:I

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Lv/VText;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    sget v3, Ll/adc0;->sf:I

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lv/VDraweeView;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    sget v4, Ll/adc0;->tf:I

    .line 134
    .line 135
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    check-cast v3, Lv/VImage;

    .line 140
    .line 141
    sget v4, Ll/dbc0;->ts:I

    .line 142
    .line 143
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    sget v4, Ll/adc0;->uf:I

    .line 151
    .line 152
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Lv/VText;

    .line 157
    .line 158
    sget v4, Lcom/p1/mobile/putong/core/R$string;->jh:I

    .line 159
    .line 160
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    const/4 v5, 0x3

    .line 165
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Gm:I

    .line 178
    .line 179
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    const-string v6, "3"

    .line 184
    .line 185
    filled-new-array {v6, v5}, [Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-static {v5}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    const-string v7, "#e1a11c"

    .line 194
    .line 195
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v7

    .line 199
    sget-object v8, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 200
    .line 201
    invoke-static {v4, v5, v7, v8}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    sget v5, Lcom/p1/mobile/putong/core/R$string;->kh:I

    .line 206
    .line 207
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-static {p0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-eqz p0, :cond_0

    .line 230
    .line 231
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 232
    .line 233
    const/4 v1, 0x0

    .line 234
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {p0, v2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_0
    new-instance p0, Ll/bbn;

    .line 244
    .line 245
    invoke-direct {p0, p2}, Ll/bbn;-><init>(Ll/x20;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog;->o0(Ljava/lang/Runnable;)V

    .line 249
    .line 250
    .line 251
    new-instance p0, Ll/cbn;

    .line 252
    .line 253
    invoke-direct {p0}, Ll/cbn;-><init>()V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog;->m0(Ljava/lang/Runnable;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 260
    .line 261
    .line 262
    return-object v0
.end method
