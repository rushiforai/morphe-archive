.class public Landroidx/biometric/BiometricPrompt$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/BiometricPrompt$a;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/BiometricPrompt$a;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricPrompt$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    invoke-static {}, Landroidx/biometric/BiometricPrompt;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    const/16 v2, 0xd

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 12
    .line 13
    iget-object v0, v0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 14
    .line 15
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 22
    .line 23
    iget-object v0, v0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 24
    .line 25
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroidx/biometric/BiometricFragment;->c4()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 34
    .line 35
    iget-object v3, v3, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 36
    .line 37
    invoke-static {v3}, Landroidx/biometric/BiometricPrompt;->h(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricPrompt$b;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    move-object v1, v0

    .line 44
    :cond_0
    invoke-virtual {v3, v2, v1}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 48
    .line 49
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 50
    .line 51
    invoke-static {p0}, Landroidx/biometric/BiometricPrompt;->b(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricFragment;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Landroidx/biometric/BiometricFragment;->b4()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 60
    .line 61
    iget-object v0, v0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 62
    .line 63
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 70
    .line 71
    iget-object v0, v0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 72
    .line 73
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    iget-object v0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 80
    .line 81
    iget-object v0, v0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 82
    .line 83
    invoke-static {v0}, Landroidx/biometric/BiometricPrompt;->i(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintDialogFragment;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Landroidx/biometric/FingerprintDialogFragment;->i4()Ljava/lang/CharSequence;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v3, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 92
    .line 93
    iget-object v3, v3, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 94
    .line 95
    invoke-static {v3}, Landroidx/biometric/BiometricPrompt;->h(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/BiometricPrompt$b;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    move-object v1, v0

    .line 102
    :cond_2
    invoke-virtual {v3, v2, v1}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$a$a;->a:Landroidx/biometric/BiometricPrompt$a;

    .line 106
    .line 107
    iget-object p0, p0, Landroidx/biometric/BiometricPrompt$a;->a:Landroidx/biometric/BiometricPrompt;

    .line 108
    .line 109
    invoke-static {p0}, Landroidx/biometric/BiometricPrompt;->k(Landroidx/biometric/BiometricPrompt;)Landroidx/biometric/FingerprintHelperFragment;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const/4 v0, 0x2

    .line 114
    invoke-virtual {p0, v0}, Landroidx/biometric/FingerprintHelperFragment;->b4(I)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    const-string p0, "BiometricPromptCompat"

    .line 119
    .line 120
    const-string v0, "Negative button callback not run. Fragment was null."

    .line 121
    .line 122
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    return-void
.end method
