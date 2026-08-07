.class public final Ll/a0t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t7y;


# instance fields
.field public final synthetic a:Ll/sys0;

.field public final synthetic b:Ll/jxs0;

.field public final synthetic c:Ll/d0t0;


# direct methods
.method public constructor <init>(Ll/d0t0;Ll/sys0;Ll/jxs0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/a0t0;->a:Ll/sys0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/a0t0;->b:Ll/jxs0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/a0t0;->c:Ll/d0t0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/b70;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/a0t0;->a:Ll/sys0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/b70;->d()Lcom/google/android/gms/ads/internal/client/zze;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/sys0;->f(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p1, ""

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
