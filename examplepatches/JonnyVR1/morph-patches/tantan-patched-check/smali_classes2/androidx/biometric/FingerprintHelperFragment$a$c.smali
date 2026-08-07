.class public Landroidx/biometric/FingerprintHelperFragment$a$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/FingerprintHelperFragment$a;->d(Ll/loi$d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/BiometricPrompt$c;

.field public final synthetic b:Landroidx/biometric/FingerprintHelperFragment$a;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintHelperFragment$a;Landroidx/biometric/BiometricPrompt$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment$a$c;->b:Landroidx/biometric/FingerprintHelperFragment$a;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/FingerprintHelperFragment$a$c;->a:Landroidx/biometric/BiometricPrompt$c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a$c;->b:Landroidx/biometric/FingerprintHelperFragment$a;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 4
    .line 5
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment;->B:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a$c;->a:Landroidx/biometric/BiometricPrompt$c;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroidx/biometric/BiometricPrompt$b;->c(Landroidx/biometric/BiometricPrompt$c;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
