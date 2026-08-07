.class public Landroidx/biometric/BiometricFragment$b;
.super Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/biometric/BiometricFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/BiometricFragment;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/aok0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 8
    .line 9
    iget-object v0, v0, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 10
    .line 11
    new-instance v1, Landroidx/biometric/BiometricFragment$b$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p2, p1}, Landroidx/biometric/BiometricFragment$b$a;-><init>(Landroidx/biometric/BiometricFragment$b;Ljava/lang/CharSequence;I)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/biometric/BiometricFragment;->b4()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onAuthenticationFailed()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    new-instance v1, Landroidx/biometric/BiometricFragment$b$c;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Landroidx/biometric/BiometricFragment$b$c;-><init>(Landroidx/biometric/BiometricFragment$b;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAuthenticationHelp(ILjava/lang/CharSequence;)V
    .locals 0

    return-void
.end method

.method public onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Landroidx/biometric/BiometricPrompt$c;

    .line 4
    .line 5
    invoke-static {p1}, Ll/m03;->a(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroidx/biometric/BiometricFragment;->X3(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Landroidx/biometric/BiometricPrompt$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {v0, p1}, Landroidx/biometric/BiometricPrompt$c;-><init>(Landroidx/biometric/BiometricPrompt$d;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Landroidx/biometric/BiometricPrompt$c;

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-direct {v0, p1}, Landroidx/biometric/BiometricPrompt$c;-><init>(Landroidx/biometric/BiometricPrompt$d;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p1, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 24
    .line 25
    iget-object p1, p1, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 26
    .line 27
    new-instance v1, Landroidx/biometric/BiometricFragment$b$b;

    .line 28
    .line 29
    invoke-direct {v1, p0, v0}, Landroidx/biometric/BiometricFragment$b$b;-><init>(Landroidx/biometric/BiometricFragment$b;Landroidx/biometric/BiometricPrompt$c;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/biometric/BiometricFragment;->b4()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
