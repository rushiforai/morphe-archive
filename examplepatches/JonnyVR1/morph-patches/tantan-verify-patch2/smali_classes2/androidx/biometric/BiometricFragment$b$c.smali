.class public Landroidx/biometric/BiometricFragment$b$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/BiometricFragment$b;->onAuthenticationFailed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/BiometricFragment$b;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricFragment$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment$b$c;->a:Landroidx/biometric/BiometricFragment$b;

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
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/biometric/BiometricFragment$b$c;->a:Landroidx/biometric/BiometricFragment$b;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/biometric/BiometricFragment;->D:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/biometric/BiometricPrompt$b;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
