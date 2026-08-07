.class Landroidx/biometric/BiometricPrompt$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/biometric/BiometricPrompt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/biometric/BiometricPrompt;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricPrompt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 2
    .annotation runtime Landroidx/lifecycle/n;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->n(Landroidx/biometric/BiometricPrompt;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->a()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 17
    .line 18
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 25
    .line 26
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroidx/biometric/BiometricFragment;->d4()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->o(Landroidx/biometric/BiometricPrompt;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 43
    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {v1, v0}, Landroidx/biometric/BiometricPrompt;->p(Landroidx/biometric/BiometricPrompt;Z)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Landroidx/biometric/BiometricFragment;->a4()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroidx/biometric/BiometricFragment;->a4()V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 68
    .line 69
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 76
    .line 77
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 84
    .line 85
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 90
    .line 91
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-static {v0, v1}, Landroidx/biometric/BiometricPrompt;->q(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    :goto_0
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 99
    .line 100
    invoke-static {p0}, Landroidx/biometric/BiometricPrompt;->r(Landroidx/biometric/BiometricPrompt;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onResume()V
    .locals 4
    .annotation runtime Landroidx/lifecycle/n;
        value = .enum Landroidx/lifecycle/Lifecycle$Event;->ON_RESUME:Landroidx/lifecycle/Lifecycle$Event;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 2
    .line 3
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 10
    .line 11
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->c(Landroidx/biometric/BiometricPrompt;)Landroidx/fragment/app/FragmentManager;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "BiometricFragment"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroidx/biometric/BiometricFragment;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-static {v0, v1}, Landroidx/biometric/BiometricPrompt;->d(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/BiometricFragment;)Landroidx/biometric/BiometricFragment;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->a()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 35
    .line 36
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 43
    .line 44
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 49
    .line 50
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->m(Landroidx/biometric/BiometricPrompt;)Ljava/util/concurrent/Executor;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 55
    .line 56
    invoke-static {v2}, Landroidx/biometric/BiometricPrompt;->e(Landroidx/biometric/BiometricPrompt;)Landroid/content/DialogInterface$OnClickListener;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 61
    .line 62
    invoke-static {v3}, Landroidx/biometric/BiometricPrompt;->h(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricPrompt$b;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v0, v1, v2, v3}, Landroidx/biometric/BiometricFragment;->g4(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 71
    .line 72
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->c(Landroidx/biometric/BiometricPrompt;)Landroidx/fragment/app/FragmentManager;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "FingerprintDialogFragment"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Landroidx/biometric/FingerprintDialogFragment;

    .line 83
    .line 84
    invoke-static {v0, v1}, Landroidx/biometric/BiometricPrompt;->j(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/FingerprintDialogFragment;)Landroidx/biometric/FingerprintDialogFragment;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 88
    .line 89
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->c(Landroidx/biometric/BiometricPrompt;)Landroidx/fragment/app/FragmentManager;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "FingerprintHelperFragment"

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Landroidx/biometric/FingerprintHelperFragment;

    .line 100
    .line 101
    invoke-static {v0, v1}, Landroidx/biometric/BiometricPrompt;->l(Landroidx/biometric/BiometricPrompt;Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment;

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 105
    .line 106
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 113
    .line 114
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 119
    .line 120
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->e(Landroidx/biometric/BiometricPrompt;)Landroid/content/DialogInterface$OnClickListener;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Landroidx/biometric/FingerprintDialogFragment;->r4(Landroid/content/DialogInterface$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    :cond_2
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 128
    .line 129
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 136
    .line 137
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 142
    .line 143
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->m(Landroidx/biometric/BiometricPrompt;)Ljava/util/concurrent/Executor;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iget-object v2, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 148
    .line 149
    invoke-static {v2}, Landroidx/biometric/BiometricPrompt;->h(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricPrompt$b;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v0, v1, v2}, Landroidx/biometric/FingerprintHelperFragment;->h4(Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$b;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 157
    .line 158
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 165
    .line 166
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iget-object v1, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 171
    .line 172
    invoke-static {v1}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v1}, Landroidx/biometric/FingerprintDialogFragment;->g4()Landroid/os/Handler;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Landroidx/biometric/FingerprintHelperFragment;->j4(Landroid/os/Handler;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    :goto_1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 184
    .line 185
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->f(Landroidx/biometric/BiometricPrompt;)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$2;->this$0:Landroidx/biometric/BiometricPrompt;

    .line 189
    .line 190
    const/4 v0, 0x0

    .line 191
    invoke-static {p0, v0}, Landroidx/biometric/BiometricPrompt;->g(Landroidx/biometric/BiometricPrompt;Z)V

    .line 192
    .line 193
    .line 194
    return-void
.end method
