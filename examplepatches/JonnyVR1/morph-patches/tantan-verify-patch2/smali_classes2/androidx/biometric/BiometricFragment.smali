.class public Landroidx/biometric/BiometricFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SyntheticAccessor"
    }
.end annotation

.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field public A:Landroid/os/Bundle;

.field public B:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public C:Landroid/content/DialogInterface$OnClickListener;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public D:Landroidx/biometric/BiometricPrompt$b;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public E:Landroidx/biometric/BiometricPrompt$d;

.field public F:Ljava/lang/CharSequence;

.field public G:Z

.field public H:Landroid/hardware/biometrics/BiometricPrompt;

.field public I:Landroid/os/CancellationSignal;

.field public J:Z

.field public final K:Landroid/os/Handler;

.field public final L:Ljava/util/concurrent/Executor;

.field public final M:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final N:Landroid/content/DialogInterface$OnClickListener;

.field public final O:Landroid/content/DialogInterface$OnClickListener;

.field public z:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->K:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Landroidx/biometric/BiometricFragment$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricFragment$a;-><init>(Landroidx/biometric/BiometricFragment;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->L:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    new-instance v0, Landroidx/biometric/BiometricFragment$b;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricFragment$b;-><init>(Landroidx/biometric/BiometricFragment;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->M:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    .line 28
    .line 29
    new-instance v0, Landroidx/biometric/BiometricFragment$c;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricFragment$c;-><init>(Landroidx/biometric/BiometricFragment;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->N:Landroid/content/DialogInterface$OnClickListener;

    .line 35
    .line 36
    new-instance v0, Landroidx/biometric/BiometricFragment$d;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricFragment$d;-><init>(Landroidx/biometric/BiometricFragment;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->O:Landroid/content/DialogInterface$OnClickListener;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic V3(Landroidx/biometric/BiometricFragment;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->K:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W3(Landroidx/biometric/BiometricFragment;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->z:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X3(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Landroidx/biometric/BiometricPrompt$d;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/biometric/BiometricFragment;->i4(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Landroidx/biometric/BiometricPrompt$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y3(Landroidx/biometric/BiometricFragment;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Landroidx/biometric/BiometricFragment;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/biometric/BiometricFragment;->J:Z

    .line 2
    .line 3
    return p1
.end method

.method public static e4()Landroidx/biometric/BiometricFragment;
    .locals 1

    .line 1
    new-instance v0, Landroidx/biometric/BiometricFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/biometric/BiometricFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static i4(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Landroidx/biometric/BiometricPrompt$d;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {p0}, Ll/a03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljavax/crypto/Cipher;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    new-instance v0, Landroidx/biometric/BiometricPrompt$d;

    .line 12
    .line 13
    invoke-static {p0}, Ll/a03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljavax/crypto/Cipher;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricPrompt$d;-><init>(Ljavax/crypto/Cipher;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    invoke-static {p0}, Ll/b03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljava/security/Signature;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    new-instance v0, Landroidx/biometric/BiometricPrompt$d;

    .line 28
    .line 29
    invoke-static {p0}, Ll/b03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljava/security/Signature;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricPrompt$d;-><init>(Ljava/security/Signature;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_2
    invoke-static {p0}, Ll/c03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljavax/crypto/Mac;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    new-instance v0, Landroidx/biometric/BiometricPrompt$d;

    .line 44
    .line 45
    invoke-static {p0}, Ll/c03;->a(Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;)Ljavax/crypto/Mac;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Landroidx/biometric/BiometricPrompt$d;-><init>(Ljavax/crypto/Mac;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-object v0
.end method

.method public static j4(Landroidx/biometric/BiometricPrompt$d;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->a()Ljavax/crypto/Cipher;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/xz2;->a()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->a()Ljavax/crypto/Cipher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/l03;->a(Ljavax/crypto/Cipher;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->c()Ljava/security/Signature;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-static {}, Ll/xz2;->a()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->c()Ljava/security/Signature;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Ll/vz2;->a(Ljava/security/Signature;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->b()Ljavax/crypto/Mac;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Ll/xz2;->a()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->b()Ljavax/crypto/Mac;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ll/wz2;->a(Ljavax/crypto/Mac;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_3
    return-object v0
.end method


# virtual methods
.method public a4()V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/biometric/BiometricFragment;->d4()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Landroidx/biometric/BiometricFragment;->J:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/biometric/BiometricFragment;->I:Landroid/os/CancellationSignal;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Landroidx/biometric/BiometricFragment;->b4()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b4()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/biometric/BiometricFragment;->G:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1, p0}, Landroidx/fragment/app/k;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {v0}, Ll/aok0;->f(Landroidx/fragment/app/FragmentActivity;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c4()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->F:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public d4()Z
    .locals 2

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string v1, "allow_device_credential"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public f4(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 2
    .line 3
    return-void
.end method

.method public g4(Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;Landroidx/biometric/BiometricPrompt$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/BiometricFragment;->C:Landroid/content/DialogInterface$OnClickListener;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/biometric/BiometricFragment;->D:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    return-void
.end method

.method public h4(Landroidx/biometric/BiometricPrompt$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment;->E:Landroidx/biometric/BiometricPrompt$d;

    .line 2
    .line 3
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/biometric/BiometricFragment;->z:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setRetainInstance(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/biometric/BiometricFragment;->G:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_5

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 7
    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    const-string v2, "negative_text"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->F:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-static {}, Ll/zz2;->a()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/yz2;->a(Landroid/content/Context;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 30
    .line 31
    const-string v3, "title"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v0, v2}, Ll/uz2;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 42
    .line 43
    const-string v4, "subtitle"

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v2, v3}, Ll/d03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 54
    .line 55
    const-string v4, "description"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {v2, v3}, Ll/e03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 65
    .line 66
    const-string v3, "allow_device_credential"

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_0

    .line 73
    .line 74
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 75
    .line 76
    const/16 v4, 0x1c

    .line 77
    .line 78
    if-gt v3, v4, :cond_0

    .line 79
    .line 80
    sget v3, Landroidx/biometric/R$string;->a:I

    .line 81
    .line 82
    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    iput-object v3, p0, Landroidx/biometric/BiometricFragment;->F:Ljava/lang/CharSequence;

    .line 87
    .line 88
    iget-object v4, p0, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 89
    .line 90
    iget-object v5, p0, Landroidx/biometric/BiometricFragment;->O:Landroid/content/DialogInterface$OnClickListener;

    .line 91
    .line 92
    invoke-static {v0, v3, v4, v5}, Ll/f03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->F:Ljava/lang/CharSequence;

    .line 97
    .line 98
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_1

    .line 103
    .line 104
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->F:Ljava/lang/CharSequence;

    .line 105
    .line 106
    iget-object v4, p0, Landroidx/biometric/BiometricFragment;->B:Ljava/util/concurrent/Executor;

    .line 107
    .line 108
    iget-object v5, p0, Landroidx/biometric/BiometricFragment;->N:Landroid/content/DialogInterface$OnClickListener;

    .line 109
    .line 110
    invoke-static {v0, v3, v4, v5}, Ll/f03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Ljava/lang/CharSequence;Ljava/util/concurrent/Executor;Landroid/content/DialogInterface$OnClickListener;)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 111
    .line 112
    .line 113
    :cond_1
    :goto_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 114
    .line 115
    const/16 v4, 0x1d

    .line 116
    .line 117
    if-lt v3, v4, :cond_2

    .line 118
    .line 119
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->A:Landroid/os/Bundle;

    .line 120
    .line 121
    const-string v4, "require_confirmation"

    .line 122
    .line 123
    invoke-virtual {v3, v4, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    invoke-static {v0, v3}, Ll/g03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v2}, Ll/h03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;Z)Landroid/hardware/biometrics/BiometricPrompt$Builder;

    .line 131
    .line 132
    .line 133
    :cond_2
    if-eqz v2, :cond_3

    .line 134
    .line 135
    const/4 v2, 0x0

    .line 136
    iput-boolean v2, p0, Landroidx/biometric/BiometricFragment;->J:Z

    .line 137
    .line 138
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->K:Landroid/os/Handler;

    .line 139
    .line 140
    new-instance v3, Landroidx/biometric/BiometricFragment$e;

    .line 141
    .line 142
    invoke-direct {v3, p0}, Landroidx/biometric/BiometricFragment$e;-><init>(Landroidx/biometric/BiometricFragment;)V

    .line 143
    .line 144
    .line 145
    const-wide/16 v4, 0xfa

    .line 146
    .line 147
    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 148
    .line 149
    .line 150
    :cond_3
    invoke-static {v0}, Ll/i03;->a(Landroid/hardware/biometrics/BiometricPrompt$Builder;)Landroid/hardware/biometrics/BiometricPrompt;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->H:Landroid/hardware/biometrics/BiometricPrompt;

    .line 155
    .line 156
    new-instance v0, Landroid/os/CancellationSignal;

    .line 157
    .line 158
    invoke-direct {v0}, Landroid/os/CancellationSignal;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v0, p0, Landroidx/biometric/BiometricFragment;->I:Landroid/os/CancellationSignal;

    .line 162
    .line 163
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->E:Landroidx/biometric/BiometricPrompt$d;

    .line 164
    .line 165
    iget-object v3, p0, Landroidx/biometric/BiometricFragment;->H:Landroid/hardware/biometrics/BiometricPrompt;

    .line 166
    .line 167
    if-nez v2, :cond_4

    .line 168
    .line 169
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->L:Ljava/util/concurrent/Executor;

    .line 170
    .line 171
    iget-object v4, p0, Landroidx/biometric/BiometricFragment;->M:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    .line 172
    .line 173
    invoke-static {v3, v0, v2, v4}, Ll/j03;->a(Landroid/hardware/biometrics/BiometricPrompt;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;)V

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_4
    invoke-static {v2}, Landroidx/biometric/BiometricFragment;->j4(Landroidx/biometric/BiometricPrompt$d;)Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object v2, p0, Landroidx/biometric/BiometricFragment;->I:Landroid/os/CancellationSignal;

    .line 182
    .line 183
    iget-object v4, p0, Landroidx/biometric/BiometricFragment;->L:Ljava/util/concurrent/Executor;

    .line 184
    .line 185
    iget-object v5, p0, Landroidx/biometric/BiometricFragment;->M:Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;

    .line 186
    .line 187
    invoke-static {v3, v0, v2, v4, v5}, Ll/k03;->a(Landroid/hardware/biometrics/BiometricPrompt;Landroid/hardware/biometrics/BiometricPrompt$CryptoObject;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Landroid/hardware/biometrics/BiometricPrompt$AuthenticationCallback;)V

    .line 188
    .line 189
    .line 190
    :cond_5
    :goto_1
    iput-boolean v1, p0, Landroidx/biometric/BiometricFragment;->G:Z

    .line 191
    .line 192
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0
.end method
