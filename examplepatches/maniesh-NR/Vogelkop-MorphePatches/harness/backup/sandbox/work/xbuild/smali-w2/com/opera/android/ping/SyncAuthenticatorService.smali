.class public Lcom/opera/android/ping/SyncAuthenticatorService;
.super Landroid/app/Service;
.source "SourceFile"


# instance fields
.field public a:Lnwk;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    iget-object p0, p0, Lcom/opera/android/ping/SyncAuthenticatorService;->a:Lnwk;

    invoke-virtual {p0}, Landroid/accounts/AbstractAccountAuthenticator;->getIBinder()Landroid/os/IBinder;

    move-result-object p0

    return-object p0
.end method

.method public final onCreate()V
    .registers 2

    new-instance v0, Lnwk;

    invoke-direct {v0, p0}, Landroid/accounts/AbstractAccountAuthenticator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/opera/android/ping/SyncAuthenticatorService;->a:Lnwk;

    return-void
.end method
