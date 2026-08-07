.class public Landroidx/biometric/FingerprintHelperFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SyntheticAccessor"
    }
.end annotation

.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/biometric/FingerprintHelperFragment$b;
    }
.end annotation


# instance fields
.field public A:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public B:Landroidx/biometric/BiometricPrompt$b;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public C:Landroid/os/Handler;

.field public D:Z

.field public E:Landroidx/biometric/BiometricPrompt$d;

.field public F:Landroid/content/Context;

.field public G:I

.field public H:Ll/fg4;

.field public final I:Ll/loi$c;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public z:Landroidx/biometric/FingerprintHelperFragment$b;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroidx/biometric/FingerprintHelperFragment$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Landroidx/biometric/FingerprintHelperFragment$a;-><init>(Landroidx/biometric/FingerprintHelperFragment;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->I:Ll/loi$c;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic V3(Landroidx/biometric/FingerprintHelperFragment;)Landroidx/biometric/FingerprintHelperFragment$b;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment;->z:Landroidx/biometric/FingerprintHelperFragment$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W3(Landroidx/biometric/FingerprintHelperFragment;)I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/biometric/FingerprintHelperFragment;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic X3(Landroidx/biometric/FingerprintHelperFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/biometric/FingerprintHelperFragment;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y3(Landroidx/biometric/FingerprintHelperFragment;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment;->F:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Landroidx/biometric/FingerprintHelperFragment;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment;->C:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Ll/loi$e;)Landroidx/biometric/BiometricPrompt$d;
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/biometric/FingerprintHelperFragment;->k4(Ll/loi$e;)Landroidx/biometric/BiometricPrompt$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private c4()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/biometric/FingerprintHelperFragment;->D:Z

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
    invoke-static {}, Ll/aok0;->a()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_1

    .line 34
    .line 35
    invoke-static {v0}, Ll/aok0;->f(Landroidx/fragment/app/FragmentActivity;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public static f4()Landroidx/biometric/FingerprintHelperFragment;
    .locals 1

    .line 1
    new-instance v0, Landroidx/biometric/FingerprintHelperFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/biometric/FingerprintHelperFragment;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static k4(Ll/loi$e;)Landroidx/biometric/BiometricPrompt$d;
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
    invoke-virtual {p0}, Ll/loi$e;->a()Ljavax/crypto/Cipher;

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
    invoke-virtual {p0}, Ll/loi$e;->a()Ljavax/crypto/Cipher;

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
    invoke-virtual {p0}, Ll/loi$e;->c()Ljava/security/Signature;

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
    invoke-virtual {p0}, Ll/loi$e;->c()Ljava/security/Signature;

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
    invoke-virtual {p0}, Ll/loi$e;->b()Ljavax/crypto/Mac;

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
    invoke-virtual {p0}, Ll/loi$e;->b()Ljavax/crypto/Mac;

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

.method public static l4(Landroidx/biometric/BiometricPrompt$d;)Ll/loi$e;
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
    new-instance v0, Ll/loi$e;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->a()Ljavax/crypto/Cipher;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Ll/loi$e;-><init>(Ljavax/crypto/Cipher;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->c()Ljava/security/Signature;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    new-instance v0, Ll/loi$e;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->c()Ljava/security/Signature;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Ll/loi$e;-><init>(Ljava/security/Signature;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_2
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->b()Ljavax/crypto/Mac;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    new-instance v0, Ll/loi$e;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$d;->b()Ljavax/crypto/Mac;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v0, p0}, Ll/loi$e;-><init>(Ljavax/crypto/Mac;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-object v0
.end method


# virtual methods
.method public b4(I)V
    .locals 1

    .line 1
    iput p1, p0, Landroidx/biometric/FingerprintHelperFragment;->G:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    const/16 p1, 0xa

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintHelperFragment;->g4(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Landroidx/biometric/FingerprintHelperFragment;->H:Ll/fg4;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/fg4;->a()V

    .line 16
    .line 17
    .line 18
    :cond_1
    invoke-direct {p0}, Landroidx/biometric/FingerprintHelperFragment;->c4()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final d4(Landroid/content/Context;I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p2, p0, :cond_0

    .line 3
    .line 4
    packed-switch p2, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "Unknown error code: "

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p2, "FingerprintHelperFrag"

    .line 22
    .line 23
    invoke-static {p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    sget p0, Landroidx/biometric/R$string;->b:I

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :pswitch_0
    sget p0, Landroidx/biometric/R$string;->e:I

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :pswitch_1
    sget p0, Landroidx/biometric/R$string;->g:I

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :pswitch_2
    sget p0, Landroidx/biometric/R$string;->h:I

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    sget p0, Landroidx/biometric/R$string;->d:I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e4(Ll/loi;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/loi;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/16 p1, 0xc

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintHelperFragment;->g4(I)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-virtual {p1}, Ll/loi;->e()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    const/16 p1, 0xb

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/biometric/FingerprintHelperFragment;->g4(I)V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final g4(I)V
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
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->B:Landroidx/biometric/BiometricPrompt$b;

    .line 8
    .line 9
    iget-object v1, p0, Landroidx/biometric/FingerprintHelperFragment;->F:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {p0, v1, p1}, Landroidx/biometric/FingerprintHelperFragment;->d4(Landroid/content/Context;I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p1, p0}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public h4(Ljava/util/concurrent/Executor;Landroidx/biometric/BiometricPrompt$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment;->A:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/FingerprintHelperFragment;->B:Landroidx/biometric/BiometricPrompt$b;

    .line 4
    .line 5
    return-void
.end method

.method public i4(Landroidx/biometric/BiometricPrompt$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment;->E:Landroidx/biometric/BiometricPrompt$d;

    .line 2
    .line 3
    return-void
.end method

.method public j4(Landroid/os/Handler;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment;->C:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v0, Landroidx/biometric/FingerprintHelperFragment$b;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Landroidx/biometric/FingerprintHelperFragment$b;-><init>(Landroid/os/Handler;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->z:Landroidx/biometric/FingerprintHelperFragment$b;

    .line 9
    .line 10
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
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment;->F:Landroid/content/Context;

    .line 13
    .line 14
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
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
    iget-boolean v0, p0, Landroidx/biometric/FingerprintHelperFragment;->D:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/fg4;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/fg4;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->H:Ll/fg4;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Landroidx/biometric/FingerprintHelperFragment;->G:I

    .line 14
    .line 15
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->F:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {v0}, Ll/loi;->c(Landroid/content/Context;)Ll/loi;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v1}, Landroidx/biometric/FingerprintHelperFragment;->e4(Ll/loi;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->z:Landroidx/biometric/FingerprintHelperFragment$b;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-virtual {v0, v1}, Landroidx/biometric/FingerprintHelperFragment$b;->a(I)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Landroidx/biometric/FingerprintHelperFragment;->c4()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment;->E:Landroidx/biometric/BiometricPrompt$d;

    .line 38
    .line 39
    invoke-static {v0}, Landroidx/biometric/FingerprintHelperFragment;->l4(Landroidx/biometric/BiometricPrompt$d;)Ll/loi$e;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v4, p0, Landroidx/biometric/FingerprintHelperFragment;->H:Ll/fg4;

    .line 44
    .line 45
    iget-object v5, p0, Landroidx/biometric/FingerprintHelperFragment;->I:Ll/loi$c;

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    const/4 v3, 0x0

    .line 49
    invoke-virtual/range {v1 .. v6}, Ll/loi;->b(Ll/loi$e;ILl/fg4;Ll/loi$c;Landroid/os/Handler;)V

    .line 50
    .line 51
    .line 52
    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Landroidx/biometric/FingerprintHelperFragment;->D:Z

    .line 54
    .line 55
    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method
