.class public Ll/loi$a;
.super Landroid/hardware/fingerprint/FingerprintManager$AuthenticationCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/loi;->h(Ll/loi$c;)Landroid/hardware/fingerprint/FingerprintManager$AuthenticationCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/loi$c;


# direct methods
.method public constructor <init>(Ll/loi$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/loi$a;->a:Ll/loi$c;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/fingerprint/FingerprintManager$AuthenticationCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAuthenticationError(ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loi$a;->a:Ll/loi$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/loi$c;->a(ILjava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAuthenticationFailed()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loi$a;->a:Ll/loi$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/loi$c;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAuthenticationHelp(ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/loi$a;->a:Ll/loi$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/loi$c;->c(ILjava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAuthenticationSucceeded(Landroid/hardware/fingerprint/FingerprintManager$AuthenticationResult;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/loi$a;->a:Ll/loi$c;

    .line 2
    .line 3
    new-instance v0, Ll/loi$d;

    .line 4
    .line 5
    invoke-static {p1}, Ll/loi$b;->b(Ljava/lang/Object;)Landroid/hardware/fingerprint/FingerprintManager$CryptoObject;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/loi;->g(Landroid/hardware/fingerprint/FingerprintManager$CryptoObject;)Ll/loi$e;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {v0, p1}, Ll/loi$d;-><init>(Ll/loi$e;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/loi$c;->d(Ll/loi$d;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
