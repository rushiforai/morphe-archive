.class public Landroidx/biometric/FingerprintDialogFragment$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/biometric/FingerprintDialogFragment$a;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/DialogInterface;

.field public final synthetic b:Landroidx/biometric/FingerprintDialogFragment$a;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintDialogFragment$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment$a$a;->b:Landroidx/biometric/FingerprintDialogFragment$a;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/biometric/FingerprintDialogFragment$a$a;->a:Landroid/content/DialogInterface;

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
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment$a$a;->b:Landroidx/biometric/FingerprintDialogFragment$a;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/biometric/FingerprintDialogFragment$a;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/biometric/FingerprintDialogFragment$a$a;->a:Landroid/content/DialogInterface;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroidx/biometric/FingerprintDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
