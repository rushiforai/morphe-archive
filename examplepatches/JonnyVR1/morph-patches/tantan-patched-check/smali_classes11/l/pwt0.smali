.class public final Ll/pwt0;
.super Ll/sas0;
.source "SourceFile"


# instance fields
.field public final a:Ll/fwt0;

.field public final b:Ll/oys0;

.field public final c:Ll/v1w0;

.field public d:Z

.field public final e:Ll/xwu0;


# direct methods
.method public constructor <init>(Ll/fwt0;Ll/oys0;Ll/v1w0;Ll/xwu0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/sas0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/sgs0;->G0:Ll/dgs0;

    .line 5
    .line 6
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Ll/pwt0;->d:Z

    .line 21
    .line 22
    iput-object p1, p0, Ll/pwt0;->a:Ll/fwt0;

    .line 23
    .line 24
    iput-object p2, p0, Ll/pwt0;->b:Ll/oys0;

    .line 25
    .line 26
    iput-object p3, p0, Ll/pwt0;->c:Ll/v1w0;

    .line 27
    .line 28
    iput-object p4, p0, Ll/pwt0;->e:Ll/xwu0;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final k5(Ll/ycu0;)V
    .locals 2

    .line 1
    const-string v0, "setOnPaidEventListener must be called on the main UI thread."

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkMainThread(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pwt0;->c:Ll/v1w0;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :try_start_0
    invoke-interface {p1}, Ll/ycu0;->zzf()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/pwt0;->e:Ll/xwu0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xwu0;->e()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception v0

    .line 23
    const-string v1, "Error in making CSI ping for reporting paid event callback"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/dct0;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/pwt0;->c:Ll/v1w0;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/v1w0;->B(Ll/ycu0;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final m2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pwt0;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public final n5(Ll/p1m;Ll/abs0;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pwt0;->c:Ll/v1w0;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/v1w0;->K(Ll/abs0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pwt0;->a:Ll/fwt0;

    .line 7
    .line 8
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/app/Activity;

    .line 13
    .line 14
    iget-boolean p0, p0, Ll/pwt0;->d:Z

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2, p0}, Ll/fwt0;->k(Landroid/app/Activity;Ll/abs0;Z)V
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
    const-string p1, "#007 Could not call remote method."

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final zze()Ll/oys0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pwt0;->b:Ll/oys0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzf()Ll/tlu0;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->N6:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/pwt0;->a:Ll/fwt0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/kzt0;->d()Ll/b6u0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
