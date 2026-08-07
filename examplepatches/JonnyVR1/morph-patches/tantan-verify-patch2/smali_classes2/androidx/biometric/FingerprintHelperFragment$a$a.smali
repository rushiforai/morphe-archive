.class public Landroidx/biometric/FingerprintHelperFragment$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/FingerprintHelperFragment$a;->f(ILjava/lang/CharSequence;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/CharSequence;

.field public final synthetic c:Landroidx/biometric/FingerprintHelperFragment$a;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintHelperFragment$a;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->c:Landroidx/biometric/FingerprintHelperFragment$a;

    .line 2
    .line 3
    iput p2, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->b:Ljava/lang/CharSequence;

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
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->c:Landroidx/biometric/FingerprintHelperFragment$a;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment$a;->a:Landroidx/biometric/FingerprintHelperFragment;

    .line 4
    .line 5
    iget-object v0, v0, Landroidx/biometric/FingerprintHelperFragment;->B:Landroidx/biometric/BiometricPrompt$b;

    .line 6
    .line 7
    iget v1, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->a:I

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/biometric/FingerprintHelperFragment$a$a;->b:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Landroidx/biometric/BiometricPrompt$b;->a(ILjava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
