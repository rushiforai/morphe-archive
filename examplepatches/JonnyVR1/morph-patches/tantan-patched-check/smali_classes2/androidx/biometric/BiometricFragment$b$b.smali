.class public Landroidx/biometric/BiometricFragment$b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/BiometricFragment$b;->onAuthenticationSucceeded(Landroid/hardware/biometrics/BiometricPrompt$AuthenticationResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/BiometricPrompt$c;

.field public final synthetic b:Landroidx/biometric/BiometricFragment$b;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricFragment$b;Landroidx/biometric/BiometricPrompt$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment$b$b;->b:Landroidx/biometric/BiometricFragment$b;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/BiometricFragment$b$b;->a:Landroidx/biometric/BiometricPrompt$c;

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
    iget-object v0, p0, Landroidx/biometric/BiometricFragment$b$b;->b:Landroidx/biometric/BiometricFragment$b;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 4
    .line 5
    iget-object v0, v0, Landroidx/biometric/BiometricFragment;->D:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    iget-object p0, p0, Landroidx/biometric/BiometricFragment$b$b;->a:Landroidx/biometric/BiometricPrompt$c;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroidx/biometric/BiometricPrompt$b;->c(Landroidx/biometric/BiometricPrompt$c;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
