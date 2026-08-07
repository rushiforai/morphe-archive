.class public final synthetic Ll/bev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/izt0;


# instance fields
.field public final synthetic a:Ll/scv0;


# direct methods
.method public synthetic constructor <init>(Ll/scv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bev0;->a:Ll/scv0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()Ll/lpu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bev0;->a:Ll/scv0;

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Ll/scv0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ll/hzs0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/hzs0;->zze()Ll/lpu0;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method
