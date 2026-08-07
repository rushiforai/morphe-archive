.class public Landroidx/biometric/FingerprintDialogFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/biometric/FingerprintDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/biometric/FingerprintDialogFragment;


# direct methods
.method public constructor <init>(Landroidx/biometric/FingerprintDialogFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/biometric/FingerprintDialogFragment$a;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    const/4 v0, -0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Landroidx/biometric/FingerprintDialogFragment$a;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 5
    .line 6
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object v0, p0, Landroidx/biometric/FingerprintDialogFragment$a;->a:Landroidx/biometric/FingerprintDialogFragment;

    .line 11
    .line 12
    invoke-static {v0}, Landroidx/biometric/FingerprintDialogFragment;->a4(Landroidx/biometric/FingerprintDialogFragment;)Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroidx/biometric/FingerprintDialogFragment$a$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Landroidx/biometric/FingerprintDialogFragment$a$a;-><init>(Landroidx/biometric/FingerprintDialogFragment$a;Landroid/content/DialogInterface;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "FingerprintDialogFrag"

    .line 22
    .line 23
    invoke-static {p0, p2, v0, v1}, Ll/aok0;->e(Ljava/lang/String;Landroidx/fragment/app/FragmentActivity;Landroid/os/Bundle;Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
