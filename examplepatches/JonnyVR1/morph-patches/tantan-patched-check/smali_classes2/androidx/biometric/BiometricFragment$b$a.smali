.class public Landroidx/biometric/BiometricFragment$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/BiometricFragment$b;->onAuthenticationError(ILjava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/CharSequence;

.field public final synthetic b:I

.field public final synthetic c:Landroidx/biometric/BiometricFragment$b;


# direct methods
.method public constructor <init>(Landroidx/biometric/BiometricFragment$b;Ljava/lang/CharSequence;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/BiometricFragment$b$a;->c:Landroidx/biometric/BiometricFragment$b;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/BiometricFragment$b$a;->a:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iput p3, p0, Landroidx/biometric/BiometricFragment$b$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/biometric/BiometricFragment$b$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Landroidx/biometric/BiometricFragment$b$a;->c:Landroidx/biometric/BiometricFragment$b;

    .line 11
    .line 12
    iget-object v1, v1, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 13
    .line 14
    invoke-static {v1}, Landroidx/biometric/BiometricFragment;->W3(Landroidx/biometric/BiometricFragment;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Landroidx/biometric/R$string;->b:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, " "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget v1, p0, Landroidx/biometric/BiometricFragment$b$a;->b:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :cond_0
    iget-object v1, p0, Landroidx/biometric/BiometricFragment$b$a;->c:Landroidx/biometric/BiometricFragment$b;

    .line 42
    .line 43
    iget-object v1, v1, Landroidx/biometric/BiometricFragment$b;->a:Landroidx/biometric/BiometricFragment;

    .line 44
    .line 45
    iget-object v1, v1, Landroidx/biometric/BiometricFragment;->D:Landroidx/biometric/BiometricPrompt$b;

    .line 46
    .line 47
    iget v2, p0, Landroidx/biometric/BiometricFragment$b$a;->b:I

    .line 48
    .line 49
    invoke-static {v2}, Ll/aok0;->c(I)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget p0, p0, Landroidx/biometric/BiometricFragment$b$a;->b:I

    .line 59
    .line 60
    :goto_0
    invoke-virtual {v1, p0, v0}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
