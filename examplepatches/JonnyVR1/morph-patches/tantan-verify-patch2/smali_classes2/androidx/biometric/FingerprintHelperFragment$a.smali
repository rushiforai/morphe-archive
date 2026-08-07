.class public Landroidx/biometric/FingerprintHelperFragment$a;
.super Ll/loi$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/biometric/FingerprintHelperFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/FingerprintHelperFragment;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintHelperFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/loi$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Landroidx/biometric/FingerprintHelperFragment$a;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$a;->f(ILjava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/CharSequence;)V
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    if-ne p1, v0, :cond_1

    .line 3
    .line 4
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 5
    .line 6
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->W3(Landroidx/biometric/FingerprintHelperFragment;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$a;->f(ILjava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 16
    .line 17
    invoke-static {p0}, Landroidx/biometric/FingerprintHelperFragment;->X3(Landroidx/biometric/FingerprintHelperFragment;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/4 v0, 0x7

    .line 22
    if-eq p1, v0, :cond_5

    .line 23
    .line 24
    const/16 v0, 0x9

    .line 25
    .line 26
    if-ne p1, v0, :cond_2

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    if-eqz p2, :cond_3

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "Got null string for error message: "

    .line 35
    .line 36
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string v0, "FingerprintHelperFrag"

    .line 47
    .line 48
    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 52
    .line 53
    invoke-static {p2}, Landroidx/biometric/FingerprintHelperFragment;->Y3(Landroidx/biometric/FingerprintHelperFragment;)Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget v0, Landroidx/biometric/R$string;->b:I

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    :goto_0
    invoke-static {p1}, Ll/aok0;->c(I)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_4

    .line 72
    .line 73
    const/16 p1, 0x8

    .line 74
    .line 75
    :cond_4
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 76
    .line 77
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x2

    .line 82
    const/4 v2, 0x0

    .line 83
    invoke-virtual {v0, v1, p1, v2, p2}, Landroidx/biometric/FingerprintHelperFragment$b;->b(IIILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 87
    .line 88
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->Z3(Landroidx/biometric/FingerprintHelperFragment;)Landroid/os/Handler;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Landroidx/biometric/FingerprintHelperFragment$a$b;

    .line 93
    .line 94
    invoke-direct {v1, p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$a$b;-><init>(Landroidx/biometric/FingerprintHelperFragment$a;ILjava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Landroidx/biometric/FingerprintDialogFragment;->h4(Landroid/content/Context;)I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    int-to-long p0, p0

    .line 108
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_5
    :goto_1
    invoke-virtual {p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$a;->f(ILjava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 116
    .line 117
    invoke-static {p0}, Landroidx/biometric/FingerprintHelperFragment;->X3(Landroidx/biometric/FingerprintHelperFragment;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 8
    .line 9
    invoke-static {v1}, Landroidx/biometric/FingerprintHelperFragment;->Y3(Landroidx/biometric/FingerprintHelperFragment;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Landroidx/biometric/R$string;->i:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v0, v2, v1}, Landroidx/biometric/FingerprintHelperFragment$b;->c(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 28
    .line 29
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment;->A:Ljava/util/concurrent/Executor;

    .line 30
    .line 31
    new-instance v1, Landroidx/biometric/FingerprintHelperFragment$a$d;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Landroidx/biometric/FingerprintHelperFragment$a$d;-><init>(Landroidx/biometric/FingerprintHelperFragment$a;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public c(ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-static {p0}, Landroidx/biometric/FingerprintHelperFragment;->V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$b;->c(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Ll/loi$d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x5

    .line 8
    invoke-virtual {v0, v1}, Landroidx/biometric/FingerprintHelperFragment$b;->a(I)V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance v0, Landroidx/biometric/BiometricPrompt$c;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/loi$d;->a()Ll/loi$e;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroidx/biometric/FingerprintHelperFragment;->a4(Ll/loi$e;)Landroidx/biometric/BiometricPrompt$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-direct {v0, p1}, Landroidx/biometric/BiometricPrompt$c;-><init>(Landroidx/biometric/BiometricPrompt$d;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    new-instance v0, Landroidx/biometric/BiometricPrompt$c;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-direct {v0, p1}, Landroidx/biometric/BiometricPrompt$c;-><init>(Landroidx/biometric/BiometricPrompt$d;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p1, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 34
    .line 35
    iget-object p1, p1, Landroidx/biometric/FingerprintHelperFragment;->A:Ljava/util/concurrent/Executor;

    .line 36
    .line 37
    new-instance v1, Landroidx/biometric/FingerprintHelperFragment$a$c;

    .line 38
    .line 39
    invoke-direct {v1, p0, v0}, Landroidx/biometric/FingerprintHelperFragment$a$c;-><init>(Landroidx/biometric/FingerprintHelperFragment$a;Landroidx/biometric/BiometricPrompt$c;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 46
    .line 47
    invoke-static {p0}, Landroidx/biometric/FingerprintHelperFragment;->X3(Landroidx/biometric/FingerprintHelperFragment;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final f(ILjava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x3

    .line 8
    invoke-virtual {v0, v1}, Landroidx/biometric/FingerprintHelperFragment$b;->a(I)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/aok0;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 18
    .line 19
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment;->A:Ljava/util/concurrent/Executor;

    .line 20
    .line 21
    new-instance v1, Landroidx/biometric/FingerprintHelperFragment$a$a;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1, p2}, Landroidx/biometric/FingerprintHelperFragment$a$a;-><init>(Landroidx/biometric/FingerprintHelperFragment$a;ILjava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
