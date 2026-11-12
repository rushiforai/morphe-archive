.class public final Lcw7;
.super Lk83;
.source "SourceFile"


# instance fields
.field public final c:Ldb;

.field public final d:Lmni;


# direct methods
.method public constructor <init>(Ldb;Lmni;)V
    .registers 5

    const-class v0, Lcom/opera/android/account/auth/EditProfileAuthActivity;

    const v1, 0xabba

    invoke-direct {p0, v0, v1}, Lk83;-><init>(Ljava/lang/Class;I)V

    iput-object p1, p0, Lcw7;->c:Ldb;

    iput-object p2, p0, Lcw7;->d:Lmni;

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    invoke-super {p0, p1, p2, p3}, Lk83;->onActivityResult(IILandroid/content/Intent;)V

    new-instance p1, Lrl;

    const/4 p2, 0x4

    invoke-direct {p1, p2}, Lrl;-><init>(B)V

    new-instance p2, Lvk2;

    const/4 p3, 0x5

    invoke-direct {p2, p3}, Lvk2;-><init>(B)V

    const/4 p3, 0x1

    iget-object v0, p0, Lcw7;->c:Ldb;

    invoke-virtual {v0, p3, p1, p2}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    iget-object p0, p0, Lcw7;->d:Lmni;

    if-eqz p0, :cond_1c

    invoke-virtual {p0}, Lmni;->run()V

    :cond_1c
    return-void
.end method
