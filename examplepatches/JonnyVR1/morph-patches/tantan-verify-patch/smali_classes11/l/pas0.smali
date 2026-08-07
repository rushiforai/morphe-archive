.class public final Ll/pas0;
.super Ll/bx0;
.source "SourceFile"


# instance fields
.field public final a:Ll/tas0;

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final c:Ll/qas0;


# direct methods
.method public constructor <init>(Ll/tas0;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bx0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qas0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qas0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pas0;->c:Ll/qas0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/pas0;->a:Ll/tas0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/pas0;->b:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Ll/n5d0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/pas0;->a:Ll/tas0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/tas0;->zzf()Ll/tlu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, "#007 Could not call remote method."

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    :goto_0
    invoke-static {p0}, Ll/n5d0;->e(Ll/tlu0;)Ll/n5d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final c(Landroid/app/Activity;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pas0;->a:Ll/tas0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/pas0;->c:Ll/qas0;

    .line 8
    .line 9
    invoke-interface {v0, p1, p0}, Ll/tas0;->n5(Ll/p1m;Ll/abs0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    const-string p1, "#007 Could not call remote method."

    .line 15
    .line 16
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
