.class public final Ll/f6w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gl50;


# instance fields
.field public final synthetic a:Ll/e9u0;

.field public final synthetic b:Ll/h6w0;


# direct methods
.method public constructor <init>(Ll/h6w0;Ll/e9u0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/f6w0;->a:Ll/e9u0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/f6w0;->b:Ll/h6w0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final x()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f6w0;->b:Ll/h6w0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h6w0;->p8(Ll/h6w0;)Ll/ksu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Ll/f6w0;->a:Ll/e9u0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/e9u0;->zze()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string v0, "#007 Could not call remote method."

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
