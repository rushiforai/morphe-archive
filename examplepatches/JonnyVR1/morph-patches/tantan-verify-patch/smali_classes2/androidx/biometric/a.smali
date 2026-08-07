.class public Landroidx/biometric/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static k:Landroidx/biometric/a;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field public a:I

.field public b:Landroidx/biometric/BiometricFragment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Landroidx/biometric/FingerprintDialogFragment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Landroidx/biometric/FingerprintHelperFragment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Landroid/content/DialogInterface$OnClickListener;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Landroidx/biometric/BiometricPrompt$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Z

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/biometric/a;->i:I

    .line 6
    .line 7
    iput v0, p0, Landroidx/biometric/a;->j:I

    .line 8
    .line 9
    return-void
.end method

.method public static e()Landroidx/biometric/a;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Landroidx/biometric/a;->k:Landroidx/biometric/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/biometric/a;

    .line 6
    .line 7
    invoke-direct {v0}, Landroidx/biometric/a;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Landroidx/biometric/a;->k:Landroidx/biometric/a;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Landroidx/biometric/a;->k:Landroidx/biometric/a;

    .line 13
    .line 14
    return-object v0
.end method

.method public static f()Landroidx/biometric/a;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Landroidx/biometric/a;->k:Landroidx/biometric/a;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Landroidx/biometric/BiometricPrompt$b;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/biometric/a;->g:Landroidx/biometric/BiometricPrompt$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/biometric/a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/biometric/a;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/util/concurrent/Executor;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/biometric/a;->e:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/biometric/a;->j:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Landroidx/biometric/a;->j:I

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Landroidx/biometric/a;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget v0, p0, Landroidx/biometric/a;->j:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/biometric/a;->q()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Landroidx/biometric/a;->a:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Landroidx/biometric/a;->b:Landroidx/biometric/BiometricFragment;

    .line 19
    .line 20
    iput-object v1, p0, Landroidx/biometric/a;->c:Landroidx/biometric/FingerprintDialogFragment;

    .line 21
    .line 22
    iput-object v1, p0, Landroidx/biometric/a;->d:Landroidx/biometric/FingerprintHelperFragment;

    .line 23
    .line 24
    iput-object v1, p0, Landroidx/biometric/a;->e:Ljava/util/concurrent/Executor;

    .line 25
    .line 26
    iput-object v1, p0, Landroidx/biometric/a;->f:Landroid/content/DialogInterface$OnClickListener;

    .line 27
    .line 28
    iput-object v1, p0, Landroidx/biometric/a;->g:Landroidx/biometric/BiometricPrompt$b;

    .line 29
    .line 30
    iput v0, p0, Landroidx/biometric/a;->i:I

    .line 31
    .line 32
    iput-boolean v0, p0, Landroidx/biometric/a;->h:Z

    .line 33
    .line 34
    sput-object v1, Landroidx/biometric/a;->k:Landroidx/biometric/a;

    .line 35
    .line 36
    return-void
.end method

.method public j(Landroidx/biometric/BiometricFragment;)V
    .locals 0
    .param p1    # Landroidx/biometric/BiometricFragment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/biometric/a;->b:Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V
    .locals 3
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/DialogInterface$OnClickListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/biometric/BiometricPrompt$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LambdaLast"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/biometric/a;->e:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/a;->f:Landroid/content/DialogInterface$OnClickListener;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/biometric/a;->g:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/biometric/a;->b:Landroidx/biometric/BiometricFragment;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 12
    .line 13
    const/16 v2, 0x1c

    .line 14
    .line 15
    if-lt v1, v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p1, p2, p3}, Landroidx/biometric/BiometricFragment;->g4(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Landroidx/biometric/a;->c:Landroidx/biometric/FingerprintDialogFragment;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Landroidx/biometric/a;->d:Landroidx/biometric/FingerprintHelperFragment;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Landroidx/biometric/FingerprintDialogFragment;->r4(Landroid/content/DialogInterface$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Landroidx/biometric/a;->d:Landroidx/biometric/FingerprintHelperFragment;

    .line 33
    .line 34
    invoke-virtual {p2, p1, p3}, Landroidx/biometric/FingerprintHelperFragment;->h4(Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$b;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Landroidx/biometric/a;->d:Landroidx/biometric/FingerprintHelperFragment;

    .line 38
    .line 39
    iget-object p0, p0, Landroidx/biometric/a;->c:Landroidx/biometric/FingerprintDialogFragment;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroidx/biometric/FingerprintDialogFragment;->g4()Landroid/os/Handler;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Landroidx/biometric/FingerprintHelperFragment;->j4(Landroid/os/Handler;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public l(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/biometric/a;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/biometric/a;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/biometric/a;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public o(Landroidx/biometric/FingerprintDialogFragment;Landroidx/biometric/FingerprintHelperFragment;)V
    .locals 0
    .param p1    # Landroidx/biometric/FingerprintDialogFragment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroidx/biometric/FingerprintHelperFragment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/biometric/a;->c:Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/a;->d:Landroidx/biometric/FingerprintHelperFragment;

    .line 4
    .line 5
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Landroidx/biometric/a;->j:I

    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/biometric/a;->j:I

    .line 3
    .line 4
    return-void
.end method
