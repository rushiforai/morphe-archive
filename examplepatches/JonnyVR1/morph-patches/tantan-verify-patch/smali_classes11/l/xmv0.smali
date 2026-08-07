.class public final Ll/xmv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hpv0;


# direct methods
.method public constructor <init>(Ll/hpv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmv0;->a:Ll/hpv0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xmv0;->a:Ll/hpv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hpv0;->a:Ll/nqv0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/nqv0;->o8(Ll/nqv0;)Ll/xhs0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-static {p0}, Ll/nqv0;->o8(Ll/nqv0;)Ll/xhs0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-interface {p0, v0}, Ll/xhs0;->zze(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string v0, "Could not notify onAdFailedToLoad event."

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
