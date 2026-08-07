.class public Ll/ugy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ugy$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Dialog;

.field public final b:Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

.field public c:Ll/l4g0;


# direct methods
.method public constructor <init>(Ll/ugy$a;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/ugy;->f(Ll/ugy$a;)Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/ugy;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 15
    .line 16
    iput-object v0, p0, Ll/ugy;->b:Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 17
    .line 18
    invoke-static {p1}, Ll/ugy$a;->i(Ll/ugy$a;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->P()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {p1}, Ll/ugy$a;->h(Ll/ugy$a;)Landroid/content/DialogInterface$OnDismissListener;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0, v1}, Ll/ugy;->l(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ll/ugy$a;->l(Ll/ugy$a;)Landroid/content/DialogInterface$OnCancelListener;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Ll/ugy;->k(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1}, Ll/ugy$a;->p(Ll/ugy$a;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-static {p1}, Ll/ugy$a;->p(Ll/ugy$a;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->f0(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object v1, p1, Ll/ugy$a;->b:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->l0(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, p1, Ll/ugy$a;->c:Ljava/lang/CharSequence;

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->e0(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {p1}, Ll/ugy$a;->e(Ll/ugy$a;)Ljava/lang/CharSequence;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 71
    .line 72
    .line 73
    invoke-static {p1}, Ll/ugy$a;->k(Ll/ugy$a;)Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_2

    .line 82
    .line 83
    invoke-static {p1}, Ll/ugy$a;->k(Ll/ugy$a;)Ljava/lang/CharSequence;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Ll/qgy;

    .line 88
    .line 89
    invoke-direct {v2, p0, p1}, Ll/qgy;-><init>(Ll/ugy;Ll/ugy$a;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->T(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-static {p1}, Ll/ugy$a;->o(Ll/ugy$a;)Ljava/lang/CharSequence;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-nez v1, :cond_3

    .line 104
    .line 105
    invoke-static {p1}, Ll/ugy$a;->o(Ll/ugy$a;)Ljava/lang/CharSequence;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    new-instance v2, Ll/rgy;

    .line 110
    .line 111
    invoke-direct {v2, p0, p1}, Ll/rgy;-><init>(Ll/ugy;Ll/ugy$a;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->W(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 115
    .line 116
    .line 117
    :cond_3
    invoke-static {p1}, Ll/ugy$a;->q(Ll/ugy$a;)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-lez p0, :cond_4

    .line 122
    .line 123
    invoke-static {p1}, Ll/ugy$a;->q(Ll/ugy$a;)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->B(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 128
    .line 129
    .line 130
    :cond_4
    invoke-static {p1}, Ll/ugy$a;->f(Ll/ugy$a;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_5

    .line 139
    .line 140
    invoke-static {p1}, Ll/ugy$a;->f(Ll/ugy$a;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p1}, Ll/ugy$a;->g(Ll/ugy$a;)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->z(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-static {p1}, Ll/ugy$a;->m(Ll/ugy$a;)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_6

    .line 160
    .line 161
    invoke-static {p1}, Ll/ugy$a;->d(Ll/ugy$a;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->L(Z)V

    .line 166
    .line 167
    .line 168
    invoke-static {p1}, Ll/ugy$a;->c(Ll/ugy$a;)I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    invoke-static {p1}, Ll/ugy$a;->m(Ll/ugy$a;)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->V(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 177
    .line 178
    .line 179
    :cond_6
    iget-object p0, p1, Ll/ugy$a;->s:Landroid/view/View;

    .line 180
    .line 181
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_7

    .line 186
    .line 187
    iget-object p0, p1, Ll/ugy$a;->s:Landroid/view/View;

    .line 188
    .line 189
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->N(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 190
    .line 191
    .line 192
    :cond_7
    return-void
.end method

.method public synthetic constructor <init>(Ll/ugy$a;Ll/vgy;)V
    .locals 0

    .line 193
    invoke-direct {p0, p1}, Ll/ugy;-><init>(Ll/ugy$a;)V

    return-void
.end method

.method public static synthetic a(Ll/ugy;Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ugy;->j(Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/ugy;Ll/ugy$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ugy;->h(Ll/ugy$a;)V

    return-void
.end method

.method public static synthetic c(Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/ugy;Ll/ugy$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ugy;->i(Ll/ugy$a;)V

    return-void
.end method

.method public static f(Ll/ugy$a;)Lcom/p1/mobile/android/app/Dialog;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ugy$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/bgc0;->c:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/pec0;->H0:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/high16 v1, 0x41c00000    # 24.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v2, v3, v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p0}, Ll/ugy$a;->b(Ll/ugy$a;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method


# virtual methods
.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugy;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugy;->b:Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic h(Ll/ugy$a;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/ugy$a;->j(Ll/ugy$a;)Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/ugy$a;->j(Ll/ugy$a;)Ll/y20;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/ugy;->e()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic i(Ll/ugy$a;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/ugy$a;->n(Ll/ugy$a;)Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/ugy$a;->n(Ll/ugy$a;)Ll/y20;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {p1}, Ll/ugy$a;->a(Ll/ugy$a;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ugy;->e()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic j(Landroid/content/DialogInterface$OnDismissListener;Landroid/content/DialogInterface;)V
    .locals 1

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
    invoke-interface {p1, p2}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/ugy;->c:Ll/l4g0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ugy;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    new-instance v0, Ll/tgy;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/tgy;-><init>(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ugy;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    new-instance v1, Ll/sgy;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/sgy;-><init>(Ll/ugy;Landroid/content/DialogInterface$OnDismissListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m(Ll/l4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ugy;->c:Ll/l4g0;

    .line 2
    .line 3
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ugy;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ugy;->c:Ll/l4g0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
